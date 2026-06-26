<!-- ユーザー：購入完了 buyComplete.jsp -->  

<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>購入完了画面</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/User.css">
</head>

<body>

	<header style="padding-top:150px">

		<h2 style="text-align: center">購入完了</h2>

		<hr style="height: 5px; background-color: #00FFFF;">

	</header>
<%@ include file="/common/header_User.jsp"%>
	<div class="wrapper">

		<main>

			<h3 style="text-align: center">

				購入が完了いたしました。<br> 
				ご購入いただきありがとうございます。

			</h3>

			<br>
			<br>

			<div style="text-align: center">

				<a href="<%=request.getContextPath()%>/listUni"> ▶商品一覧へ戻る </a>

			</div>

		</main>

	</div>

</body>

</html>
