<!--共通：ログイン login-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/User.css">


<head>
	<meta charset="UTF-8">
	<title>ゆにふぉーむのホーム-login-</title>
	<link rel="stylesheet" href="User.css">
</head>

<body>
	<%@ include file="/common/header_User.jsp"%>

	<center>
		<br><br><br>


		<main>

			<form>

				<table style="margin:0 auto">
					<tr>
						<th><label for="userid">ユーザー</label></th>
						<td><input type="text" name="userid" id="userid" value="<%=%>"></td>
					</tr>
					<tr>
						<th><label for="password">パスワード</label></th>
						<td><input type="password" name="password" id="password" value="<%= %>"></td>
					</tr>
				</table>

				<br>

				<input type="button" value="ログイン">

				<br><br>

				<th style="text-align: center;">[<a href="<%= request.getContextPath() %>/list">会員登録</a>]</th>
			</form>

		</main>



	</center>
</body>