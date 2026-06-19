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



		<table style="
						text-align:right;
						width: 80%;
						table-layout: fixed;
						border-collapse: separate;
  						border-spacing: 10px;
  						border:0px;">

				<tr>
					<td>商品A</td>
					<td>商品B</td>
					<td>商品C</td>
				</tr>
				<tr style="height: 150px;">
					<td>
						<p>写真A</p>
					</td>
					<td>
						<p>写真B</p>
					</td>
					<td>
						<p>写真C</p>
					</td>
				</tr>
				<tr>
					<td>商品D</td>
					<td>商品E</td>
					<td>商品F</td>
				</tr>
				<tr style="height: 150px;">
					<td>
						<p>写真D</p>
					</td>
					<td>
						<p>写真E</p>
					</td>
					<td>
						<p>写真F</p>
					</td>
				</tr>
				<tr>
					<td>商品G</td>
					<td>商品H</td>
					<td></td>
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
