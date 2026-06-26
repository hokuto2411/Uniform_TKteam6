<%@page contentType="text/html; charset=UTF-8"%>
<%@page import ="bean.User" %>
<%
User user =(User)request.getAttribute("user");

%>

<html>
	<head>
		<title>会員情報変更確認画面</title>
		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/User.css">
	</head> 
<body>

<%@include file="/common/header_User.jsp"%>

<h1 style="padding-top: 200px; text-align: center">会員情報変更確認画面</h1>
       
    <table style="margin:0 auto; width:50%; height:300px; border-spacing:5px; table-layout:fixed">
    <tr>
       <th style="text-align: center">ユーザーID</th>
       <td style="border: none; text-align: center"><%=user.getUserid() %></td>
    </tr>
    <tr>
     <th style="text-align: center">パスワード</th>
       <td style="border: none; text-align: center"><%=user.getPassword() %></td>
    </tr>
    <tr>
      <th style="text-align: center">名前</th>
       <td style="border: none; text-align: center"><%=user.getUsername() %></td>
    </tr>
    <tr>
      <th style="text-align: center">住所</th>
	  <td style="border: none; text-align: center"><%=user.getAddress() %></td>
    </tr>
    <tr>
     <th style="text-align: center">メールアドレス</th>
	   <td style="border: none; text-align: center"><%=user.getMailaddress() %></td>
    </tr>
	
	</table>
	
		<div style="margin: auto; text-align: center; padding-top:20px; height:50px; width:200px">
		<form action="<%= request.getContextPath()%>/changeUser" method="post">
		<input type="hidden" name="userid" value="<%=user.getUserid()%>">
		<input type="hidden" name="password" value="<%=user.getPassword()%>">
		<input type="hidden" name="username" value="<%=user.getUsername()%>">
		<input type="hidden" name="address" value="<%=user.getAddress()%>">
		<input type="hidden" name="mailaddress" value="<%=user.getMailaddress()%>">
		<input type="hidden" name="authority" value="<%=user.getAuthority()%>">
		
		<input type="submit"  value="登録"class="color-change">
		</form>
		</div>
  
  </body>
</html>
