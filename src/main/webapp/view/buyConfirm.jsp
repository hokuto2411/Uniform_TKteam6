<!--ユーザー：購入確認 buyConfirm-->

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
	<table class="image-table">
	  	<tr>
		    <th style="width: 40%;">商品名</th>
		    <th style="width: 20%;">個数</th>
		    <th style="width: 10%;"></th> <th style="width: 30%;">小計</th>
	  	</tr>
			<tr>
		    <td><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYfcZJYeC7UfwWM60-5LqIJ3XIc9qutvSFAQxyXmsBEUiuICCSlr0fPb-VFB1gC-WglMkIEwiIBXIvFlQiAxwBfXSqDd3B1CHEL_lhicXfZvnxDjiSxSWoBFoj8ISL5c78WbABA0PeY5EneBQTgMWCuTtDc6lhuv99Twcm_jz1BskZCY0nhtu_hWtAUoBx/s900/genki_pose_schoolboy.png" alt="ユニフォーム" width="50"></td>
		    <td>1</td> <td></td>    <td>¥1,000</td> </tr>
		<tr>
			<th style="width: 40%;">商品名</th>
			<th style="width: 20%;">個数</th>
			<th style="width: 10%;"></th> <th style="width: 30%;">小計</th>
		</tr>
		<tr>
			<td><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYfcZJYeC7UfwWM60-5LqIJ3XIc9qutvSFAQxyXmsBEUiuICCSlr0fPb-VFB1gC-WglMkIEwiIBXIvFlQiAxwBfXSqDd3B1CHEL_lhicXfZvnxDjiSxSWoBFoj8ISL5c78WbABA0PeY5EneBQTgMWCuTtDc6lhuv99Twcm_jz1BskZCY0nhtu_hWtAUoBx/s900/genki_pose_schoolboy.png" alt="ユニフォーム" width="50"></td>
			<td>1</td> <td></td>    <td>¥1,000</td> </tr>
		<tr>
			<th style="width: 40%;">商品名</th>
			<th style="width: 20%;">個数</th>
			<th style="width: 10%;"></th> <th style="width: 30%;">小計</th>
		</tr>
		<tr>
			<td><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYfcZJYeC7UfwWM60-5LqIJ3XIc9qutvSFAQxyXmsBEUiuICCSlr0fPb-VFB1gC-WglMkIEwiIBXIvFlQiAxwBfXSqDd3B1CHEL_lhicXfZvnxDjiSxSWoBFoj8ISL5c78WbABA0PeY5EneBQTgMWCuTtDc6lhuv99Twcm_jz1BskZCY0nhtu_hWtAUoBx/s900/genki_pose_schoolboy.png" alt="ユニフォーム" width="50"></td>		
			<td>1</td> <td></td>    <td>¥1,000</td> </tr>
		</table>
</main>
          
     <aside class="rightside-item">
		<p style="font-size: 24px">購入情報</p>
		<p style="text-align: center; width: 200px">合計金額</p>
		<p>&nbsp;</p>
		<p style="text-align: center; width: 200px">購入者氏名</p>
		<p style="text-align: center; width: 200px">購入者住所</p>
 	 </aside>
    </div>
  </body>
</html>