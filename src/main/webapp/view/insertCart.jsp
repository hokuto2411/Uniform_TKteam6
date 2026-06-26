<!--ユーザー：カート追加 detailUni-->

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="util.MyFormat"%>
<%@page import="java.util.ArrayList,bean.Order"%>
<%@page import="java.util.ArrayList,bean.Uniform"%>
<%
MyFormat fmt = new MyFormat();
Order order = (Order) request.getAttribute("order");
Uniform uni = (Uniform) request.getAttribute("uni");
%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/User.css">

<head>
<meta charset="UTF-8">
<title>カート追加</title>
<link rel="stylesheet" href="User.css">
</head>

<body>

	<%@ include file="/common/header_User.jsp"%>

	<div class="container">
		<%@include file="/common/sidebar_User.jsp"%>

		<main>

			<h1>
			ユニフォームをカートに追加しました。
			</h1>

			<table style="margin-left: 10%; width: 70%; table-layout: fixed; text-align:left; ">
			<%
				if (order != null) {
					if (uni != null) {
			%>
				<table style="margin-left: 10%; width: 70%; table-layout: fixed; text-align:left; ">
			<tr>
				<td rowspan="2">
					<img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
								width="100%" height="100%">
				</td>
				<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">商品名</th>
				<td style="text-align: center; vertical-align: middle;"><%=uni.getUniname()%></td>
			</tr>
			<tr>
				<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">価格</th>
				<td style="text-align: center; vertical-align: middle;"><%=fmt.moneyFormat(uni.getPrice())%></td>
			</tr>
		</table>
					<%
					}
					}
					%>
				</table>
				
				<div style="margin-top:20px">	
					<div style="float:left; margin-left:50%">
						<form action="<%=request.getContextPath()%>/showCart" method="get">
						<input type="submit" value="カート確認" class="color-change">
						</form>
					</div>
				</div>
		</main>
	</div>
</body>

</html>
