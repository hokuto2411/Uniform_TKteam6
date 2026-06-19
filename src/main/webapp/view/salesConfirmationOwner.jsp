<!--管理者：売上確認 SalesConfirmationOwner-->
<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/Owner.css">

<head>
	<meta charset="UTF-8">
	<title>管理者：売上確認</title>
	<link rel="stylesheet" href="NewFile_Owner.css">
</head>

<body>

	<body>
		<%@ include file="/common/header_Owner.jsp"%>

		<div class="container">
			<%@include file="/common/sidebar_Owner.jsp"%>	

			<main>
				<h2 style="text-align:center">
					売上確認
				</h2>
				<img src="売上確認.png">
				<p style="text-align: right">
					11月の売り上げ（発送完了分）　　　　￥8,000
				</p>
				<p style="text-align: right">
					10月の売り上げ（発送完了分）　　　　　￥900
				</p>

			</main>
		</div>
	</body>
</body>
