<!-- ユーザー　購入確認　10 --> 

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.Uniform,bean.User,bean.OrderDetail"%>
<%@ page import="util.MyFormat"%>

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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入確認画面</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/User.css">
</head>

<body>

	<%@ include file="/common/header_User.jsp"%>

	<div class="container">
		<%@ include file="/common/sidebar_User.jsp"%>

		<div class="wrapper">
			<main>
				<header>
					<h2 style="text-align: center">購入確認</h2>
					<hr style="height: 5px; background-color: #00FFFF;">
				</header>

				<p>
					下記の商品を購入します。<br> 
					内容をご確認ください。
				</p>

				<% if (user != null) { %>
				
				<h5>商品情報</h5>
				<table style="width: 100%; border-collapse: collapse; margin-bottom: 20px;" border="1">
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
						<td style="text-align: center;"><%=detail.getQuantity()%>個</td>
						<td style="text-align: center;"><%=myFormat.moneyFormat(uni.getPrice() * detail.getQuantity())%>円</td>
					</tr>
					<%
						}
					}
					%>
				</table>

				<h5>ユーザー情報</h5>
				<table style="width: 100%; border-collapse: collapse; margin-bottom: 20px;" border="1">
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

				<h3 style="text-align: center; color: red; margin: 20px 0;">
					合計金額：<%=myFormat.moneyFormat(total)%>円
				</h3>

				<div style="text-align: center; margin-bottom: 20px;">
					<form action="<%= request.getContextPath() %>/buyComplete" method="get">
						<p>ご要望・コメント：<br>
						<input type="text" name="comment" size="50" placeholder="配送時間のご希望などがあれば入力してください"></p>
						
						<input type="submit" value="購入を確定する" style="padding: 10px 30px; font-size: 16px; background-color: #00FFFF; cursor: pointer;">
					</form>
				</div>

				<% } else { %>
				<p style="color: red; text-align: center;">ユーザー情報が確認できません。再度ログインしてください。</p>
				<% } %>
			</main>
		</div>
	</div>
</body>
</html>
