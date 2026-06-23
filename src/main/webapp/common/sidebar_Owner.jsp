<%--ユーザー：サイドバー sidebar_User --%>

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Owner.css">

<aside>
	<div class="side-item">
		<br>
		<a href="<%=request.getContextPath()%>/view/menuOwner.jsp">メニュー</a><br>
		<a href="<%=request.getContextPath()%>/listUni">商品一覧</a><br>
		<a href="<%=request.getContextPath()%>/showOrderedItemOwner">注文一覧</a><br>
		<a href="<%=request.getContextPath()%>/view/salesConfirmationOwner . jsp">売上確認</a><br>
		<a href="<%=request.getContextPath()%>/view/updateUserOwner.jsp">ユーザー管理</a><br>
		<br>
	</div>
</aside>
