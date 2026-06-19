<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order"%>
<%@page import="java.time.LocalDate"%>
<%@page import="util.MyFormat"%>
<%
MyFormat fmt = new MyFormat();
ArrayList<Order> list =(ArrayList<Order>)request.getAttribute("order_list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>listOrder</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<%@include file="../common/sidebar.jsp"%>

	<h1>注文一覧画面</h1>
	<hr class="black">
	
	<%
	
	
	%>
	<div>
		<p><%=last_month %>月の売り上げ（発送完了分）			<%=fmt.moneyFormat(order.getPrice()) %>></p>
		<p><%=last_month-1 %>月の売り上げ（発送完了分）		<%=fmt.moneyFormat(order.getPrice()) %></p>
	</div>
	
	
	<%
	if(list != null){
		for(int i=0;i<list.size();i++){
			Order order = (Order)list.get(i);
	%>
	<table>
		<tr>
			<td style="text-align:center; width:200px"><a href="<%=request.getContextPath() %>/detail?orderno=<%=order.getOrderno()%>&cmd=detail"><%=order.getOrderno()%></a></td>
			<td style="text-align:center; width:200px"><%=order.getUserno()%></td>
			<td style="text-align:center; width:200px"><%=order.getSumprice()%></td>
			<td style="text-align:center; width:200px"><%=order.getOrderdate()%></td>
			<td style="text-align:center; width:200px"><%=order.getDeposit()%></td>
			<td style="text-align:center; width:200px"><%=order.getOrdercomment()%></td>
		</tr>
	</table>
	<%
	}}else{
	%>
	<tr>
		<td style="text-align: center; width: 200px">&nbsp;</td>
		<td style="text-align: center; width: 200px">&nbsp;</td>
		<td style="text-align: center; width: 200px">&nbsp;</td>
		<td style="text-align: center; width: 250px" colspan="2">&nbsp;</td>
	</tr>
	<%
	}
	%>

	<%@include file="../common/footer.jsp"%>
</body>
</html>