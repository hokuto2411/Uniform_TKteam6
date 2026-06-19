<!--管理者：管理者メニュー menuOwner-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/Owner.css">

<head>
	<meta charset="UTF-8">
	<title>管理者メニュー</title>
	<link rel="stylesheet" href="Owner.css">
</head>

<body>
	<%@ include file="/common/header_Owner.jsp"%>

	<div>
		<h2 class="ornermenutitle">
			管理者メニュー
		</h2>
		<div class="ornermenu">
			<h3><a href="">商品一覧</a></h3>
			<h3><a href="">注文一覧</a></h3>
			<h3><a href="">売上確認</a></h3>
			<h3><a href="">ユーザー管理</a></h3>
			<h3><a href="">ログアウト</a></h3>
		</div>
	</div>
	</div>
</body>

</html>