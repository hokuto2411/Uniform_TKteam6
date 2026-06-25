<%@page contentType="text/html; charset=UTF-8"%>
<%String message=(String)request.getAttribute("message");
if(message==null){
	message="";
}
%>
<html>
<head>
<title>ログイン</title>
<link rel="stylesheet" href="../css/User.css">
</head>

<body>
	<%@include file="/common/header_User.jsp"%>
	<form action="<%=request.getContextPath()%>/login" method="post">

	<table style="margin: auto; margin-top:250px; height:200px; width:30%; border-spacing:5px;">
			<tr>
				<th style="text-align:center"><label for="userid">ユーザーID</label></th>
				<td><input type="text" name="userid" style="width:100%"></td>
			</tr>
			<tr>
				<th style="text-align:center"><label for="password">パスワード</label></th>
				<td><input type="password" name="password" style="width:100%;"></td>
			</tr>
		</table>
		
		<br>
		
		<div style="text-align: center;">
<br>
<%=message %>
<br>
		<input type="submit"  value="ログイン" class="color-change">
		</div>
		
		<br>
		<br>
		
		<div style="text-align: center;">
			<a href="<%=request.getContextPath()%>/view/menu.jsp">メニューはこちら</a><br>
			<a href="<%=request.getContextPath()%>/view/insertUser.jsp">会員登録はこちら</a>
		</div>
	</form>

</body>
</html>
