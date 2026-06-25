<!-- ユーザー：会員登録完了画面 userComplete.jsp -->
<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<title>会員登録完了</title>
</head>

<body>
	<!-- ヘッダー -->
	<%@include file="/common/header_User.jsp"%>
	
	<!-- コンテンツ -->
	<div style = "margin-top:50px; padding-top:10%;text-align: center">
		<h1 style="text-align: center">会員登録完了</h1>
		<h2 style="text-align: center">ご登録いただきありがとうございます。</h2>
		<hr style="height: 5px; background-color: #00FFFF; width:600px; margin-top:30px; ">

		<h3 style="text-align: center; margin-top:30px;">
			[<a href="<%=request.getContextPath()%>/view/login.jsp">ログイン画面へ</a>]</h3>
	</div>
	
</body>
</html>
