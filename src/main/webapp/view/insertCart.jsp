<!--ユーザー：カート追加 detailUni-->

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="util.MyFormat"%>
<%@page import="java.util.ArrayList,bean.Order"%>
<%
MyFormat fmt = new MyFormat();
Order order = (Order) request.getAttribute("order");
%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/User.css">

<head>
	<meta charset="UTF-8">
	<title>カート追加</title>
	<link rel="stylesheet" href="User.css">
</head>

<body>

	<%@ include file="/common/header_User.jsp"%>

	<div class="container">
		<%@include file="/common/sidebar_User.jsp"%>	

		<main style="width: 100%;">

			<h3 style="text-align:center">下記のユニフォームをカートに追加しました。 </h3>

			<form action="" method="get">
				<table style="margin: auto">
				<%
				if(order != null) {
				%>
					<tr>
						<th style="background-color: #00FFFF; text-align: center;  vertical-align: middle; width:150px">
							No</th>
						<td style="text-align: center; vertical-align: middle;"><%=order.getOrderno()%></td>
					</tr>
					<tr>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">
							種類</th>
						<td style="text-align: center; vertical-align: middle;">ユニフォームA</td>
					</tr>
					<tr>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">個数</th>
						<td style="text-align: center; vertical-align: middle;">2</td>
					</tr>
					<tr>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">サイズ</th>
						<td style="text-align: center; vertical-align: middle;">F</td>
					</tr>
					<tr>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">価格</th>
						<td style="text-align: center; vertical-align: middle;">100万</td>
					</tr>
					<%
					}
					%>
				</table>
				
				<br>
				<div style="text-align: center;">
					<table style="margin: 0 auto;">
						<tr>
							<td><input type="submit" name="CartConfirm" value="カート確認"></td>
						</tr>
					</table>
				</div>
			</form>

		</main>
	</div>
</body>

</html>