<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.MyFormat"%>
<%@page import="java.util.ArrayList,bean.Order"%>
<%@page import="java.time.LocalDate"%>
<%
MyFormat fmt = new MyFormat();
ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("order_list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listOrder</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
		<%@include file="/common/header_Owner.jsp"%>
	<%@include file="/common/sidebar_Owner.jsp"%>

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
		if(list != null){
			for(int i=0; i<list.size(); i++){
				Order order = list.get(i);
		%>
		
		<tr>
			<td><%=order.getOrderno() %></td>
			<td><%=fmt.moneyFormat(order.getSumprice()) %>
			<td><%=order.getSend() %>
			<td><%=order.getOrderdate() %>
		</tr>
		
		<%
		}}
		%>
	</table>
	
	<%@include file="../common/footer.jsp"%>
</body>
</html>