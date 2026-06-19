<!--管理者：商品登録画面 InsertUniOwner-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/Owner.css">

<head>
	<meta charset="UTF-8">
	<title>管理者：商品登録</title>
	<link rel="stylesheet" href="NewFile_Owner.css">
</head>

<body>
		<%@ include file="/common/header_Owner.jsp"%>

		<div class="container">
			<%@include file="/common/sidebar_Owner.jsp"%>	

			<main>
				<h2 style="text-align:center">
					商品登録画面
				</h2>

				<form action="">
					<table style="margin:auto; width:50%; table-layout: fixed; border-collapse: collapse; border: 1px solid #ccc; 
		">
						<tr style="height:100px;">
							<td colspan="2">写真</td>
						</tr>
						<tr>
							<th>商品名</th>
							<td><input type="text" name="Uni" value=""></td>
						</tr>
						<tr>
							<th>値段</th>
							<td><input type="text" name="price" value=""></td>
						</tr>
						<tr>
							<th>在庫</th>
							<td><input type="text" name="stock" value=""></td>
						</tr>
						<tr style="height:50px;">
							<td colspan="2"><input type="text" name="detail" value="説明"></td>
						</tr>
					</table>
					<input type="submit" name="" value="登録">
				</form>

			</main>
		</div>
	</body>
</body>

</html>