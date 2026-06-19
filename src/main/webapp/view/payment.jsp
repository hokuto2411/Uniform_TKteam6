<!--ユーザー：購入者情報入力 payment-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/User.css">

<head>
<meta charset="UTF-8">
<title>ゆにふぉーむのホーム-会員登録-</title>
<link rel="stylesheet" href="User.css">
</head>

<body>
	<%@ include file="/common/header_User.jsp"%>



	<div class="container">
		<%@include file="/common/sidebar_User.jsp"%>

		<main>
			<h2 style="text-align: center; margin-top: 0; margin-bottom: 10px">
				購入者情報入力</h2>

			<table style="margin: auto; width: 300px">
				<tr>
					<th>名前</th>
					<td><input type=text size="30" name="Name" value=></td>
				</tr>
				<tr>
					<th>住所</th>
					<td><input type=text size="30" name="Adress" value=></td>
				</tr>
				<tr>
					<th>備考欄</th>
					<td><input type=textarea size="30" name="Adress" value=></td>
				</tr>
			</table>
	</main>
	</div>
</body>