<!--管理者：商品一覧 listUniOwner-->
<!DOCTYPE html>
<html>

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Uniform"%>
<%@page import="java.util.ArrayList,bean.User,util.MyFormat"%>
UniformDAO uniDao = new UniformDAO();
ArartStock arart = new ArartStock();
ArrayList<Uniform> uni_list = uniDao.selectAll();
if(uni_list != null){
	for(int i=0; i < uni_list.size(); i++){
		Uniform uni = uni_list.get(i);
		if(uni.getStock() <= 5){
			arart.sendArart(user);
		}
	}
}
%>

<head>
	<title>管理者：商品一覧</title>
	<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Owner.css">
</head>
<%
MyFormat mft = new MyFormat();
%>

<body>
	<!-- ヘッダー -->
	<%@ include file="/common/header_Owner.jsp"%>
	
	<!-- コンテンツ -->
	<div class="container">
	
	<!-- サイドバー -->
	<%@include file="/common/sidebar_Owner.jsp"%>	

	<main>
		<!-- サブタイトル -->
		<h1>
				商品一覧画面(オーナー)
		</h1>		
		<div style="position:sticky;
					top:150px;
					width:150px;
					padding-right:30px;
					float:right;
					text-align:right;
					padding-left:10px;
					border: 1px solid #333333;
					border-radius: 10px; ">		
				<p style="text-align:left; padding-left:10px">ようこそ♪<br>
				<%--ユーザー名 --%>
				<%User user=(User)session.getAttribute("user"); %>
				<%if(user==null){ %>
				<%--ログインしていない場合 --%>
				<form action="<%=request.getContextPath()%>/login" method="post">
					<input type="submit" value="ログイン" class="color-change">
				</form>
				<%--ログインしている場合 --%>
				<%}else{ %>
				<p><%=user.getUsername()%>　様<br>
				<form action="<%=request.getContextPath()%>/logout" method="post">
					<input type="submit" value="ログアウト" class="color-change">
				</form>
				<%} %>
				<%--ログアウト --%>
				<br>
		</div>

		<div style="text-align:right;
					padding-right:300px;
					margin-bottom: 20px;
					">
			<h3><a href="<%=request.getContextPath()%>/view/insertUniOwner.jsp">▶商品を新規登録</a>
			</h3>
		</div>
		
		<div style="display:flex; gap:15px;flex-wrap: wrap;justify-content: gap;">
  						
  		<%
			//ユニフォーム情報の取得
			ArrayList<Uniform> list = (ArrayList<Uniform>) request.getAttribute("uniList");
			
			//ユニフォーム情報を獲得した分格納
			if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				Uniform uni = (Uniform) list.get(i);
		%>
			
			<div class="color-change3">
				<!-- 商品名 -->
				<p><a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>&cmdSwitch=owner">
						<%=uni.getUniname()%></a>
				<!-- 商品画像 -->
				<p><img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
					 alt="<%=uni.getUniname() %>"
					 style="height:150px;;border:1px brack;">
				<!-- 価格 -->
				<p><%=mft.moneyFormat(uni.getPrice())%>
				<!-- 在庫 -->
				<p>残り<%=uni.getStock()%>点
				</div>
		<%
				}

			}
		%>
		</div>

<!-- ==================== [押すな！！]ボタンと連続エラーメッセージ ==================== -->
<style>
/* [押すな！！] ボタンの見た目 */
.dont-press-btn {
    background-color: #ffcccc;
    color: #ff0000;
    border: 2px solid #ff0000;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    font-family: "MS Gothic", "Meiryo", sans-serif;
}
.dont-press-btn:hover {
    background-color: #ff9999;
}

/* エラー枠の箱 */
.error-window {
    position: fixed;
    width: 320px;
    background-color: #f0f0f0;
    border: 2px solid #888888;
    box-shadow: 3px 3px 0px #333333;
    z-index: 10000;
    font-family: "MS Gothic", "Meiryo", sans-serif;
    display: none;
}

/* エラー窓のヘッダー */
.error-header {
    background-color: #ff0000;
    color: #ffffff;
    padding: 5px 10px;
    font-weight: bold;
    font-size: 13px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* 右上の [×] ボタン */
.error-close-box {
    background-color: #e1e1e1;
    color: #000000;
    border: 1px solid #777777;
    font-size: 11px;
    padding: 1px 4px;
    cursor: pointer;
    font-weight: bold;
}

/* エラー窓の中身 */
.error-body {
    padding: 15px 15px;
    text-align: center;
    font-size: 14px;
    color: #000000;
}

/* 💡 ポップアップ内の最下部に置く「すべて消す」用ボタン */
.pop-clear-btn {
    margin-top: 12px;
    background-color: #ffffcc; /* 薄黄色 */
    color: #000000;
    border: 1px solid #333333;
    padding: 4px 15px;
    font-size: 12px;
    font-weight: bold;
    cursor: pointer;
}
.pop-clear-btn:hover {
    background-color: #ffcc00;
}
</style>

<!-- 画面に表示される「押すな！！」ボタン -->
<div style="text-align: center; margin: 20px 0;">
    <button class="dont-press-btn" onclick="startErrorExplosion()">押すな！！</button>
</div>

<!-- 1つ目のエラー -->
<div id="errWin1" class="error-window" style="top: 20%; left: 30%;">
    <div class="error-header">
        <span>致命的なエラー</span>
        <button class="error-close-box" onclick="closeSingleError(1)">[×]</button>
    </div>
    <div class="error-body">
        <p style="margin: 0;">データが開けません(Code: 001)</p>
        <button class="pop-clear-btn" onclick="clearAllErrors()">閉じる</button>
    </div>
</div>

<!-- 2つ目のエラー（右下） -->
<div id="errWin2" class="error-window" style="top: 28%; left: 36%;">
    <div class="error-header">
        <span>致命的なエラー</span>
        <button class="error-close-box" onclick="closeSingleError(2)">[×]</button>
    </div>
    <div class="error-body">
        <p style="margin: 0;">データが開けません(Code: 002)</p>
        <button class="pop-clear-btn" onclick="clearAllErrors()">閉じる</button>
    </div>
</div>

<!-- 3つ目のエラー（さらに右下） -->
<div id="errWin3" class="error-window" style="top: 36%; left: 42%;">
    <div class="error-header">
        <span>致命的なエラー</span>
        <button class="error-close-box" onclick="closeSingleError(3)">[×]</button>
    </div>
    <div class="error-body">
        <p style="margin: 0;">データが開けません(Code: 003)</p>
        <button class="pop-clear-btn" onclick="clearAllErrors()">閉じる</button>
    </div>
</div>

<!-- JavaScript -->
<script>
function startErrorExplosion() {
    // 時間差で各エラーポップアップを表示させる
    setTimeout(function() {
        document.getElementById('errWin1').style.display = 'block';
    }, 200);

    setTimeout(function() {
        document.getElementById('errWin2').style.display = 'block';
    }, 600);

    setTimeout(function() {
        document.getElementById('errWin3').style.display = 'block';
    }, 1000);
}

// [×] ボタンで個別に窓を閉じる関数
function closeSingleError(num) {
    var target = document.getElementById('errWin' + num);
    if (target) {
        target.style.display = 'none';
    }
}

// どのポップ内のボタンから押されても、1〜3の窓を一斉に全部非表示にする共通関数
function clearAllErrors() {
    for (var i = 1; i <= 3; i++) {
        var target = document.getElementById('errWin' + i);
        if (target) {
            target.style.display = 'none';
        }
    }
}
</script>
<!-- ================================================================== -->


		</main>
	</div>
</body>
</html>
