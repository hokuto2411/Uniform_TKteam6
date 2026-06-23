<!-- 管理者　注文詳細　23 -->


<%@page contentType="text/html; charset=UTF-8"%>

<%@page import="bean.Order"%>
<%@page import="bean.OrderDetail"%>
<%@page import="bean.Uniform"%>
<%@page import="bean.User"%>

<%
Order order = (Order) request.getAttribute("order");

OrderDetail orderDetail = (OrderDetail) request.getAttribute("orderDetail");

Uniform uniform = (Uniform) request.getAttribute("uniform");

User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>注文詳細画面</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Owner.css">

</head>

<body>

	<%@ include file="/common/header_Owner.jsp"%>

	<div class="container">

		<%@include file="/common/sidebar_Owner.jsp"%>

		<main>

			<h2 style="text-align: center">注文詳細画</h2>

			<table style="margin: auto; width: 60%;">

				<tr>
					<th>注文番号 : </th>
					<td><%=order.getOrderno()%></td>
				</tr>

				<tr>
					<th>注文日 : </th>
					<td><%=order.getOrderdate()%></td>
				</tr>

				<tr>
					<th>発送状況 : </th>
					<td><%=order.getSend()%></td>
				</tr>

				<tr>
					<th>備考 : </th>
					<td><%=order.getOrdercomment()%></td>
				</tr>

				<tr>
					<th>ユニフォーム名 : </th>
					<td><%=uniform.getUniname()%></td>
				</tr>

				<tr>
					<th>価格 : </th>
					<td>¥<%=uniform.getPrice()%></td>
				</tr>

				<tr>
					<th>数量 : </th>
					<td><%=orderDetail.getQuantity()%></td>
				</tr>

				<tr>
					<th>ユーザーID : </th>
					<td><%=user.getUserid()%></td>
				</tr>

				<tr>
					<th>氏名 : </th>
					<td><%=user.getUsername()%></td>
				</tr>

				<tr>
					<th>住所 :  </th>
					<td><%=user.getAddress()%></td>
				</tr>

				<tr>
					<th>メールアドレス : </th>
					<td><%=user.getMailaddress()%></td>
				</tr>

			</table>

			<br>

			<div style="text-align: center">

				[<a href="<%=request.getContextPath()%>/showOrderedItemOwner">

					注文一覧へ戻る </a>]

			</div>

		</main>

	</div>

</body>

</html>
</div>

</main>

</div>

</body>
</html>
