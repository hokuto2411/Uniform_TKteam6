<!--管理者：売上確認 SalesConfirmationOwner-->
<%@page contentType="text/html; charset=UTF-8"%>
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
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Owner.css">

<head>
<meta charset="UTF-8">
<title>管理者：売上確認</title>
<link rel="stylesheet" href="NewFile_Owner.css">
</head>

<body>
<body>
	<%@ include file="/common/header_Owner.jsp"%>

	<div class="container">
		<%@include file="/common/sidebar_Owner.jsp"%>

		<main>
			<h2 style="text-align: center">売上確認</h2>
			<img src="売上確認.png">


			<div>
				<p><%=lastmonth%>月の売り上げ（発送完了分）
					<%=fmt.moneyFormat(orderDaoObj.sumPriceByMonth(lastmonth))%></p>
				<p><%=lastmonth2%>月の売り上げ（発送完了分）
					<%=fmt.moneyFormat(orderDaoObj.sumPriceByMonth(lastmonth2))%></p>
			</div>

		</main>
	</div>
</body>
</body>
