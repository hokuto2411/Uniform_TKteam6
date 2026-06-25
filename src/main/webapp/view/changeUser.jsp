<!-- ユーザー：会員情報変更 -->

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.User"%>
<%//セッションからユーザー情報を取得
User user = (User) session.getAttribute("user");
//セッション切れか確認
if (user == null) {
	//セッション切れならerror.jspへフォワード
	
	request.setAttribute("error", "セッション切れの為、メニュー画面が表示できませんでした。");
	request.setAttribute("cmd", "login");
	request.getRequestDispatcher("/view/error.jsp").forward(request, response);
	return;
} 
%>
<html>
<head>
<title>会員情報変更</title>
<link rel="stylesheet" href="../css/User.css">
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
			会員情報変更
		</h1>
	
	<form action="<%=request.getContextPath()%>/inputCheckUpdate" method="post">

		<table style="margin-left:10%; width:50%; height:80%; border-spacing:5px">
			<tr>
				<th style="border: none; "colspan = "2">　★ログインの際に使うIDとパスワードを設定してください</th>
			</tr>
			<tr>
			
				<th style="border: none; text-align: center"><label for="userid">ユーザーID</label></th>
				<td><input type="text" name="userid"value="<%=user.getUserid()%> " style="border: none; width:100%"></td>
			</tr>
			<tr>
				<th style="border: none; text-align: center"><label for="password">パスワード</label></th>
				<td><input type="password" name="password"value="<%=user.getPassword()%>" style="border: none; width:100%"></td>
			</tr>
			<tr>
				<th style="border: none; "colspan = "2">　★配送などの際に使うお客様情報を記入してください</th>
			</tr>
			
			<tr>
				<th style="border: none; text-align: center"><label for="username">氏名</label></th>
				<td><input type="text" name="username"value="<%=user.getUsername()%> " style="border: none; width:100%"></td>
			</tr>
			<tr>
				<th style="border: none; text-align: center"><label for="address">住所</label></th>
				<td><input type="text" name="address"value="<%=user.getAddress()%>" style="border: none; width:100%"></td>
			</tr>
			<tr>
				<th style="border: none; text-align: center"><label for="mailaddress" style="width:100%">メールアドレス</label></th>
				<td><input type="text" name="mailaddress"value="<%=user.getMailaddress()%>" style="border: none; width:100%"></td>
			</tr>
		</table>
		
		<br>
		
		<div style="text-align:left; margin-left:30%">
		<input type="hidden" value="<%=user.getUserno() %>" >
		<input type="submit"  value="確認へ" class="color-change">
		</div>
		
		<br>
		<br>	
	</form>
	</main>
	</div>
</body>
</html>
