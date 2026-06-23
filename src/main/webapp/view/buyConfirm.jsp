<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.Uni,bean.User"%>
<%@ page import="util.MyFormat"%>

<%
ArrayList<Uni> uniList = (ArrayList<Uni>) request.getAttribute("uniList");

User user = (User) request.getAttribute("user");

MyFormat myFormat = new MyFormat();

int total = 0;

if (request.getAttribute("total") != null) {
	total = (int) request.getAttribute("total");
}
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>購入確認画面</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/css/style.css">
</head>

<body>

	<div class="wrapper">

		<main>

			<header>

		<h1 style="text-align: center">購入完了</h1>

		<hr style="height: 5px; background-color: #00FFFF;">

	</header>


			<p>
				下記の商品を購入します。<br> 
				内容をご確認ください。
			</p>

			<h5>商品情報</h5>

			<tr>
				<th>商品名 :</th>
				<br>
				<th>価格 :</th>
				<br>
			</tr>

			<%
				if (uniList != null) {

					for (int i = 0; i < uniList.size(); i++) {
				%>
			<tr>
				<td><%=uniList.get(i).getUniname()%></td>
				<td><%=myFormat.moneyFormat(uniList.get(i).getPrice())%></td>
			</tr>

			<%
				}
				}
				%>



			<br>

			<h5>ユーザー情報</h5>



			<tr>
				<th>名前 :</th>
				<td><%=user.getUsername()%></td>
				<br>
			</tr>

			<tr>
				<th>住所 :</th>
				<td><%=user.getAddress()%></td>
				<br>
			</tr>

			<tr>
				<th>メールアドレス :</th>
				<td><%=user.getMailaddress()%></td>
				<br>
			</tr>



			<br>

			<p style="text-align: center">

				合計金額：
				<%=myFormat.moneyFormat(total)%>

			</p>

			<form action="<%= request.getContextPath() %>/buyComplete"
				method="post">

				<input type="submit" value="購入">

			</form>

		</main>

	</div>

</body>
</html>

