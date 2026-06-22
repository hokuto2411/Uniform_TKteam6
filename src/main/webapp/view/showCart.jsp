<!--ユーザー：カート内確認 showCart-->

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="util.MyFormat"%>
<%@page import="java.util.ArrayList,bean.Order"%>
<%@page import="java.util.ArrayList,bean.OrderDetail"%>
<%@page import="java.util.ArrayList,bean.Uni"%>
<%@page import="java.util.ArrayList,dao.UniformDAO"%>
<%
MyFormat fmt = new MyFormat();
ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>) request.getAttribute("detail_list");
ArrayList<Uni> uni_list = (ArrayList<Uni>) request.getAttribute("uni_list");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>カート内容確認</title>
	<link rel="stylesheet" href="User.css">
</head>

<body>

	<%@ include file="/common/header_User.jsp"%>

	<div class="container">
		<%@include file="/common/sidebar_User.jsp"%>

		<main style="width: 100%;">
			<table style="margin: auto">

				<tr>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">No
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">種類
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">個数
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">価格
					</th>
					<th style="background-color: #00FFFF; text-align: center; vertical-align: middle; width:150px">削除
					</th>
				</tr>
				
				<%
				int total = 0;
				UniformDAO UniDao = new UniformDAO();
				for(int i=0; i < detail_list.size(); i++){
					OrderDetail detail = (OrderDetail) detail_list.get(i);
					Uni uni = UniDao.selectByunino(detail.getUnino());
					total += uni.getPrice();
				%>
				<tr>
					<td style="text-align: center; width: 400px"><%=detail.getOrderno() %></td>
					<td style="text-align: center; width: 400px"><%=uni.getUniname() %></td>
					<td style="text-align: center; width: 400px"><%=detail.getQuantity() %></td>
					<td style="text-align: center; width: 400px"><%=uni.getPrice() %></td>
					<td style="text-align: center; width: 400px">
					<a href="<%=request.getContextPath()%>/showCart?delunino=<%=uni.getUnino()%>">削除</a>
					</td>
				</tr>
				<%
				}
				%>
			</table>
			<br>
			<br>
			<hr style="height:1px; background-color:black;">
			<hr style="height:1px; background-color:black;">

			<div style="text-align: center;">
				<table style="margin: 0 auto;">
					<tr>
						<th style="background-color: #00FFFF">合計</th>
						<td><%=total %></td>
					</tr>
				</table>
			</div>
			<br>

			<form action="" method="get">

				<div style="text-align: center;">
					<input type="submit" name="Payment" value="購入に進む"></input>
				</div>

			</form>


		</main>
	</div>
</body>
</html>