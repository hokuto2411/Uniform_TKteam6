<!--ユーザー：商品詳細 detailUni-->
<!DOCTYPE html>
<html>
<head>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.Uniform,util.MyFormat"%>
<title>商品詳細（ユーザー）</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/css/User.css">
</head>

<body>
	<%@ include file="/common/header_User.jsp"%>
	
	<div class="container">
	<%@include file="/common/sidebar_User.jsp"%>
	
	<main style="margin-top: 40px;
				padding-left:25%;
				text-align:center;">
				
			<h2 style="text-align:center">商品詳細画面</h2>
			<form action="<%=request.getContextPath()%>/InssertCart" method="get">
				<table style="margin: 0 auto; width: 500px; table-layout: fixed ">
				<%
				MyFormat objFormat = new MyFormat();
				
				Uniform uni = (Uniform)request.getAttribute("uniInfo");
				%>
					<tr>
						<td rowspan="4">
							<h1>商品画像</h1>
						</td>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">商品名</th>
						<td style="text-align: center; vertical-align: middle;"><%=uni.getUniname()%></td>
					</tr>
					<tr>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">価格</th>
						<td style="text-align: center; vertical-align: middle;"><%=objFormat.moneyFormat(uni.getPrice())%></td>
					</tr>
					<tr>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">在庫状況</th>
						<td style="text-align: center; vertical-align: middle;"><%=uni.getStock()%></td>
					</tr>
				</table>

			<br>
			<br>

				<div style="text-align:center;">
					<table style="margin: 0 auto;">
						<tr>
							<td><input type="submit" value="カートに入れる"></td>
						</tr>
					</table>
				</div>
			</form>
		</main>
	</div>
</body>
</html>
