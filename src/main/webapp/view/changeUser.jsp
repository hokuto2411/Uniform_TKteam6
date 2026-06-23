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
	
	
	
	<form action="<%=request.getContextPath()%>/inputCheckUpdate" method="post">

		<table style="margin: auto">
			<tr>
				<th><label for="userid">ユーザーID</label></th>
				<td><input type="text" name="userid"value="<%=user.getUserid()%>"></td>
			</tr>
			<tr>
				<th><label for="password">パスワード</label></th>
				<td><input type="password" name="password"value="<%=user.getPassword()%>"></td>
			</tr>
			<tr>
				<th><label for="username">ユーザーネーム</label></th>
				<td><input type="text" name="username"value="<%=user.getUsername()%>"></td>
			</tr>
			<tr>
				<th><label for="address">住所</label></th>
				<td><input type="text" name="address"value="<%=user.getAddress()%>"></td>
			</tr>
			<tr>
				<th><label for="mailaddress">メールアドレス</label></th>
				<td><input type="text" name="mailaddress"value="<%=user.getMailaddress()%>"></td>
			</tr>
		</table>
		
		<br>
		
		<div style="text-align: center;">
		<input type="hidden" value="<%=user.getUserno() %>" >
		<input type="submit"  value="確認へ">
		</div>
		
		<br>
		<br>
		
	</form>

</body>
</html>