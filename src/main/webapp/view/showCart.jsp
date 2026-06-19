<!--ユーザー：カート内確認 showCart-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/User.css">

<head>
	<meta charset="UTF-8">
	<title>カート内容</title>
	<link rel="stylesheet" href="User.css">
</head>

<body>

	<%@ include file="/common/header_User.jsp"%>

	<div class="container">
		<%@include file="/common/sidebar_User.jsp"%>


		<main style="width: 100%;">

			<table style="margin: auto">
				<tr>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">No
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">種類
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">個数
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">サイズ
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">価格
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">削除
					</th>
				</tr>
				<tr>
					<td style="text-align: center; width: 400px">1</td>
					<td style="text-align: center; width: 400px">ユニフォームA</td>
					<td style="text-align: center; width: 400px">２</td>
					<td style="text-align: center; width: 400px">F</td>
					<td style="text-align: center; width: 400px">100万円</td>
					<td style="text-align: center; width: 400px">削除</td>
				</tr>
			</table>
			<br>
			<br>
			<hr style="height:1px; background-color:black;">
			<hr style="height:1px; background-color:black;">

			<div style="text-align: center;">
				<table style="margin: 0 auto;">
					<tr>
						<th style="background-color: #00FFFF">合計</th>
						<td>100万円</td>
					</tr>
				</table>
			</div>
			<br>

			<form action="" method="get">

				<div style="text-align: center;">
					<input type="submit" name="Payment" value="購入に進む"></input>
				</div>

			</form>


			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>
			<p style="text-align:center;">PP</p>

		</main>
	</div>
</body>