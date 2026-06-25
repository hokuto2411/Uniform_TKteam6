<%--ユーザー：サイドバー sidebar_User --%>

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/User.css">

<aside>
	<div class="side-item">
		<br>
		<a href="<%=request.getContextPath()%>/listUni">商品一覧</a><br>
		<a href="<%=request.getContextPath()%>/showCart">カート確認</a><br>
		<a href="<%=request.getContextPath()%>/listOrder">注文履歴</a><br>
		<a href="<%=request.getContextPath()%>/view/changeUser.jsp">会員情報変更</a><br>

		<br>
	</div>
</aside>
