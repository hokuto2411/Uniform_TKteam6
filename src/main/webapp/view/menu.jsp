<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList,bean.Uniform,bean.User"%>
    <%
    User user =(User)session.getAttribute("user");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/User.css">
<title>メニュー画面</title>
</head>
<body>
	<%@include file="/common/header_User.jsp"%>
	<div style="padding-top:150px">
	</div>
	<h1 style="text-align:center">メニュー画面</h1>
	
	
	
	
	<table style="margin: auto; border: 0;">
		<tr>
		<%if(user==null){ %>
			<td><a href="<%=request.getContextPath()%>/view/login.jsp">ログイン画面へ</a></td>
			<%} %>
		</tr>
		
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
			<td><a href="<%=request.getContextPath()%>/listUni">商品一覧へ</a></td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	
	</table>
	
</body>
</html>