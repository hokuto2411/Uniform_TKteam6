<!-- ユーザー：会員登録画面 insertUser.jsp -->
<!DOCTYPE html>
<html>

<head>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.User"%>
<meta charset="UTF-8">
<title>会員登録</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/User.css">
</head>

<body>
	<!-- ヘッダー -->
	<%@include file="/common/header_User.jsp"%>
	
	<!-- サブタイトル -->
	<h1 style="text-align: center; padding-top:150px">
	会員情報入力画面
	</h1>
	
	<hr style="height: 5px; background-color: #00FFFF; width:600px; margin-top:30px; ">
	
	<!-- コンテンツ -->
	<div style="text-align: center">
		<form action="<%=request.getContextPath()%>/inputCheck"method="post">
			<table style="margin: auto; padding-top: 50px; width: 500px;">
				<tr>
					<th style="border: none; text-align: center">ユーザーID</th>
					<td style="border: none"><input type=text size="30" name="userid"></td>

				</tr>
				<tr>
					<th style="border: none; text-align: center">パスワード</th>
					<td style="border: none"><input type=text size="30" name="password"></td>
				</tr>
				<tr>
					<th style="border: none; text-align: center">名前</th>
					<td style="border: none"><input type=text size="30" name="username"></td>
				</tr>
				<tr>
					<th style="border: none; text-align: center">住所</th>
					<td style="border: none"><input type=text size="30" name="address"></td>
				</tr>
				<tr>
					<th style="border: none; text-align: center">メールアドレス</th>
					<td style="border: none"><input type=text size="30" name="mailaddress"></td>
				</tr>
				<tr>
					<th style="border: none; text-align: center">権限</th>
					<td style="border: none;" >
					<select name="authority"  >
					<option value="0">一般ユーザー</option>
					<option value="1">管理者</option>
					</select></td>
				</tr>
			</table>
			
			<div style="text-align: center">
				<input type="submit" value="確認">
			</div>
		</form>
	</div>
</body>
</html>
