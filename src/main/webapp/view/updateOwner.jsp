<!--管理者：管理者情報変更 updateOwner-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/Owner.css">
		
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="NewFile.css">
</head>
<body>
	<body>
	  <%@ include file="/common/header_Owner.jsp"%>
	  
	  <div class="container">
	 <%@include file="/common/sidebar_Owner.jsp"%>
	  
	  <main>
	  <h2 style="text-align:center">
	    管理者情報, 修正画面
	  </h2>
	    
	  <form action="">
	    <table style="margin:auto; width:50%; table-layout: fixed; border-collapse: collapse; border: 1px solid #ccc; 
		">
	      <tr>
	        <th>名前</th>
	        <td><input type="text" name="name" value="taro"></td>
	      </tr>
	      <tr>
	        <th>住所</th>
	        <td><input type="text" name="" value=""></td>
	      </tr>
	      <tr>
	        <th>ID</th>
	        <td><input type="text" name="" value=""></td>
	      </tr>
	      <tr>
	        <th>パスワード</th>
	        <td><input type="text" name="" value=""></td>
	      </tr>
	      
	      
	    </table>
	    <input type="submit" name="" value="修正">
	    </form>
	    
	    </main>
	  </div>
	</body>
</body>
</html>