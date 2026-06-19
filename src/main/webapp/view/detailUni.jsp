<!--ユーザー：商品詳細 detailUni-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/User.css">

<%@ include file="/common/header_User.jsp"%>

<body>

	<%@include file="/common/sidebar_User.jsp"%>

	<div class="container">
		<aside>
			<div class="side-item">
				<br>
				<a href="">商品一覧</a><br>
				<a href="">注文履歴</a><br>
				<a href="">ユーザー情報変更</a><br>
				<a href="">ログイン</a><br>
				<br>
			</div>
		</aside>


		<main style="margin-top: 40px;
						  padding-left:2%;
						  text-align:center;">
			<h2 style="text-align:center">
				商品詳細画面
			</h2>

			<form action="" method="get">


				<table style="margin: 0 auto;">
					<tr>
						<td rowspan="4">
							<h1>商品画像</h1>
						</td>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">
							種類</th>
						<td style="text-align: center; vertical-align: middle;">ユニフォーム</td>
					</tr>
					<tr>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">サイズ</th>
						<td style="text-align: center; vertical-align: middle;">F</td>
					</tr>
					<tr>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">価格</th>
						<td style="text-align: center; vertical-align: middle;">￥11,111</td>
					</tr>
					<tr>
						<th style="background-color: #00FFFF; text-align: center; vertical-align: middle;">在庫状況</th>
						<td style="text-align: center; vertical-align: middle;">ラスト1点</td>
					</tr>
				</table>

			</form>

			<br>
			<br>


			<form action="" method="get">
				<div style="text-align:center;">
					<table style="margin: 0 auto;">
						<tr>
							<td><input type="submit" name="change" value="カートに入れる"></td>
						</tr>
					</table>
				</div>
			</form>

		</main>
	</div>
</body>
