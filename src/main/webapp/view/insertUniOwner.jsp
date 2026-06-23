<!--管理者：商品登録画面 InsertUniOwner-->

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.Uniform,
				servlet.InsertUni" %>

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

	<!-- コンテンツ -->
	<div class="container">
	
	<!-- サイドバー -->
	<%@include file="/common/sidebar_Owner.jsp"%>	

	<main>
	
		<div style="padding-top:20px">
		<form action="<%=request.getContextPath()%>/insertUni" method="post" enctype="multipart/form-data">
			<div style="float:left;
						padding-top: 20px;
						padding: 15%;
						margin-bottom: 15%;
						border: 1px solid #333333;
						border-radius: 10px">
						
			<input type="file" name="image">
			</div>
			
			<h2 style="text-align:center;">商品登録画面</h2>
			<table style="margin:auto;
							width:50%;
							height:70%;
							padding-top: 20px;
							table-layout: fixed;
							border-collapse: collapse;
							border: 1px solid #ccc;">
							
				<tr>
					<th>商品名</th>
						<td><input type="text" name="uniname"></td>
				</tr>
				
				<tr>
					<th>値段</th>
						<td><input type="text" name="price"></td>
				</tr>
				
				<tr>
					<th>在庫</th>
						<td><input type="text" name="stock"></td>
				</tr>
				
			</table>
			<input type="submit" value="登録" style = "margin:20px; text-align:left;">
			</form>
		</div>
	</main>
</div>
</body>
</html>
