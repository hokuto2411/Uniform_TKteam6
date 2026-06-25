<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="util.MyFormat"%>
<%@page import="java.util.ArrayList,bean.Order"%>
<%@page import="java.util.ArrayList,bean.OrderDetail"%>
<%@page import="java.util.ArrayList,bean.Uniform"%>
<%@page import="java.util.ArrayList,dao.OrderDetailDAO"%>
<%@page import="java.util.ArrayList,dao.UniformDAO"%>
<%@page import="java.time.LocalDate"%>
<%
MyFormat fmt = new MyFormat();
ArrayList<Order> order_list = (ArrayList<Order>) request.getAttribute("order_list");
OrderDetailDAO detailDao = new OrderDetailDAO();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listOrder</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<!-- ヘッダー -->
  	<%@include file="/common/header_User.jsp"%>
  	
  	<!-- コンテナ -->
  	<div class="container">
  	
  	<!-- サイドバー -->
	<%@include file="/common/sidebar_User.jsp"%>	
	
	<!-- メイン -->
	<main>
	<h1>注文履歴一覧画面</h1>

	<table style="margin: auto; width:100%; table-layout:fixed;">
		<tr style="height:50px;">
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width: 150px;">注文No.</th>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width: 150px;">合計金額</th>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width: 150px;">入金状況</th>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width: 150px;">発注状況</th>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width: 150px;">日付</th>
		</tr>

		<%
		if (order_list != null) {
			for (int i = 0; i < order_list.size(); i++) {
				Order order = order_list.get(i);
		%>



		<%
		ArrayList<OrderDetail> detail_list = detailDao.selectByOrder(order.getOrderno());
		UniformDAO UniDao = new UniformDAO();
		for (int j = 0; j < detail_list.size(); j++) {
			OrderDetail detail = detail_list.get(j);
			Uniform uni = UniDao.selectByUnino(detail.getUnino());
		%>
		<tr>
			<td><%=order.getOrderno()%></td>
			<td><%=fmt.moneyFormat((detail.getQuantity() * uni.getPrice()))%></td>
			<%
			String deposit;
			if (order.getDeposit() == 0) {
				deposit = "入金する";
			} else {
				deposit = "入金済み";
			}
			%>

			<td><a
				href="<%=request.getContextPath()%>/updateDeposit?orderno=<%=order.getOrderno()%>">
					<%=deposit%>
			</a></td>

			<td>
				<%
				String send;
				if (order.getSend() == 0) {
					send = "未発送";
				} else {
					send = "発送済み";
				}
				%> <%=send%></td>
			<td><%=order.getOrderdate()%></td>
		</tr>

		<%
		}
		}
		}
		%>
	</table>

	<%@include file="../common/footer.jsp"%>
	
	</main>
	</div>
</body>
</html>
