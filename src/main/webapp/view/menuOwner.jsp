<%--製作中 --%>

<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>管理者メインメニュー</title>
</head>
<body>

	<%@include file="/common/header_Owner.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div style="margin-bottom: 350px">
		<table style="margin: auto; border: 0;">
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-size: 20px">
					<a href="<%=request.getContextPath()%>/listUni">【商品一覧】</a>
				</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-size: 20px">
					<a href="<%=request.getContextPath()%>/showOrderedItemOwner">【注文一覧】</a>
				</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-size: 20px">
					<a href="<%=request.getContextPath()%>/view/salesConfirmationOwner . jsp">【売上確認】</a>
				</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-size: 20px">
					<a href="<%=request.getContextPath()%>/view/updateUserOwner.jsp">【ユーザー管理】</a>
				</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-size: 20px">
					<a href="<%=request.getContextPath()%>/logout">【ログアウト】</a>
				</td>
			</tr>

		</table>
	</div>

</body>
</html>