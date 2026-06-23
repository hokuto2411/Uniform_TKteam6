<!--管理者：商品変更 updateUniOwner-->
<!DOCTYPE html>

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.Uniform,
				servlet.UpdateUniOwner,
				util.MyFormat"  %>
<%
MyFormat objFormat = new MyFormat();
Uniform uni =(Uniform)request.getAttribute("uniInfo");
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>管理者：商品変更</title>
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
	
	<!-- メイン -->
	<main>
	
		<!-- サブタイトル -->
		<h1>商品変更画面</h1>
		
		<form>
		<table style="margin-left: 10%; width: 70%; table-layout: fixed; text-align:left; ">
			
		<%
			if(uni != null){
		%>
			<tr>
				<td rowspan="4">
					<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
					 			alt="変更前画像"
								width="100%" height="100%">
				</td>
				<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">
					商品名</th>
				<td style="text-align: center; vertical-align: middle;">
					<input type=text name="uniname" style="width:250px" value="<%=uni.getUniname() %>" ></td>
			</tr>
			<tr>
				<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">
					価格</th>
				<td style="text-align: center; vertical-align: middle;">
					<input type=text name="price" style="width:250px;" value="<%=uni.getPrice()%>"></td>
			</tr>
			<tr>
				<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">
					在庫数</th>
				<td style="text-align: center; vertical-align: middle;">
					<input type=text name="stock" style="width:250px; value="<%=uni.getStock()%>"></td>
			</tr>
		</table>
		
		<input type="file" name="image" style="padding-bottom:30px">
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
