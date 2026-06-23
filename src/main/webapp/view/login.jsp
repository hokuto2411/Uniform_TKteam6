<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>ログイン</title>
<link rel="stylesheet" href="../css/User.css">
</head>

<body>
	<%@include file="/common/header_User.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	
	
	<form action="<%=request.getContextPath()%>/login" method="post">

		<table style="margin: auto">
			<tr>
				<th><label for="userid">ユーザーID</label></th>
				<td><input type="text" name="userid"></td>
			</tr>
			<tr>
				<th><label for="password">パスワード</label></th>
				<td><input type="password" name="password"></td>
			</tr>
		</table>
		
		<br>
		
		<div style="text-align: center;">
		<input type="submit"  value="ログイン">
		</div>
		
		<br>
		<br>
		
		<div style="text-align: center;">
				<a href="<%=request.getContextPath()%>/view/insertUser.jsp">会員登録はこちら</a>
		</div>
	</form>

</body>
</html>