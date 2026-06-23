<!--管理者：商品変更 updateUniOwner-->
<!DOCTYPE html>
<html>
<head>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="bean.Uniform,util.MyFormat"%>
<title>管理者：商品変更</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/css/User.css">
</head>

	<%
		MyFormat objFormat = new MyFormat();
	
		Uniform uni =(Uniform)request.getAttribute("uniInfo");
	%>

<body>
	<%@ include file="/common/header_Owner.jsp"%>
	
	<div class="container">
	<%@include file="/common/sidebar_Owner.jsp"%>

	<main>
		<form action="<%=request.getContextPath()%>/updateUni" method="post" enctype="multipart/form-data">
		
			<div style="padding-top:3%; margin-bottom: 30px:">		
			<h2 style="text-align:center;">商品変更画面</h2>
			
			<h4 style="text-align:left">変更前情報</h4>
			
			<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
				alt="変更前画像"
			 	style="float:left;
				border: 1px solid #333333;
				width:30%;">
				
			<input type="file" name="image">
				
				<table style="margin: 0">
					<tr>
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
						
			</div>
			
		<table style="margin: auto; width:40%; height:50%; table-layout: fixed">
			<tr>
				<td colspan="2">商品名:<%=uni.getUniname()%></td>
			</tr>
			
		<%
			if(uni != null){
		%>
			<tr>
			
				<td>商品名</td>
				<td><input type=text name="uniname" style="width:250px"></td>
			</tr>
			<tr>
				<td>価格</td>
				<td><input type=text name="price" style="width:250px"></td>
			</tr>
			<tr>
				<td>在庫数</td>
				<td><input type=text name="stock" style="width:250px"></td>
			</tr>
		</table>
		
		<%
			}
		%>
		
		<input type="hidden" name="unino" value="<%=uni.getUnino()%>">
		<input type="submit" value="変更完了" style="margin:50px auto">
		</form>
		
	</main>
	</div>
</body>
</html>
