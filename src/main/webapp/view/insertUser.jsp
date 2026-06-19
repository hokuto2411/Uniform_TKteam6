<!--ユーザー：会員登録 InsertUser-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/User.css">
		
<head>
	<meta charset="UTF-8">
	<title>ゆにふぉーむのホーム-会員登録-</title>
	<link rel="stylesheet" href="NewFile.css">
</head>

<body>
	<%@ include file="/common/header_User.jsp"%>

	<main>
			<h2>
				会員登録
			</h2>

			<table style="margin:auto; padding-top: 50px; width:500px">
				<tr>
					<th>名前</th>
					<td><input type=text size="30" name="userid" value=Name></td>
				</tr>
				<tr>
					<th>住所</th>
					<td><input type=text size="30" name="userid" value=Adress></td>
				</tr>
				<tr>
					<th>ID</th>
					<td><input type=text size="30" name="userid" value=Id></td>
				</tr>
				<tr>
					<th>パスワード</th>
					<td><input type=text size="30" name="userid" value=Password></td>
				</tr>
				<tr>
					<th>メアド</th>
					<td><input type=text size="30" name="userid" value=Mail></td>
				</tr>

			</table>
	</main>

</body>