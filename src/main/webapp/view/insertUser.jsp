<!--ユーザー：会員登録 InsertUser-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/User.css">

<head>
<meta charset="UTF-8">
<title>ゆにふぉーむのホーム-会員登録-</title>
<link rel="stylesheet" href="NewFile.css">
</head>

<body>
	<%@ include file="/common/header_User.jsp"%>

	<main>
		<h2>会員登録</h2>

		<form action="<%=request.getContextPath()%>/insertUser" method="post">

			<table style="margin: auto; padding-top: 50px; width: 500px">
				<tr>
					<th>名前</th>
					<td style="border: none;"><input type=text size="30" name="username" ></td>
				</tr>
				<tr>
					<th>住所</th>
					<td style="border: none;"><input type=text size="30" name="adress" ></td>
				</tr>
				<tr>
					<th>ID</th>
					<td style="border: none;"><input type=text size="30" name="userid" ></td>
				</tr>
				<tr>
					<th>パスワード</th>
					<td style="border: none;"><input type=text size="30" name="password" ></td>
				</tr>
				<tr>
					<th>メアド</th>
					<td style="border: none;"><input type=text size="30" name="mailaddress" ></td>
				</tr>

			</table>
			
			<div style="text-align: center"><input type="submit" name="insertUser" value="登録"></div>
		</form>
	</main>

</body>