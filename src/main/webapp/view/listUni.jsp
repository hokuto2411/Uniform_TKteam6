<!--共通：商品一覧 listUni-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/User.css">

<body>
	<%@ include file="/common/header_User.jsp"%>

	<div class="container">
	<%@include file="/common/sidebar_User.jsp"%>	

		<main>
		<div style="position:sticky;
					top:150px;
					width:150px;
					padding-right:30px;
					float:right;
					text-align:right;
					padding-left:10px;
					border: 1px solid #333333;
					border-radius: 10px; ">
			<p>ユーザー名<% %><br>		<%--ユーザー名 --%>
			<% %>			<%--ログインしていない場合 --%>
			<a href="">ログイン</a><br>	<%--ログインのリンク --%>
			<% %>			<%--ログインしている場合 --%>
			<a href="">ログアウト</a><br>	<%--ログアウト --%>
			<br>
		</div>
		
		<h1>商品一覧画面</h1>

		<div style="text-align:right;
					padding-right:400px;
					margin-bottom: 20px;">
			<a href="">新規作成</a> / <a href="">変更</a>
		</div>



		<table style="margin:0 auto;
						width: 50%;
						table-layout: fixed;
						border-collapse: separate;
  						border-spacing: 10px;
  						border:0px;">

				<tr>
					<td>ゆにふぉ～む</td>
					<td>ユニフォームB</td>
					<td>ゆにふぉーむ</td>
				</tr>
				<tr style="height: 150px;">
					<td>
						<p>写真</p>
					</td>
					<td>
						<p>写真</p>
					</td>
					<td>
						<p>写真</p>
					</td>
				</tr>
				<tr>
					<td>ゆにふぉ～む</td>
					<td>ユニフォームB</td>
					<td>ゆにふぉーむ</td>
				</tr>
				<tr style="height: 150px;">
					<td>
						<p>写真</p>
					</td>
					<td>
						<p>写真</p>
					</td>
					<td>
						<p>写真</p>
					</td>
				</tr>
				<tr>
					<td>ゆにふぉ～む</td>
					<td>ユニフォームB</td>
					<td>ゆにふぉーむ</td>
				</tr>
				<tr style="height: 150px;">
					<td>
						<p>写真</p>
					</td>
					<td>
						<p>写真</p>
					</td>
					<td>
						<p>写真</p>
					</td>
				</tr>
			</table>

		</main>
	</div>
</body>