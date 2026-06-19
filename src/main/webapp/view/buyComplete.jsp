<!--ユーザー：購入完了 buyComplete-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/User.css">

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="User.css">
</head>
  
  <body>
 <%@ include file="/common/header_User.jsp"%>
    
     <div class="container">
  <%@include file="/common/sidebar_User.jsp"%>	
       
        <main>
  <h2 style="text-align:center; margin-top: 0; margin-bottom: 10px">
    購入が完了しました。<br>
    ご利用ありがとうございました。<br>
    メールを送信したので確認してください。
  </h2>
          <div style="text-align: center; margin-top: 50px; font-size: 20px;">
              <a href="">商品一覧へ</a>
          </div>
       </main>  
    </div>
  </body>