<!-- ユーザー：メニュー menu.jsp -->
<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.Uniform,bean.User"%>
<meta charset="UTF-8">
<title>メニュー画面</title>
<link rel="stylesheet" href="../css/User.css">
</head>

<%
User user =(User)session.getAttribute("user");
%>
    
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
		<h1>メニュー</h1>
		
		<!-- コンテンツ -->
		<div style="text-align:left;margin-top:50px;">
		<a href="<%=request.getContextPath()%>/listUni">商品一覧へ</a>
		
		<%
		if(user==null){
		%>
		<a href="<%=request.getContextPath()%>/view/login.jsp">ログイン画面へ</a>
		<%
		}
		%>
		</div>
	</main>
	</div>
</body>
</html>
