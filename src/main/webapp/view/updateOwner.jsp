<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.User, util.MyFormat"%>

<%
User objUser=(User) session.getAttribute("user");
%>

<html>
<head>
<title>管理者情報変更画面</title>
</head>

<style>
td, th,input{
  font-size: 20px;
}
</style>
    
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
	
	<h1 style="text-align: center">変更内容入力</h1>
	<br>
	<form action="<%=request.getContextPath()%>/updateOwner" method="post">
	
			<table style="margin: auto; width:  600px">
				<tr>
				<td style="text-align:center; border: none; width: 150px ">名前：</td>
				<td style="border: none; width:250px">
				<input type="text" name="name">
				<input type="hidden" name="OriginalName" value=<%=objUser.getUsername()%>>
				</td>
				</tr>

				<tr>
				<td style="text-align:center; border: none; width: 100px ">住所：</td>
				<td style="border: none; width:250px">
				<input type="text" name="address">
				<input type="hidden" name="OriginalAddress" value=<%=objUser.getAddress()%>>
				</td>
				</tr>
				
				<tr>
				<td style="text-align:center; border: none; width: 100px ">ID：</td>
				<td style="border: none; width:250px">
				<input type="text" name="id">
				<input type="hidden" name="OriginalId" value=<%=objUser.getUserid()%>>
				</td>
				</tr>
				
				<tr>
				<td style="text-align:center; border: none; width: 100px ">パスワード：</td>
				<td style="border: none; width:250px"><input type="text" name="pass">
				<input type="hidden" name="OriginalPass" value=<%=objUser.getPassword()%>>
				</td>
				</tr>
				
				<tr>
				<td style="text-align:center; border: none; width: 100px ">メールアドレス：</td>
				<td style="border: none; width:250px">
				<input type="text" name="mail">
				<input type="hidden" name="OriginalMail" value=<%=objUser.getMailaddress()%>></td>
				</tr>
				
		</table>
		
		<br>
		<br>
		<div style="margin-left: 850px;"><input type="submit" name="update" value="変更"></div>

</form>
</body>
</html>