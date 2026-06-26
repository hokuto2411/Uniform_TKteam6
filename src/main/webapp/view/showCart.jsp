<!--ユーザー：カート内確認 showCart-->

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="util.MyFormat"%>
<%@page import="java.util.ArrayList,bean.OrderDetail"%>
<%@page import="java.util.ArrayList,bean.Uniform"%>
<%@page import="java.util.ArrayList,dao.UniformDAO"%>
<%
UniformDAO UniformDaoObj = new UniformDAO();
MyFormat fmt = new MyFormat();
ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>) request.getAttribute("detail_list");
ArrayList<Uniform> uni_list = UniformDaoObj.selectAll();
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

		<main>
		
		<h1>カート内容確認</h1>
		
			<table style="margin: auto; width:100%">

				<tr style="height:50px;">
					<th
					style="background-color: #00FFFF; text-align: center; vertical-align: middle; width: 150px;">商品名
				</th>
					<th
					style="background-color: #00FFFF; text-align: center; vertical-align: middle; width: 150px">個数
				</th>
					<th
					style="background-color: #00FFFF; text-align: center; vertical-align: middle; width: 150px">価格
				</th>
					<th
					style="background-color: #00FFFF; text-align: center; vertical-align: middle; width: 150px">削除
				</th>
			</tr>

				<%
				int total = 0;
				UniformDAO UniDao = new UniformDAO();
				if(detail_list != null){
					if(uni_list != null){
						for(int i=0; i < detail_list.size(); i++){
							OrderDetail detail = (OrderDetail) detail_list.get(i);
							Uniform uni = UniDao.selectByUnino(detail.getUnino());
							total += uni.getPrice();
				%>
				<tr style="height:50px;">
					<td style="text-align: center; width: 400px; border:none"><%=uni.getUniname() %></td>
					<td style="text-align: center; width: 400px; border:none"><%=detail.getQuantity() %></td>
					<td style="text-align: center; width: 400px; border:none"><%=fmt.moneyFormat(uni.getPrice()*detail.getQuantity()) %></td>
					<td style="text-align: center; width: 400px; border:none"><a
						href="<%=request.getContextPath()%>/showCart?delunino=<%=uni.getUnino()%>">削除</a>
				</td>
			</tr>
				<%
				}}}
				%>
			</table> <br> <br>
			<hr style="height: 0.5px; margin-bottom:0.5px; background-color: black;">
			<hr style="height: 0.5px; margin-top:0.5px; background-color: black;">

			<table style="float:right; width:30%">
				<tr>
					<th style="background-color: #00FFFF; border:2; text-align:center">合計</th>
					<td style=" border:none; text-align:center"><%=fmt.moneyFormat(total) %></td>
				</tr>
				</table>
			
			<br>

			<form action="<%=request.getContextPath() %>/buyConfirm" method="get">

				<div style="text-align: center; margin-top:50px;">
					<input type="submit" name="Payment" size="30px" value="購入に進む"
							class="color-change"></input>
				</div>

			</form>


		</main>
	</div>
</body>
</html>
