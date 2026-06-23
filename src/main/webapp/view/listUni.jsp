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
				<form action="<%=request.getContextPath()%>/login" method="post">
					<input type="submit" value="ログイン">
				</form>
				<%--ログインしている場合 --%>
				<a href="<%=request.getContextPath()%>/logout">ログアウト</a><br>
				<br>
		</div>

		<h1>商品一覧画面</h1>
		
		<table	
			style="margin: 0 auto; 
			width: 50%; table-layout: fixed; 
			border-collapse: separate; 
			border-spacing: 10px; 
			border: 0px;">

			<%
			//ユニフォーム情報の取得
			ArrayList<Uniform> list = (ArrayList<Uniform>) request.getAttribute("uniList");
			
			//ユニフォーム情報を獲得した分格納
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					Uniform uni = (Uniform) list.get(i);
			%>

			<tr>
				<td>
				<a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>">
					<%=uni.getUniname()%></a></td>
				<td>
				<a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>">
					<%=uni.getUniname()%></a></td>
				<td>
				<a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>">
					<%=uni.getUniname()%></a></td>
			</tr>
			<tr style="height: 150px;">
				<td>
					<p>
					<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
					width="60%" height="60%">
					</p>
				</td>
				<td>
					<p>
					<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
					width="60%" height="60%">
					</p>
				</td>
				<td>
					<p>
					<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
					width="60%" height="60%">
					</p>
				</td>
			</tr>
			
			<%
			}

			}
			%>
		</table>

	</main>
</div>
</body>
</html>
