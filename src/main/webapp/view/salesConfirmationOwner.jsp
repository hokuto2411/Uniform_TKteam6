<!--管理者：売上確認 SalesConfirmationOwner-->
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order"%>
<%@page import="java.util.ArrayList,dao.OrderDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="util.MyFormat"%>
<%
MyFormat fmt = new MyFormat();
ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("order_list");
int lastmonth = (int) request.getAttribute("lastmonth");
int lastmonth2;
if (lastmonth == 1) {
	lastmonth2 = 12;
} else {
	lastmonth2 = lastmonth - 1;
}

int lastmonth3 = (lastmonth2 == 1) ? 12 : lastmonth2 - 1;
int lastmonth4 = (lastmonth3 == 1) ? 12 : lastmonth3 - 1;

OrderDAO orderDaoObj = new OrderDAO();

int sales1 = orderDaoObj.sumPriceByMonth(lastmonth4);
int sales2 = orderDaoObj.sumPriceByMonth(lastmonth3);
int sales3 = orderDaoObj.sumPriceByMonth(lastmonth2);
int sales4 = orderDaoObj.sumPriceByMonth(lastmonth);

int maxBudget = 100000;
int graphHeight = 110;

int y1 = graphHeight - ((sales1 * graphHeight) / maxBudget) + 30;
int y2 = graphHeight - ((sales2 * graphHeight) / maxBudget) + 30;
int y3 = graphHeight - ((sales3 * graphHeight) / maxBudget) + 30;
int y4 = graphHeight - ((sales4 * graphHeight) / maxBudget) + 30;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者：売上確認</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Owner.css">
<style>
.html-graph-container {
	width: 70%;
	margin: auto;
	background-color: #ffffff;
	padding: 30px;
	border: 2px solid #000000;
	font-family: "Meiryo", sans-serif;
}

.graph-labels-x {
	display: flex;
	justify-content: space-between;
	padding: 0 40px;
	margin-top: 10px;
	font-weight: bold;
	font-size: 14px;
}

.label-x-item {
	width: 60px;
	text-align: center;
}
</style>
</head>

<body>
	<%@ include file="/common/header_Owner.jsp"%>

	<div class="container">
		<%@include file="/common/sidebar_Owner.jsp"%>

		<main>
			<h1>売上確認（時間軸・売上分析）</h1>

			<div class="html-graph-container">
				<h4 style="margin: 0 0 20px 0; text-align: center;">■ 月別売上推移グラフ</h4>

				<svg viewBox="0 0 500 150"
					style="width: 100%; height: auto; background-color: #fafafa; border-bottom: 2px solid #333; border-left: 2px solid #333;">
					
					<line x1="0" y1="50" x2="500" y2="50" stroke="#eee"
						stroke-dasharray="5,5" />
					<line x1="0" y1="100" x2="500" y2="100" stroke="#eee"
						stroke-dasharray="5,5" />
					
					<polyline fill="none" stroke="#00FFFF" stroke-width="4"
						points="50,<%=y1%> 183,<%=y2%> 316,<%=y3%> 450,<%=y4%>" />
					
					<circle cx="50" cy="<%=y1%>" r="5" fill="#333" />
					<circle cx="183" cy="<%=y2%>" r="5" fill="#333" />
					<circle cx="316" cy="<%=y3%>" r="5" fill="#333" />
					<circle cx="450" cy="<%=y4%>" r="5" fill="#333" />
					
					<!-- 💡 修正ポイント：文字をポチの「真上(-12px)」に戻し、真ん中揃えにします -->
					<text x="50" y="<%=y1 - 12%>" font-size="11" font-weight="bold"
						text-anchor="middle"><%=fmt.moneyFormat(sales1)%></text>
					<text x="183" y="<%=y2 - 12%>" font-size="11" font-weight="bold"
						text-anchor="middle"><%=fmt.moneyFormat(sales2)%></text>
					<text x="316" y="<%=y3 - 12%>" font-size="11" font-weight="bold"
						text-anchor="middle"><%=fmt.moneyFormat(sales3)%></text>
					
					<!-- 💡 重要：6月だけX座標を「440」に少し左に寄せ、右端の枠線への衝突を完全に防ぎます！ -->
					<text x="440" y="<%=y4 - 12%>" font-size="11" font-weight="bold"
						text-anchor="middle"><%=fmt.moneyFormat(sales4)%></text>
				</svg>


				<div class="graph-labels-x">
					<div class="label-x-item"><%=lastmonth4%>月
					</div>
					<div class="label-x-item"><%=lastmonth3%>月
					</div>
					<div class="label-x-item"><%=lastmonth2%>月
					</div>
					<div class="label-x-item"><%=lastmonth%>月
					</div>
				</div>
			</div>

			<br>
			<br>

			<table border="1"
				style="margin: auto; width: 60%; border-collapse: collapse; text-align: center;">
				<tr style="background-color: #f2f2f2;">
					<th>対象月</th>
					<th>売上金額（発送完了分）</th>
			</tr>
				<tr>
					<td><%=lastmonth4%>月の売り上げ</td>
					<td><%=fmt.moneyFormat(sales1)%></td>
			</tr>
				<tr>
					<td><%=lastmonth3%>月の売り上げ</td>
					<td><%=fmt.moneyFormat(sales2)%></td>
			</tr>
				<tr>
					<td><%=lastmonth2%>月の売り上げ</td>
					<td><%=fmt.moneyFormat(sales3)%></td>
			</tr>
				<tr>
					<td><%=lastmonth%>月の売り上げ</td>
					<td><%=fmt.moneyFormat(sales4)%></td>
			</tr>
			</table>

		</main>
	</div>
</body>
</html>
