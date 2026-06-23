<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>会員登録完了</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/NewFile.css">
</head>

<body>
	<header>
		<%@include file="/common/header_User.jsp"%>
		<div style="padding-top: 150px"></div>
		<h1 style="text-align: center">会員登録完了画面</h1>
		<hr style="height: 5px; background-color: #00FFFF;">
	</header>

	<div class="container">
		<%@include file="/common/header_User.jsp"%>
		<div style="padding-top: 150px"></div>


		<main>
			<h3 style="text-align: center; margin-top: 0; margin-bottom: 10px">
				会員登録完了<br> ご登録いただきありがとうございます。<br>

			</h3>
			<p style="text-align: center">
				[<a href="<%=request.getContextPath()%>/view/login.jsp">ログイン画面へ</a>]
			</p>
		</main>
	</div>
	</main>
	</div>
</body>
</html>