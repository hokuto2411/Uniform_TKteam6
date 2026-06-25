<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order"%>
<%@page import="java.util.ArrayList,dao.OrderDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="util.MyFormat"%>
<%
MyFormat fmt = new MyFormat();
ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("order_list");
int lastmonth = (int) request.getAttribute("lastmonth");
int lastmonth2;
if (lastmonth == 1) {
	lastmonth2 = 12;
} else {
	lastmonth2 = lastmonth - 1;
}
OrderDAO orderDaoObj = new OrderDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/Owner.css" />
<title>listOrder</title>
</head>
<body>
	<%@include file="/common/header_Owner.jsp"%>
	<div class="container">
	<%@include file="/common/sidebar_Owner.jsp"%>
	<main>
	<h1>注文履歴一覧画面(オーナー)</h1>
	
	<%
	if (list != null || list.size() != 0) {
	%>
	<div style="margin-left:0px">
		<p><%=lastmonth%>月の売り上げ（発送完了分）
			<%=fmt.moneyFormat(orderDaoObj.sumPriceByMonth(lastmonth))%></p>
		<p><%=lastmonth2%>月の売り上げ（発送完了分）
			<%=fmt.moneyFormat(orderDaoObj.sumPriceByMonth(lastmonth2))%></p>
	</div>


	<table style="margin: auto; width:100%; table-layout:fixed;">
		<tr>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">注文No.</th>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">ユーザーID</th>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">合計金額</th>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">入金状況</th>
			<th colspan="2" style="background-color: #00FFFF; text-align: center; vertical-align: middle;">コメント</th>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">変更</th>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">削除</th>
		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			Order order = (Order) list.get(i);
			String depoSta = "";
			if(order.getDeposit() == 0){
				depoSta = "入金待ち";
			} else{
				depoSta = "入金済";
			}
			String sendSta = "";
			if(order.getSend() == 0){
				sendSta = "入金待ち";
			} else{
				sendSta = "入金済";
			}
	%>
		<tr>
			<td style="text-align: center; width: 200px"><a
				href="<%=request.getContextPath()%>/detail?orderno=<%=order.getOrderno()%>&cmd=detail"><%=order.getOrderno()%></a></td>
			<td style="text-align: center; width: 200px"><%=order.getUserno()%></td>
			<td style="text-align: center; width: 200px"><%=fmt.moneyFormat(order.getSumprice())%></td>
			<td style="text-align: center; width: 200px"><%=order.getOrderdate()%></td>
			<td style="text-align: center; width: 200px"><%=depoSta%></td>
			<td style="text-align: center; width: 200px"><%=sendSta%></td>
			<td style="text-align: center; width: 200px" colspan="2"><%=order.getOrdercomment()%></td>
			<td style="text-align: center; width: 125px"><a
				href="<%=request.getContextPath() %>/detail?orderno=<%=order.getOrderno()%>&cmd=update">変更</a>
			</td>
			<td style="text-align: left; width: 125px"><a
				href="<%=request.getContextPath()%>/delete?orderno=<%=order.getOrderno()%>&cmd=delete">削除</a>
			</td>
		</tr>
	</table>
	<%
	}
	}else{
	%>
	<h1>まだ何も注文していません。</h1>
	<%}%>
	</main>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>
