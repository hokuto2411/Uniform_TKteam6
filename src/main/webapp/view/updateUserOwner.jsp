<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.User, util.MyFormat"%>


<%--ユーザー情報の表示のみ --%>

<%
ArrayList<User> user = (ArrayList<User>) request.getAttribute("user_list");

%>


<html>
<head>

<title>ユーザー管理</title>

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

	<%@include file="/common/sidebar_Owner.jsp"%>



	<main>
		<h2 style="text-align: center">ユーザー一覧</h2>

		<table style="margin: auto;">

			<tr style="height: 10px">
				<th style="text-align: center">名前</th>
				<th style="text-align: center">住所</th>
				<th style="text-align: center">ID</th>
				<th style="text-align: center">パスワード</th>
				<th style="text-align: center">有効(0)</th>
				<th style="text-align: center">削除</th>
			</tr>

			<%
			System.out.println(user);
			if (user != null) {
				for (int i = 0; i < user.size(); i++) {
			%>


			<tr style="height: 10px">
				<td style="text-align: center"><%=user.get(i).getUsername()%></td>
				<td style="text-align: center"><%=user.get(i).getAddress()%></td>
				<td style="text-align: center"><%=user.get(i).getUserid()%></td>
				<td style="text-align: center"><%=user.get(i).getPassword()%></td>

				<%
				if (user.get(i).getUserfrag() == 0) {
				%>
				<td style="text-align: center">有効</td>
				<td style="text-align: center">
				<a href="<%=request.getContextPath()%>/deleteUser?userno=<%=user.get(i).getUserno()%>">削除</a>

				<%
				}
				else{
				%>
				<td style="text-align: center"><%=user.get(i).getUserfrag()%></td>
				<td></td>
				<%
				}
				%>


			</tr>
			<%
			}
			}
			%>

		</table>


	</main>

</body>
</body>
</html>
