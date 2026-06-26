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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/Owner.css" />
<title>listOrder</title>
</head>
<body>
	<%@include file="/common/header_Owner.jsp"%>
	<div class="container">
	<%@include file="/common/sidebar_Owner.jsp"%>
	<main style="width: 100%; padding: 20px;">
	<h1>注文履歴一覧画面(オーナー)</h1>
	
	<%
	if (list != null && list.size() > 0) {
	%>
	<div style="margin-left:0px; margin-bottom: 20px;">
		<p><%=lastmonth%>月の売り上げ（発送完了分）
			<%=fmt.moneyFormat(orderDaoObj.sumPriceByMonth(lastmonth))%>円</p>
		<p><%=lastmonth2%>月の売り上げ（発送完了分）
			<%=fmt.moneyFormat(orderDaoObj.sumPriceByMonth(lastmonth2))%>円</p>
	</div>

	<table border="1" style="margin: auto; width:100%; table-layout:fixed; border-collapse: collapse;">
		<tr style="background-color: #00FFFF;">
			<th style="text-align: center; vertical-align: middle; width: 10%;">注文No.</th>
			<th style="text-align: center; vertical-align: middle; width: 10%;">ユーザーID</th>
			<th style="text-align: center; vertical-align: middle; width: 12%;">合計金額</th>
			<th style="text-align: center; vertical-align: middle; width: 18%;">注文日時</th>
			<th style="text-align: center; vertical-align: middle; width: 10%;">入金状況</th>
			<th style="text-align: center; vertical-align: middle; width: 20%;">コメント</th>
			<th style="text-align: center; vertical-align: middle; width: 10%;">変更</th>
		</tr>
		<%
		// 💡 データ行のループ開始
		for (int i = 0; i < list.size(); i++) {
			Order order = (Order) list.get(i);
			
			String depoSta = (order.getDeposit() == 0) ? "入金待ち" : "入金済";
			String sendSta = (order.getSend() == 0) ? "未発送" : "発送済";
		%>
		<tr>
			<td style="text-align: center;"><a href="<%=request.getContextPath()%>/detail?orderno=<%=order.getOrderno()%>&cmd=detail"><%=order.getOrderno()%></a></td>
			
			<td style="text-align: center;"><%=order.getUserno()%></td>
			
			<td style="text-align: center;"><%=fmt.moneyFormat(order.getSumprice())%>円</td>
			
			<td style="text-align: center;"><%=order.getOrderdate()%></td>
			
			<td style="text-align: center;"><%=depoSta%></td>
			
			<td style="text-align: left; padding-left: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"><%= (order.getOrdercomment() != null) ? order.getOrdercomment() : "なし" %></td>
			
			<td style="text-align: center;"><a href="<%=request.getContextPath() %>/detailOrderedItemOwner?orderno=<%=order.getOrderno()%>&cmd=update">▶変更</a></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	} else {
	%>
	<h3 style="text-align: center; margin-top: 50px;">まだ注文データがありません。</h3>
	<% } %>
	</main>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>
