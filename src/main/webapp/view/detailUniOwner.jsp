<!--管理者：商品詳細 detailUni-->
<!DOCTYPE html>
<html>
<head>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.Uniform,util.MyFormat"%>
<title>商品詳細（管理者）</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/css/User.css">
</head>

	<%
		MyFormat objFormat = new MyFormat();
				
		Uniform uni = (Uniform)request.getAttribute("uniInfo");
	%>

<body>
	<%@ include file="/common/header_Owner.jsp"%>
	
	<div class="container">
	<%@include file="/common/sidebar_Owner.jsp"%>
	
		<main style="margin-top: 40px;
				padding-left:25%;
				text-align:center;">
				
			<h2 style="text-align:center">商品詳細画面</h2>
				<table style="margin: 0 auto; width: 500px; table-layout: fixed ">
					<tr>
						<td rowspan="4">
							<h1>
							<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
								width="60%" height="60%">
							</h1>
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
				
				<table style="margin: auto; height: 100px; width: 100px; padding-top: 50px">
					<tr>
						<td>
						<form action="<%=request.getContextPath()%>
							/detailUni" method="get">
						<input type="hidden" name="unino" value=<%=uni.getUnino()%>>
						<input type="hidden" name="cmdSwitch" value=update> 
						<input type="submit" value="変更">
						</form>
						</td>
						
						<td style="padding: 25px"> </td>
						
						<td>
						<form action="<%=request.getContextPath()%>/deleteUni" method="get">
						<input type="hidden" name="unino" value=<%=uni.getUnino()%>>
						<input type="submit" value="削除">
						</form>
						</td>
					</tr>
				</table>
		</main>
	</div>
</body>
</html>
