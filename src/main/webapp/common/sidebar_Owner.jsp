<%--ユーザー：サイドバー sidebar_User --%>

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Owner.css">

<aside>
	<div class="side-item">
		<br>
		<a href="<%=request.getContextPath()%>/view/menuOwner.jsp">メニュー</a><br>
		<a href="<%=request.getContextPath()%>/listUni">商品一覧</a><br>
		<a href="<%=request.getContextPath()%>/listOrderOwner">注文一覧</a><br>
		<a href="<%=request.getContextPath()%>/salesConfirmationOwner">売上確認</a><br>
		<a href="<%=request.getContextPath()%>/view/updateUserOwner.jsp">ユーザー管理</a><br>
		<br>
	</div>
</aside>
