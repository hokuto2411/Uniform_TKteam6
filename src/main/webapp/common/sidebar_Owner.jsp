<%--ユーザー：サイドバー sidebar_User --%>

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Owner.css">

<aside>
	<div class="side-item">
		<br>
		<a href="<%=request.getContextPath()%>/view/menuOwner.jsp">メニュー</a><br>
		<a href="<%=request.getContextPath()%>/listUni?cmdSwitch=owner">商品一覧</a><br>
		<a href="<%=request.getContextPath()%>/listOrderOwner">注文一覧</a><br>
		<a href="<%=request.getContextPath()%>/salesConfirmationOwner">売上確認</a><br>
		<a href="<%=request.getContextPath()%>/updateUserOwner">ユーザー管理</a><br>
		<a href="<%=request.getContextPath()%>/logout">ログアウト</a><br>
		<br>
	</div>
</aside>
