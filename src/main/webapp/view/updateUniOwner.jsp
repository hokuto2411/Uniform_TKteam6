<!--管理者：商品変更 updateUniOwner-->

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.Uniform,
				servlet.UpdateUniOwner"  %>
<%
Uniform uni =(Uniform)request.getAttribute("uniform");
String filename=uni.getImage();
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>管理者：商品変更</title>
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/Owner.css">
</head>

<body>
	<!-- ヘッダー -->
	<%@ include file="/common/header_Owner.jsp"%>

	<!-- コンテンツ -->
	<div class="container">

	<!-- サイドバー -->
	<%@include file="/common/sidebar_Owner.jsp"%>
	
	<!-- <img src="/fileupload/upload/<%=filename %>"> -->

	<main>
		<form action="<%=request.getContextPath()%>/updateUni">
			<div style="padding-top:3%; margin-bottom: 30px:">
			<h2 style="text-align:center;">
			商品変更画面</h2>
			<h4 style="text-align:left">変更前情報</h4>
			<<img src="/upload/<%=filename %>"
				 alt="変更前画像"
			 	style="float:left;
						border: 1px solid #333333;
						width:30%;
						">
			<input type="file" name="pict" style="padding-bottom:30px">			
			</div>
		<table style="margin: auto; width:40%; height:50%; table-layout: fixed">
		
			<tr>
				<td colspan="2">商品名:</td>
			</tr>
			
		<%
			if(uni != null){
		%>
			<tr>
				<td>商品名</td>
				<td><input type=text name="uniname" style="width:250px" value="<%=uni.getUniname() %>" ></td>
			</tr>
			<tr>
				<td>価格</td>
				<td><input type=text name="price" style="width:250px;" value="<%=uni.getPrice()%>"></td>
			</tr>
			<tr>
				<td>在庫数</td>
				<td><input type=text name="stock" style="width:250px; value="<%=uni.getStock()%>"></td>
			</tr>
		</table>

		<input type="hidden" name="unino" value="<%=uni.getUnino()%>">
		
		<%
			}
		%>
		<input type="submit" value="変更完了"
				style="margin:50px auto">
		</form>
	</main>

	
	</div>
</body>
</html>
