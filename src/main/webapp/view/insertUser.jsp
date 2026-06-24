<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/NewFile.css">
</head>

<body>
	<header>
	<%@include file="/common/header_User.jsp"%>
	<div style="padding-top:150px">
	</div>
		<h1 style="text-align: center">会員情報入力画面</h1>
		<hr style="height: 5px; background-color: #00FFFF;">
	</header>



	<div style="text-align: center">
		<form action="<%=request.getContextPath()%>/inputCheck"method="post">
			<table style="margin: auto; padding-top: 50px; width: 500px;">
				<tr>
					<th style="border: none">ユーザーID</th>
					<td style="border: none"><input type=text size="30" name="userid"></td>

				</tr>
				<tr>
					<th style="border: none">パスワード</th>
					<td style="border: none"><input type=text size="30" name="password"></td>
				</tr>
				<tr>
					<th style="border: none">名前</th>
					<td style="border: none"><input type=text size="30" name="username"></td>
				</tr>
				<tr>
					<th style="border: none">住所</th>
					<td style="border: none"><input type=text size="30" name="address"></td>
				</tr>
				<tr>
					<th style="border: none">メールアドレス</th>
					<td style="border: none"><input type=text size="30" name="mailaddress"></td>
				</tr>
				<tr>
				<th style="border: none">権限</th>
				<td style="border: none">
				<select name="authority" >
				<option value="0">一般ユーザー</option>
				<option value="1">管理者</option>
				
				</select>
				</td>
			</table>
			
			<div style="text-align: center">
				<input type="submit" value="確認">
			</div>

		</form>
	</div>
</body>
</html>
