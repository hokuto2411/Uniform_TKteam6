<%--製作中 --%>

<%@page contentType="text/html; charset=UTF-8"%>

<%
String message = (String) request.getAttribute("error");
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

	<p style="text-align: center"><%=message%></p>
	<br>
	<p style="text-align: center">
		<a href="<%=request.getContextPath()%>/view/Login.jsp">ログインに戻る</a>
	</p>


</body>

</html>
