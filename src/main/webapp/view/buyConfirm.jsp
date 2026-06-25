<!-- ユーザー:購入確認 buyConfirm.jsp --> 
<!DOCTYPE html>
<html>

<head>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.Uniform,bean.User,bean.OrderDetail"%>
<%@ page import="util.MyFormat"%>
<meta charset="UTF-8">
<title>購入確認画面</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/User.css">
</head>

<%
ArrayList<Uniform> uniList = (ArrayList<Uniform>) request.getAttribute("uni_list");
ArrayList<OrderDetail> detailList = (ArrayList<OrderDetail>) request.getAttribute("detail_list");
User user = (User) session.getAttribute("user");
MyFormat myFormat = new MyFormat();
int total = 0;
if (request.getAttribute("total_price") != null) {
	total = (int) request.getAttribute("total_price");
}
%>

<body>

	<!-- ヘッダー -->
	<%@ include file="/common/header_User.jsp"%>
	
	<!-- コンテナ -->
	<div class="container">
	
	<!-- サイドバー -->
	<%@ include file="/common/sidebar_User.jsp"%>

	<!-- ラッパー -->
	<div class="wrapper">
	
	<!-- メイン -->
	<main>
		<!-- サブタイトル -->
		<h1>購入確認</h1>
		
		
		<p style="text-align:left;">
			下記の商品を購入します。<br> 
			内容をご確認ください。
		</p>

		<%
		if (user != null) {
		%>
		
		<!-- 商品情報 -->
		<h3 style="text-align:left;">■商品情報</h3>
				<table style="margin-left:0; width: 80%; border-collapse: collapse; margin-bottom: 20px;" border="1">
					<tr style="background-color: #f2f2f2;">
						<th>商品名</th>
						<th>数量</th>
						<th>小計価格</th>
					</tr>
		
				<%
					if (uniList != null && detailList != null) {
						for (int i = 0; i < uniList.size(); i++) {
							Uniform uni = uniList.get(i);
							OrderDetail detail = detailList.get(i);
				%>
					<tr>
						<td style="text-align: center;"><%=uni.getUniname()%></td>
						<td style="text-align: center;"><%=detail.getQuantity()%>点</td>
						<td style="text-align: center;"><%=myFormat.moneyFormat(uni.getPrice() * detail.getQuantity())%></td>
					</tr>
				<%
						}
					}
				%>
				</table>
				
		<h2 style="text-align: right; color: red; margin: 20px 200px;">
			合計金額：<%=myFormat.moneyFormat(total)%>円
		</h2>

		<h3  style="text-align:left;">■お客様情報</h3>
				<table style="margin-left:0; width: 50%; border-collapse: collapse; margin-bottom: 20px;" border="1">
					<tr>
						<th style="width: 150px; background-color: #f2f2f2;">名前</th>
						<td><%=user.getUsername()%> 様</td>
					</tr>
					<tr>
						<th style="background-color: #f2f2f2;">住所</th>
						<td><%=user.getAddress()%></td>
					</tr>
					<tr>
						<th style="background-color: #f2f2f2;">メールアドレス</th>
						<td><%=user.getMailaddress()%></td>
					</tr>
				</table>

		<form action="<%= request.getContextPath() %>/buyComplete" method="get">
		<div style="text-align: left; margin-bottom: 20px;">
		<h3>■ご要望・コメント</h3>
			<input type="text" name="comment" size="50" style="height:50px" placeholder="配送時間のご希望などがあれば入力してください"></p>
		</div>
		<div style="text-align:right; margin-right: 200px; margin-bottom:30px">
		<input type="submit" value="購入を確定する" style="padding: 10px 30px; font-size: 16px; background-color: #00FFFF; cursor: pointer;">
		</div>
		</form>

				<% } else { %>
				<p style="color: red; text-align: center;">ユーザー情報が確認できません。再度ログインしてください。</p>
				<% } %>
			</main>
		</div>
	</div>
</body>
</html>
