<!--ユーザー：ヘッダー header_User-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/User.css">

<header
	style="position: fixed; top: 0; left: 0; width: 100%; z-index: 1000; background-color: #FF0000;">

	<div style="float: right;">
		<table>
			<tr>
				<td style="border: none; font-size: 20px"><a
					href="<%=request.getContextPath()%>/logout">ログアウト</a></td>
			</tr>
		</table>
	</div>


	<a href="<%=request.getContextPath()%>/view/menu.jsp"> <img
		src="<%=request.getContextPath()%>/file/logo.png"
		style="width: 20%; margin: 5px auto" alt="ゆにふぉ～むのホーム">
	</a>
	<hr style="height: 5px; background-color: white;">

</header>
