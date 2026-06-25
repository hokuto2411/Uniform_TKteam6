<!--ユーザー：注文履歴確認 showOrderedItem-->

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.OrderDetail"%>

<%
ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>) request.getAttribute("detail_list");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>注文履歴確認画面</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/css/User.css">
</head>

<body>

	<div class="wrapper">

	

		<main>

			<h2 style="text-align: center;">注文履歴</h2>
			<hr style="height: 5px; background-color: #00FFFF;">

			<table border="1" style="margin: auto;">

				<tr>
					<th>注文No</th><br>
				</tr>

				<%
				if (detail_list != null) {
					for (int i = 0; i < detail_list.size(); i++) {
						OrderDetail detail = detail_list.get(i);
				%>

				<tr>

					<td><a
						href="<%=request.getContextPath()%>/detailShowOrderedItem?orderno=<%=detail.getOrderno()%>">

							<%=detail.getOrderno()%>

					</a></td>

				</tr>

				<%
				}
				}
				%>

			</table>

			<br>

			<div style="text-align: center;">

				[<a href="<%=request.getContextPath()%>/listUni"> 商品一覧へ戻る </a>]

			</div>

		</main>

		

	</div>

</body>
</html>
