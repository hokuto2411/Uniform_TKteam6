<%@page contentType="text/html; charset=UTF-8"%>
<%@page import ="bean.User" %>
<%
User user =(User)request.getAttribute("user");

%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>会員情報更新確認画面</title>
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/NewFile.css">
</head>
  
  <body>
  <header>
  	<h1 style="text-align:center">
	  会員情報更新確認画面
	</h1>
	<hr style="height:5px; background-color: #00FFFF;">
  </header>
    
     <div class="container">
       
  <table style="margin:auto; padding-top: 50px; width:500px">
    <tr>
      <th>ユーザーID</th>
      <td style="text-align: center; width: 200px"><%=user.getUserid() %></td>
    </tr>
    <tr>
      <th>パスワード</th>
      <td style="text-align: center; width: 200px"><%=user.getPassword() %></td>
    </tr>
    <tr>
      <th>名前</th>
      <td style="text-align: center; width: 200px"><%=user.getUsername() %></td>
    </tr>
    <tr>
      <th>住所</th>
	  <td style="text-align: center; width: 200px"><%=user.getAddress() %></td>
    </tr>
    <tr>
      <th>メールアドレス</th>
	  <td style="text-align: center; width: 200px"><%=user.getMailaddress() %></td>
    </tr>
	<tr>
      <th>権限</th>
      <%String s;
      if(user.getAuthority()==0){
      s = "一般ユーザー";
      }else{
    	s="管理者";
      }
    	  %>
      
      
	  <td style="text-align: center; width: 200px"><%=s %></td>
    </tr>
	</table>
	    </div> 
	
		<div style="margin: auto; text-align: center; padding-top: 200px; height:50px; width:200px">
		<form action="<%= request.getContextPath()%>/changeUser" method="post">
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