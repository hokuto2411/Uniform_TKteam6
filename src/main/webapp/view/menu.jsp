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
		<h1>☆★☆ゆにふぉ～むのホームへようこそ☆★☆</h1>
		
		<!-- コンテンツ -->
		<div style="text-align:left;margin-top:50px;">
		<a href="<%=request.getContextPath()%>/listUni" style="padding: 30px 50px; font-size: 16px; background-color: #00FFFF; cursor: pointer;">商品一覧へ</a>
		
		<%
		if(user==null){
		%>
		<a href="<%=request.getContextPath()%>/view/login.jsp" style="padding: 30px 50px; font-size: 16px; background-color: #00FFFF; cursor: pointer;">ログイン画面へ</a>
		<%
		}
		%>
		</div>
		<div style="float:right; margin-right:50px; text-align:left; width: 30%;
   					 height: fixed; border: 1px solid #ffff00; border-radius: 20px;
   					 background-color:#fff1ab">
   			<div style="margin:10px">
			<h3>　わたしたちのゆにふぉーむへの想い</h3>
			<h4>　運動をするあなたを支える一着へ</h4>
			<p>　近年運動不足が問題となり、多くの方が、
			<p>スポーツから離れてしまっている現状です。
			<p>　私たち、神田ユニフォームはそんな方へ
			<p>いつでも運動する場所へかえって来れるよう、
			<p>運動着としてのホームになりたいと考えて
			<p>おります。
			<p>　いつも運動する方も、たまに運動する方も
			<p>全ての方にとってのホームになれますように。
			<p>　神田ユニフォームはみなさまの運動を
			<p>応援しております。
			<p>
			<p>以上、例文
			</div>
			
		</div>
	</main>
	</div>
</body>
</html>
