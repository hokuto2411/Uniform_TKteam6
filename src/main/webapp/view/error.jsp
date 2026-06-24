<%@page contentType="text/html; charset=UTF-8"%>

<%
String error = (String) request.getAttribute("error");
String cmd = (String)requset.getAttribute("cmd");
%>

<html>

<head> 

<title>list</title>
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


	<h1 style="text-align: center">●●エラー●●</h1>

	<p style="text-align: center"><%=error%></p>
	<br>
	<p style="text-align: center">
	<% if(cmd.equals("login")){ %>
		<a href="<%=request.getContextPath()%>/view/login.jsp">ログインに戻る</a>
	<% }else if(cmd.equals("insert")){ %>
		<a href="<%=request.getContextPath()%>/view/insertUser.jsp">会員登録画面に戻る</a>
	<% }else if(cmd.equals("menu")){ %>
		<a href="<%=request.getContextPath()%>/view/menu.jsp">メニューに戻る</a>
	<% }else if(cmd.equals("omenu")){ %>
		<a href="<%=request.getContextPath()%>/view/menuOwner.jsp">管理者メニューに戻る</a>
	<% }else{ %>
		<a hred="<%=request.getContextPath()%>/logout">ログアウト</a>
	<% } %>
	</p>


</body>

</html>
