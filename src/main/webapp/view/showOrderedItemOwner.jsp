<!--ユーザー：注文一覧（管理者） -->
<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order,bean.User"%>
<title>注文一覧（管理者）</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/css/User.css">
</head>

<body>
	<!-- ヘッダー -->
  	<%@include file="/common/header_User.jsp"%>
  	
  	<!-- コンテナ -->
  	<div class="container">
  	
  	<!-- サイドバー -->
	<%@include file="/common/sidebar_User.jsp"%>	
	
	<!-- メイン -->
	<main>
		<div style="position: sticky; 
			top: 150px; 
			width: 150px; 
			padding-right: 30px; 
			float: right; 
			text-align: right; 
			padding-left: 10px; 
			border: 1px solid #333333; 
			border-radius: 10px;">
			<p>
				ユーザー名<% %><br>
				<%--ユーザー名 --%>
				<%User user=(User)session.getAttribute("user"); %>
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

		<h1>注文一覧画面</h1>
		
		<div style="display:flex; gap:15px;flex-wrap: wrap;justify-content: gap;">

			<%
			//ユニフォーム情報の取得
			ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("orderList");
			
			//ユニフォーム情報を獲得した分格納
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					Order order = (Order) list.get(i);
			
			%>
			
			<div style="padding: 15px;
 						flex: 100 100 200px;">
				<!-- 注文番号 -->
				<p><a href="<%=request.getContextPath()%>/detailOrderedItemOwner?orderno=<%=order.getOrderno()%>">
						<%=order.getOrderno()%></a>
				</p>
				<!-- 購入者番号 -->
				<p>
						<%=order.getUserno()%>
				</p>
				<!-- 商品名 -->
				<p>
						<%=order.getUserno()%>
				</p>
				<!-- 合計 -->
				<p>
						<%=order.getSumprice()%>
				</p>
				<p>
				<!-- 支払い状況 -->
					<%
						//DBから取得したdepositをnull判定するため文字列に変換
						String deposit = String.valueOf(order.getDeposit());
						
						//支払い状況の確認
						if(deposit.equals("") || deposit.trim().equals("")){
							String message = "未";
						}
						else
						{
							String message = "済";					
					%>				
						<%=message %>
					<%
						}
					%>
				</p>
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
