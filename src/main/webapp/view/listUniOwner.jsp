<!--管理者：商品一覧 listUniOwner-->
<!DOCTYPE html>
<html>

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Uniform"%>
<%@page import="java.util.ArrayList,bean.User,util.MyFormat"%>
<%@page import="dao.UniformDAO"%>
<%@page import="util.ArartStock"%>
<%
User user = (User)session.getAttribute("user");
UniformDAO uniDao = new UniformDAO();
ArartStock arart = new ArartStock();
ArrayList<Uniform> uni_list = uniDao.selectAll();
if(uni_list != null){
	for(int i=0; i < uni_list.size(); i++){
		Uniform uni = uni_list.get(i);
		if(uni.getStock() <= 5){
			arart.sendArart(user);
		}
	}
}
%>
<head>
	<title>管理者：商品一覧</title>
	<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Owner.css">
</head>
<%
MyFormat mft = new MyFormat();
%>

<body>
	<!-- ヘッダー -->
	<%@ include file="/common/header_Owner.jsp"%>
	
	<!-- コンテンツ -->
	<div class="container">
	
	<!-- サイドバー -->
	<%@include file="/common/sidebar_Owner.jsp"%>	

	<main>
		<!-- サブタイトル -->
		<h1>
				商品一覧画面(オーナー)
		</h1>		
		<div style="position:sticky;
					top:150px;
					width:150px;
					padding-right:30px;
					float:right;
					text-align:right;
					padding-left:10px;
					border: 1px solid #333333;
					border-radius: 10px; ">
						
			<p>
				ユーザー名<% %><br>
				<%--ユーザー名 --%>
				<%if(user==null){ %>
				<%--ログインしていない場合 --%>
				<form action="<%=request.getContextPath()%>/login" method="post">
					<input type="submit" value="ログイン">
				</form>
				<%--ログインしている場合 --%>
				<%}else{ %>
				<%=user.getUsername()%><br>
				<form action="<%=request.getContextPath()%>/logout" method="post">
					<input type="submit" value="ログアウト">
				</form>
				<%} %>
				<%--ログアウト --%>
				<br>
		</div>

		<div style="text-align:right;
					padding-right:400px;
					margin-bottom: 20px;">
			<a href="<%=request.getContextPath()%>/view/insertUniOwner.jsp">新規登録</a>
		</div>
		
		<div style="display:flex; gap:15px;flex-wrap: wrap;justify-content: gap;">
  						
  		<%
			//ユニフォーム情報の取得
			ArrayList<Uniform> list = (ArrayList<Uniform>) request.getAttribute("uniList");
			
			//ユニフォーム情報を獲得した分格納
			if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				Uniform uni = (Uniform) list.get(i);
		%>
			
			<div style="padding: 15px;
 						flex: 100 100 200px;">
				<!-- 商品名 -->
				<p><a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>&cmdSwitch=owner">
						<%=uni.getUniname()%></a>
				<!-- 商品画像 -->
				<p><img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
					 alt="<%=uni.getUniname() %>"
					 style="height:150px;;border:1px brack;">
				<!-- 価格 -->
				<p><%=mft.moneyFormat(uni.getPrice())%>
				<!-- 在庫 -->
				<p>残り<%=uni.getStock()%>点
				</div>
		<%
				}

			}
		%>
		</div>

		</main>
	</div>
</body>
</html>

