<!--ユーザー：商品一覧 listlUni-->
<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.Uniform"%>
<title>商品一覧</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/css/User.css">
</head>

<body>
  	<%@include file="/common/header_User.jsp"%>
  
  	<div class="container">
	<%@include file="/common/sidebar_User.jsp"%>	
  
	<main>
		<div style="position: sticky; 
			top: 150px; 
			width: 150px; 
			padding-right: 30px; 
			float: right; 
			text-align: right; 
			padding-left: 10px; 
			border: 1px solid #333333; 
			border-radius: 10px;">
			<p>
				ユーザー名<% %><br>
				<%--ユーザー名 --%>
				<% %>
				<%--ログインしていない場合 --%>
				<a href="<%=request.getContextPath()%>/login">ログイン</a><br>
				<%--ログインのリンク --%>
				<% %>
				<%--ログインしている場合 --%>
				<a href="">ログアウト</a><br>
				<%--ログアウト --%>
				<br>
		</div>

		<h1>商品一覧画面</h1>
		
		<div style="display:flex; gap:15px;flex-wrap: wrap;justify-content: gap;">

			<%
			//ユニフォーム情報の取得
			ArrayList<Uniform> list = (ArrayList<Uniform>) request.getAttribute("uniList");
			
			//ユニフォーム情報を獲得した分格納
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					Uniform uni = (Uniform) list.get(i);
			%>
			
			<div style="padding: 15px;
 						flex: 100 100 200px;">
				<!-- 商品名 -->
				<p><a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>">
						<%=uni.getUniname()%></a>
				<!-- 商品画像 -->
				<p><img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
					 alt="<%=uni.getUniname() %>"
					 style="height:150px;width:100%;border:1px brack;">
				</div>
			
			<%
			}

			}
			%>
	</div>

	</main>
</div>
</body>
