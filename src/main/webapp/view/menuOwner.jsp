<%--製作中 --%>

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.User"%>
<%@page import="bean.Uniform"%>
<%@page import="dao.UniformDAO"%>
<%
User user = (User)session.getAttribute("user");
UniformDAO uniDao = new UniformDAO();

%>
<html>
<head>
<title>管理者メインメニュー</title>
</head>
<body>

	<%@include file="/common/header_Owner.jsp"%>
	
	<!-- コンテナ -->
  	<div class="container">
  	
  	<!-- サイドバー -->
	<%@include file="/common/sidebar_Owner.jsp"%>
	
	<!-- メイン -->
	<main>
	
		
		<h1>管理者メインメニュー</h1>

		<table style="margin-top:10px; border: 0;">
			<tr>
				<td style="border: none;"><br></td>
			</tr>
			<tr>
				<td style="border: none;"><br></td>
			</tr>
			<tr>
				<td style="font-size: 20px; border: none;">
					<a href="<%=request.getContextPath()%>/listUni?cmdSwitch=owner">【商品一覧】</a>
				</td>
			</tr>
			<tr>
				<td style="font-size: 20px; border: none;"><br></td>
			</tr>
			<tr>
				<td style="font-size: 20px; border: none;">
					<a href="<%=request.getContextPath()%>/listOrderOwner">【注文一覧】</a>
				</td>
			</tr>
			<tr>
				<td style="font-size: 20px; border: none;"><br></td>
			</tr>
			<tr>
				<td style="font-size: 20px; border: none;">
					<a href="<%=request.getContextPath()%>/salesConfirmationOwner">【売上確認】</a>
				</td>
			</tr>
			<tr>
				<td style="font-size: 20px; border: none;"><br></td>
			<tr>
				<td style="font-size: 20px; border: none;">
					<a href="<%=request.getContextPath()%>/updateUserOwner">【ユーザー管理】</a>
				</td>
			</tr>
			<tr>
				<td style="font-size: 20px; border: none;"><br></td>
			</tr>
			<tr>
				<td style="font-size: 20px; border: none;">
					<a href="<%=request.getContextPath()%>/logout">【ログアウト】</a>
				</td>
			</tr>

		</table>
</main>
</div>
</body>
</html>
