<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.User, util.MyFormat"%>


<%--ユーザー情報の表示のみ --%>

<%
ArrayList<User> user = (ArrayList<User>) session.getAttribute("user_list");

%>


<html>
<head>

<title>ユーザー管理</title>
<link rel="stylesheet" href="../css/User.css">
</head>
<body>

	<%@include file="/common/header_Owner.jsp"%>
	
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	
	<%@include file="/common/sidebar_User.jsp"%>

	<div style="text-align:center;">

		<main>
			<h2 style="text-align: center">ユーザー一覧</h2>

			<form action="">

			


				<table
					style="margin: auto; width: 50%; table-layout: fixed; border-collapse: collapse; border: 1px solid #ccc;">
					<tr>
						<th>名前</th>
						<th>住所</th>
						<th>ID</th>
						<th>パスワード</th>
					</tr>
					
						<%
					if (user != null) {
						for (int i = 0; i < user.size(); i++) {
						User objUser = user.get(i);
				%>

					
					<tr>
						<td><input type="text" name="username" value=<%=objUser.getUsername()%>></td>
						<td><input type="text" name="address" value=<%=objUser.getAddress()%>></td>
						<td><input type="text" name="userid" value=<%=objUser.getUserid()%>></td>
						<td><input type="text" name="password" value=<%=objUser.getPassword()%>></td>
					</tr>
					<%
					}
					} else {

					}
					%>

				</table>
			</form>

		</main>
	</div>
</body>
</body>
</html>