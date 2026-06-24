<!--管理者：商品登録画面 InsertUniOwner-->
<!DOCTYPE html>

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.Uniform,
				servlet.InsertUni,
				util.MyFormat" %>

<%
MyFormat objFormat = new MyFormat();
Uniform uni =(Uniform)request.getAttribute("uniInfo");
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>管理者：商品登録</title>
	<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/Owner.css">
</head>

<body>
	<!-- ヘッダー -->
	<%@ include file="/common/header_Owner.jsp"%>

	<!-- コンテナ -->
	<div class="container">
	
	<!-- サイドバー -->
	<%@include file="/common/sidebar_Owner.jsp"%>	

	<!-- コンテナ -->
	<main>
	
	<!-- サブタイトル -->
	<h1>商品登録画面</h1>
	
	<form action="<%=request.getContextPath()%>/insertUni" method="post" enctype="multipart/form-data">
	<table style="margin-left: 10%; width: 70%; table-layout: fixed; text-align:left; ">
		<tr>
			<td rowspan="4" style="width:400px; height:400px; border:1px solid brack; text-align:center">
			<input type="file" name="image">
			</td>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">
					商品名</th>
			<td style="text-align: center; vertical-align: middle;">
				<input type=text name="uniname" style="width:90%"></td>
		</tr>
		<tr>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">
					価格</th>
			<td style="text-align: center; vertical-align: middle;">
				<input type=text name="price" style="width:90%;"></td>
		</tr>
		<tr>
			<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">
					在庫数</th>
			<td style="text-align: center; vertical-align: middle;">
				<input type=text name="stock" style="width:90%;"></td>
		</tr>
		</table>
		<input type="submit" value="登録" style = "margin:20px; text-align:left;">
	</form>
	</main>
	</div>
</body>
</html>
