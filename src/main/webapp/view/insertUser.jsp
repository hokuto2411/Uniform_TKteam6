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
  	
  	<!-- コンテナ -->
  	<div class="container">
  	
  	<!-- サイドバー -->
	<%@include file="/common/sidebar_User.jsp"%>	
	
	<!-- メイン -->
	<main>
		<!-- サブタイトル -->
		<h1>
			会員登録
		</h1>
		
	<!-- コンテンツ -->
	<form action="<%=request.getContextPath()%>/inputCheck"method="post">
		<table style="margin-left:10%; width:50%; height:400px; border-spacing:5px">
			<tr>
				<th colspan = "2" style="border: none; text-align: center">ログインの際に使うIDとパスワードを設定してください</th>
			</tr>
			<tr>
				<th style="border: none; text-align: center">ユーザーID</th>
				<td style="border: none"><input type=text size="30" name="userid" style="width:100%"></td>
			</tr>
			<tr>
				<th style="border: none; text-align: center">パスワード</th>
				<td style="border: none"><input type=text size="30" name="password" style="width:100%"></td>
			</tr>
			<tr>
				<th colspan = "2" style="border: none; text-align: center">配送などの際に使うお客様情報を記入してください</th>
			</tr>
			<tr>
				<th style="border: none; text-align: center">名前</th>
				<td style="border: none"><input type=text size="30" name="username" style="width:100%"></td>
			</tr>
			<tr>
				<th style="border: none; text-align: center">住所</th>
				<td style="border: none"><input type=text size="30" name="address" style="width:100%"></td>
			</tr>
			<tr>
				<th style="border: none; text-align: center">メールアドレス</th>
				<td style="border: none"><input type=text size="30" name="mailaddress" style="width:100%"></td>
			</tr>
		</table>
		<div style="text-align:left; margin-left: 30%; margin-top:10px">
			<input type="submit" value="確認へ">
		</div>
	</form>	
	</main>
	</div>
</body>
</html>
