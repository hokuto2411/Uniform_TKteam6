<!--ユーザー：注文一覧 -->
<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order,bean.User,util.MyFormat"%>
<title>注文一覧</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/css/Owner.css">
</head>

<body>
	<!-- ヘッダー -->
  	<%@include file="/common/header_Owner.jsp"%>
  	
  	<!-- コンテナ -->
  	<div class="container">
  	
  	<!-- サイドバー -->
	<%@include file="/common/sidebar_Owner.jsp"%>	
	
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
			//価格表示形式を管理するクラス
			MyFormat formatDao = new MyFormat();
			
			//ユニフォーム情報の取得
			ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("orderList");
			
			//ユニフォーム情報を獲得した分格納
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					Order order = (Order) list.get(i);
			
			%>
 				<table style="margin: auto; width: 1000px; margin-top: 50px">
				<tr>
				<th>注文番号</th>
				<th>合計金額</th>
				<th>支払い状況</th>
				<th>発送準備</th>
				<th>注文日</th>
				<th>備考</th>
				<tr>
				<td style="text-align: center">
					<a href="<%=request.getContextPath()%>/detailOrderedItemOwner?orderno=<%=order.getOrderno()%>">
					No.<%=order.getOrderno()%></a>
				</td>
				<td style="text-align: center">
						<%=formatDao.moneyFormat(order.getSumprice())%>
				</td>
				<td style="text-align: center">
					<%
						int deposit = order.getDeposit();
						
						//支払い状況の確認
						if(deposit == 0)
						{
							String message = "未";
						}
						else if(deposit == 1)
						{
							String message = "済";
					%>				
						<%=message %>
					<%
						}
					%>
				</td>
				<td style="text-align: center">
					<%
						int send = order.getSend();
						
						//発送状況の確認
						if(send == 0){
							String message = "未発送";
						}
						else if(send == 1)
						{
							String message = "発送済";					
				%>				
						<%=message %><br>
					<%
						}
					%>	
					
						<a href="<%=request.getContextPath()%>
						/updateSendOwner?orderno=<%= order.getOrderno() %>&send=1">発送済みにする</a>
						
				</td>
				<td style="text-align: center">
						<%=order.getOrderdate()%>
				</td>
				<td style="text-align: center">
						<%=order.getOrdercomment()%>
				</td>
				</tr>
				</table>
			
			<%
			}

			}
			%>
	</div>

	</main>
</div>
</body>
</html>
