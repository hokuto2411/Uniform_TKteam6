<!--ユーザー：商品詳細 detailUni-->
<!DOCTYPE html>
<html>

<head>

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Uniform,
				util.MyFormat"%>

<title>商品詳細</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/User.css">
</head>

<%
	MyFormat objFormat = new MyFormat();
				
	Uniform uni = (Uniform)request.getAttribute("uniInfo");
%>

<body>
	<!-- ヘッダー -->
	<%@ include file="/common/header_User.jsp"%>
	
	<!-- コンテナ -->
	<div class="container">
	
	<!-- サイドバー -->
	<%@include file="/common/sidebar_User.jsp"%>
	
	<!-- メイン -->
	<main>
		<!-- サブタイトル -->
		<h1>
			商品詳細画面
		</h1>
		
		<form action="<%=request.getContextPath()%>/insertCart" method="get">
		<table style="margin-left: 10%; width: 70%; table-layout: fixed; text-align:left; ">
			<tr>
				<td rowspan="4">
					<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
								width="100%" height="100%">
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
		
		

		<div style="margin-top:20px">	
			<div style="float:left; margin-left:50%">
				<input type="hidden" name="unino" value=<%=uni.getUnino()%>> 
				<input type="submit" name="change" value="カートに入れる">
				
			</div>
		</div>
		</form>
		
		</main>
	</div>
</body>
</html>
