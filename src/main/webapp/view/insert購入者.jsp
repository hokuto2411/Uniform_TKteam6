<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert 購入者</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/User.css">
</head>
<body>
	<%@ include file="/common/header_User.jsp"%>
	<div class="container">
		<%@include file="/common/sidebar_User.jsp"%>	
		<main>
			
			<h1>購入者情報</h1>
			
			<form action="/kakuninn">
				<table>
					<tr>
						<th>名前</th>
						<td><input type="text" name="UserName"></td>
					</tr>
						<th>住所</th>
						<td><input type="text" name="address"></td>
					<tr>	
				</table>
				<input type="submit" name="kounyu-" value="確認">
			</form>
			
		</main>
	</div>
	
</body>
</html>