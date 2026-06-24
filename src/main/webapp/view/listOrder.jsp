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
		<%@include file="/common/header_User.jsp"%>
	<%@include file="/common/sidebar_User.jsp"%>

	<h1>注文履歴一覧画面</h1>
	<hr class="black">
	
	<table>
		<tr>
			<th>注文No.</th>
			<th>合計金額</th>
			<th>発注状況</th>
			<th>日付</th>
		</tr>
		
		<%
		if(order_list != null){
			for(int i=0; i<order_list.size(); i++){
				Order order = order_list.get(i);
		%>
		
		<tr>
			<th><%=order.getOrderno() %></td>
			<th><%=fmt.moneyFormat(order.getSumprice()) %>
			<th><%=order.getSend() %>
			<th><%=order.getOrderdate() %>
		</tr>
		
		<%
		ArrayList<OrderDetail> detail_list = detailDao.selectByOrder(order.getOrderno());
		UniformDAO UniDao = new UniformDAO();
		for (int j=0; j< detail_list.size(); j++){
			OrderDetail detail = detail_list.get(j);
			Uniform uni = UniDao.selectByUnino(detail.getUnino());
		%>
		<tr>
			<td><%=uni.getUniname() %></td>
			<td><%=detail.getQuantity() %></td>
			<td> </td>
			<td><%=(detail.getQuantity() * uni.getPrice()) %></td>
		</tr>
		<%
		}}}
		%>
	</table>
	
	<%@include file="../common/footer.jsp"%>
</body>
</html>