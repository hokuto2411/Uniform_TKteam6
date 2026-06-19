<!--ユーザー：ユーザー情報変更 userChage-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/User.css">

<head>
<meta charset="UTF-8">
<title>ゆにふぉーむのホーム-会員登録-</title>
<link rel="stylesheet" href="User.css">
</head>

<body>
	<%@ include file="/common/header_User.jsp"%>

	<div class="container">
		<%@include file="/common/sidebar_User.jsp"%>
		<main>
			<h2 style="text-align: center">ユーザー情報変更</h2>

			<form>
				<table
					style="margin:auto; width:50%; table-layout: fixed; border-collapse: collapse; border: 1px solid #ccc;">
					<tr>
						<td>名前</td>
						<td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td>メールアドレス</td>
						<td><input type="text" name="mail"></td>
					</tr>
					<tr>
						<td>ユーザーID</td>
						<td><input type="text" name="userid"></td>
					</tr>
					<tr>
						<td>パスワード</td>
						<td><input type="text" name="password"></td>
					</tr>
					<tr>
						<td>住所</td>
						<td><input type="textarea" name="adress" class="tarea"></td>
					</tr>
				</table>
				<input type="submit" class="buttom">
			</form>
		</main>
	</div>
</body>

</html>