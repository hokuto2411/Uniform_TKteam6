<!--ユーザー：注文履歴詳細 detailShowOrderedItem-->

<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/User.css">

<head>
<meta charset="UTF-8">
<title>注文詳細画面</title>
<link rel="stylesheet" href="User.css">
</head>
<body>
  <%@ include file="/common/header_User.jsp"%>
  
<div class="container">
  <%@include file="/common/sidebar_User.jsp"%>

  
  <main>
  <h2 class="title2">
    注文詳細画面
  </h2>
    <form>
    <table class="orderlist1">
      <tr>
       <td>注文No</td>
        <td>発送状況</td>
        <td>日付</td>
      </tr>
      <tr>
        <td>1234567</td>
      	<td>
        <select name="Status" class="status">
          <option value="wait">入金待ち</option>
          <option value="">発送準備中</option>
          <option value="">発送済み</option>
          </select></td>
        <td>2026/01/01</td>
      </tr>
	  <tr>
		<td colspan="3" class="Otd3"><input type="submit" name="update" value="変更"></td>
	  </tr>
    </table>
    </form>
  <table class="orderlist2">
	<tr>
      <td class="Otd1"><img class="picture" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhyz_GWHItwggDCX6HCewS9qCtcLY7DrzUQYGeRVPGMqSBzsOpMIFOrIpivmiikePuYRpO2o54TTCTY1WNK4vhmKWWoqbY7NGmbE_TXtVAeGqVBdnmXfKqeSB3swhdhZnjtKC1HQlblgtk/s800/baseball_man1_red.png"></td>
      <td>ユニフォームA</td>
      <td>Free</td>
      <td>32</td>
      <td>￥80,000</td>
      <tr>
          <td><img class="picture" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhyz_GWHItwggDCX6HCewS9qCtcLY7DrzUQYGeRVPGMqSBzsOpMIFOrIpivmiikePuYRpO2o54TTCTY1WNK4vhmKWWoqbY7NGmbE_TXtVAeGqVBdnmXfKqeSB3swhdhZnjtKC1HQlblgtk/s800/baseball_man1_red.png"></td>
      <td>ユニフォームA</td>
      <td>Free</td>
      <td>32</td>
      <td>￥80,000</td>
    </tr>
	</table>
  </div>
  </main>
  </div>
 </body>
