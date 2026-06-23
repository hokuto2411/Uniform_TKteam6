<!--管理者：注文詳細 detailOrderedItemOwner-->

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="bean.Order,bean.User" %>

<%
Order order = (Order)request.getAttribute("order");
User user = (User)request.getAttribute("user");

int orderno = 0;
int send = 0;

String userid = "";
String username = "";
String address = "";
String mailaddress = "";

if(order != null){

    orderno = order.getOrderno();
    send = order.getSend();

}

if(user != null){

    userid = user.getUserid();
    username = user.getUsername();
    address = user.getAddress();
    mailaddress = user.getMailaddress();

}
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>注文詳細画面</title>
<link rel="stylesheet" href="NewFile.css">
</head>

<body>
<header>
    <h1 style="text-align:center">
        注文詳細画面
    </h1>

    <hr style="height:5px; background-color:#00FFFF;">
</header>

<div class="wrapper">

<main>

<table class="detail-table">

    <tr>
        <th>注文番号 :</th>
        <td><%= orderno %></td>
    </tr>

    <tr>
        <th>発送状況 :</th>

        <td>

        <%
        if(send == 0){
        %>

            未発送

        <%
        }else{
        %>

            発送済

        <%
        }
        %>

        </td>

    </tr>

    <tr>
        <th colspan="2">注文者情報</th>
    </tr>

    <tr>
        <th>ユーザーID :</th>
        <td><%= userid %></td>
    </tr>

    <tr>
        <th>名前 :</th>
        <td><%= username %></td>
    </tr>

    <tr>
        <th>住所 :</th>
        <td><%= address %></td>
    </tr>

    <tr>
        <th>メールアドレス :</th>
        <td><%= mailaddress %></td>
    </tr>

</table>

<br>

<form action="<%= request.getContextPath() %>/updateOrderStatus"
      method="post">

    <input type="hidden"
           name="orderno"
           value="<%= orderno %>">

    <select name="send">

        <option value="0">未発送</option>
        <option value="1">発送済</option>

    </select>

    <input type="submit" value="変更">

</form>

<br><br>

<div style="text-align:center">

    [<a href="<%= request.getContextPath() %>/showOrderedItemOwner">注文一覧
    </a>]

</div>

</main>

</div>

</body>
</html>
