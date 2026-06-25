<!-- 管理者　注文詳細　23 -->


<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order,
bean.User,
bean.OrderDetail,
bean.Uniform"%>
<%@page import="java.util.ArrayList,dao.OrderDAO"%>
<%@page import="java.util.ArrayList,dao.UniformDAO"%>
<%@page import="util.MyFormat"%>
<%
ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>) request.getAttribute("detail_list");
MyFormat fmt = new MyFormat();
User user = (User)session.getAttribute("user");
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
			<%
			OrderDetail detail = detail_list.get(0);
			%>
				<tr>
					<th>注文番号 : </th>
					<td><%=detail.getOrderno()%></td>
				</tr>
				<%
				OrderDAO orderDao = new OrderDAO();
				UniformDAO uniformDao = new UniformDAO();
				for(int i=0; i<detail_list.size(); i++){
					detail = detail_list.get(i);
					Order order = orderDao.selectByOrder(detail.getOrderno());
					Uniform uniform = uniformDao.selectByUnino(detail.getUnino());
				%>
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
					<td>¥<%=fmt.moneyFormat(uniform.getPrice())%></td>
				</tr>

				<tr>
					<th>数量 : </th>
					<td><%=detail.getQuantity()%></td>
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
				<%} %>
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
