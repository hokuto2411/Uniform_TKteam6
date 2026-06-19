<!--オーナー：商品変更 listUniOwner-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/Owner.css">


<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/NewFile.css">
</head>
  
  <body>
  <%@ include file="/common/header_Owner.jsp"%>
    
     <div class="container">
  <%@include file="/common/sidebar_Owner.jsp"%>	
       
        <main>
  <table style="margin:auto; width:350px; table-layout: fixed">
	<tr>
    <td style="text-align:left; font-size: 30px;">
    商品名
    </td>
   </tr>
    <tr>
      <td><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYfcZJYeC7UfwWM60-5LqIJ3XIc9qutvSFAQxyXmsBEUiuICCSlr0fPb-VFB1gC-WglMkIEwiIBXIvFlQiAxwBfXSqDd3B1CHEL_lhicXfZvnxDjiSxSWoBFoj8ISL5c78WbABA0PeY5EneBQTgMWCuTtDc6lhuv99Twcm_jz1BskZCY0nhtu_hWtAUoBx/s900/genki_pose_schoolboy.png" alt="ユニフォーム" class="sample-image"></td>
    </tr>
    <tr>
    <th>商品説明</th>
      <td>元気がみなぎる小学生</td>
    </tr>
  </table>
  
  	<div style="text-align: center; padding-top: 200px; height:50px; width:200px">
 	<input type="hidden" name="unino" value=>
  	<input type="submit"  value="変更完了">
	</div>
       </main>
       
     <aside class="rightside-item">
		<p>価格</p>
		<input type=text size="30" name="userid" value=商品名><br>
      	<input type=text size="30" name="userid" value=在庫数><br>
	  	<input type=text size="30" name="userid" value=価格><br>
 	 </aside>
    </div>
  </body>
</html>