<!--ユーザー：注文履歴確認 showOrderedItem-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/User.css">

<head>
	<meta charset="UTF-8">
	<title>注文履歴一覧</title>
	<link rel="stylesheet" href="User.css">
</head>

<body>

	<%@ include file="/common/header_User.jsp"%>

	<div class="container">
		<%@include file="/common/sidebar_User.jsp"%>

		<main style="width: 100%;">

			<h2 style="text-align: center;">注文履歴</h2>
			<br>
			<br>

			<table style="margin: auto">
				<tr>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">注文No
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">合計金額
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">発送状況
					</th>

				</tr>
				<tr>
					<td style="text-align: center; width: 400px">1</td>
					<td style="text-align: center; width: 400px">1億</td>
					<td style="text-align: center; width: 400px">発送済み</td>

				</tr>
			</table>

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

