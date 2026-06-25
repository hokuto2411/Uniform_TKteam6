<!-- ユーザー：会員情報確認画面 userConfirm.jsp -->
<!DOCTYPE html>
<html>

<head>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import ="bean.User" %>
<title>会員情報確認画面</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/User.css">
</head>

<%
User user =(User)request.getAttribute("user");
%>
  
<body>
	<!-- ヘッダー -->
	<%@include file="/common/header_User.jsp"%>
	
	<!-- サブタイトル -->
	<h1 style="text-align:center; padding-top:150px">
	  会員情報確認画面
	</h1>

	<hr style="height: 5px; background-color: #00FFFF; width:600px; margin-top:30px; ">
    
    <!-- コンテンツ -->
    <table style="margin:auto; padding-top: 50px; width:500px">
    <tr>
    	<th style="border: none; text-align: center">ユーザーID</th>
      	<td style="border: none; text-align: center"><%=user.getUserid() %></td>
    </tr>
    <tr>
      	<th style="border: none; text-align: center">パスワード</th>
      	<td style="border: none; text-align: center"><%=user.getPassword() %></td>
    </tr>
    <tr>
      	<th style="border: none; text-align: center">名前</th>
      	<td style="border: none; text-align: center"><%=user.getUsername() %></td>
    </tr>
    <tr>
      	<th style="border: none; text-align: center">住所</th>
	  	<td style="border: none; text-align: center"><%=user.getAddress() %></td>
    </tr>
    <tr>
      	<th style="border: none; text-align: center">メールアドレス</th>
	  	<td style="border: none; text-align: center"><%=user.getMailaddress() %></td>
    </tr>
	<tr>
      	<th style="border: none; text-align: center">権限</th>
      
    <%
    	String s;
    	if(user.getAuthority()==0){
      		s = "一般ユーザー";
      	}else{
    		s="管理者";
      	}
    %>
    
	  	<td style="border: none; text-align: center"><%=s %></td>
    </tr>
	</table>
	
	<div style="margin:30px auto; text-align: center;  height:50px; width:200px">
		<form action="<%= request.getContextPath()%>/insertUser" method="post">
		
		<input type="hidden" name="userid" value="<%=user.getUserid()%>">
		<input type="hidden" name="password" value="<%=user.getPassword()%>">
		<input type="hidden" name="username" value="<%=user.getUsername()%>">
		<input type="hidden" name="address" value="<%=user.getAddress()%>">
		<input type="hidden" name="mailaddress" value="<%=user.getMailaddress()%>">
		<input type="hidden" name="authority" value="<%=user.getAuthority()%>">
		
		<input type="submit"  value="登録">
		</form>
	</div>
  
  </body>
</html>
