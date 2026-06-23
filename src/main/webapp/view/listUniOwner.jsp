<!--オーナー：商品一覧 listUniOwner-->
<!DOCTYPE html>
<html>

<head>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Uniform"%>
<title>商品一覧（管理者）</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Owner.css">
</head>

<body>
	<%@ include file="/common/header_Owner.jsp"%>

	<div class="container">
	<%@include file="/common/sidebar_Owner.jsp"%>	

		<main>
		<div style="position:sticky;
					top:150px;
					width:150px;
					padding-right:30px;
					float:right;
					text-align:right;
					padding-left:10px;
					border: 1px solid #333333;
					border-radius: 10px; ">
					
			<p>ユーザー名<% %><br>		<%--ユーザー名 --%>
			<% %>			<%--ログインしていない場合 --%>
			<a href="">ログイン</a><br>	<%--ログインのリンク --%>
			<% %>			<%--ログインしている場合 --%>
			<a href="">ログアウト</a><br>	<%--ログアウト --%>
			<br>
		</div>
		
		<h1>商品一覧画面</h1>

		<div style="text-align:right;
					padding-right:400px;
					margin-bottom: 20px;">
			<a href="<%=request.getContextPath()%>/view/insertUniOwner.jsp">新規登録</a>
			<a href="<%=request.getContextPath()%>/view/updateUniOwner.jsp">変更</a>
		</div>
		
		<table 
			style="text-align:right;
				width: 80%;
				table-layout: fixed;
				border-collapse: separate;
  				border-spacing: 10px;
  				border:0px;">
  						
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
				<a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>&cmdSwitch=owner">
					<%=uni.getUniname()%></a></td>
				<td>
				<a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>&cmdSwitch=owner">
					<%=uni.getUniname()%></a></td>
				<td><a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>&cmdSwitch=owner">
					<%=uni.getUniname()%></a></td>
			</tr>
			<tr style="height: 150px;">
				<td>
					<p>
					<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>">						</p>
				</td>
				<td>
					<p>
					<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>">
					</p>					<
				</td>
				<td>
					<p>
					<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>">
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
