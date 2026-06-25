<!--ユーザー：商品一覧 listlUni-->
<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.Uniform"%>
<%@page import="java.util.ArrayList,bean.User"%>
<%@page import="util.MyFormat"%>
<%
MyFormat fmt = new MyFormat();
%>
<title>商品一覧</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/css/User.css">
</head>

<body>

<!-- ==================== 画面中央ポップアップ広告 ==================== -->
<style>
/* 💡 画面全体を暗くするスモーク背景 */
.ad-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.65); /* 暗さの度合い */
    z-index: 99999; /* 他のどの要素よりも一番手前に表示 */
    display: flex;
    justify-content: center;
    align-items: center;
}

/* 💡 中央の広告白い箱 */
.ad-box {
    position: relative;
    width: 420px;
    background-color: #ffffff;
    padding: 30px;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    font-family: "Consolas", "Courier New", "Meiryo", sans-serif; /* 文字崩れ防止 */
    border: 3px solid #00FFFF;
}

/* 💡 右上の「×」閉じるボタン */
.ad-close-btn {
    position: absolute;
    top: 10px;
    right: 15px;
    background: none;
    border: none;
    font-size: 28px;
    font-weight: bold;
    color: #999;
    cursor: pointer;
}
.ad-close-btn:hover {
    color: #333;
}

/* 💡 下部の「買い物を続ける」ボタン */
.ad-submit-btn {
    background-color: #00FFFF;
    color: #333;
    border: none;
    padding: 12px 35px;
    font-size: 15px;
    font-weight: bold;
    border-radius: 6px;
    cursor: pointer;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    transition: 0.2s;
}
.ad-submit-btn:hover {
    background-color: #00cccc;
    transform: translateY(-2px);
}
</style>

<!-- 広告の本体（HTML） -->
<div id="popupAd" class="ad-overlay">
    <div class="ad-box">
        <!-- 右上のバツボタン -->
        <button class="ad-close-btn" onclick="destroyAd()">&times;</button>
        
        <!-- 広告のタイトル -->
        <span style="font-size: 12px; color: #008080; font-weight: bold; letter-spacing: 2px;">SPECIAL CAMPAIGN</span>
        <h3 style="margin: 10px 0 20px 0; color: #333; font-size: 22px;">本日限定クーポン配布中！</h3>
        
        <!-- 広告の中身 -->
        <div style="background-color: #f7f9fa; padding: 20px; border-radius: 8px; border: 1px dashed #00FFFF; margin-bottom: 25px;">
            <p style="margin: 0 0 10px 0; font-size: 14px; line-height: 1.6;">
                購入確認画面の「ご要望・コメント欄」に<br>
                下記のコードを入力すると…
            </p>
            <p style="font-size: 24px; font-weight: bold; color: #ff3366; letter-spacing: 3px; margin: 5px 0;">
                T6TEAM6
            </p>
            <p style="margin: 10px 0 0 0; font-size: 15px; font-weight: bold; color: #333;">
                ＼ 合計金額から <span style="font-size: 20px; color: red;">500円OFF</span>！ ／
            </p>
        </div>
        
        <!-- 下部のボタン -->
        <button class="ad-submit-btn" onclick="destroyAd()">買い物を続ける</button>
    </div>
</div>

<!-- 広告を消す仕組み（JavaScript） -->
<script>
function destroyAd() {
    // 広告全体の枠（overlay）を取得して画面から完全に消し去る
    var adElement = document.getElementById('popupAd');
    if (adElement) {
        adElement.style.display = 'none';
    }
}
</script>
<!-- ================================================================== -->


	<!-- ヘッダー -->
  	<%@include file="/common/header_User.jsp"%>
  	
  	<!-- コンテナ -->
  	<div class="container">
  	
  	<!-- サイドバー -->
	<%@include file="/common/sidebar_User.jsp"%>	
	
	<!-- メイン -->
	<main>
		<div style="position: sticky; 
			top: 150px; 
			width: 150px; 
			padding-right: 30px; 
			float: right; 
			text-align: right; 
			padding-left: 10px; 
			border: 1px solid #333333; 
			border-radius: 10px;">
			<p>
				ユーザー名<% %><br>
				<%--ユーザー名 --%>
				<%User user=(User)session.getAttribute("user"); %>
				<%if(user==null){ %>
				<%--ログインしていない場合 --%>
				<form action="<%=request.getContextPath()%>/view/login.jsp" method="post">
					<input type="submit" value="ログイン">
				</form>
				<%--ログインしている場合 --%>
				<%}else{ %>
				<%=user.getUsername()%><br>
				<form action="<%=request.getContextPath()%>/logout" method="post">
					<input type="submit" value="ログアウト">
				</form>
				<%} %>
				<%--ログアウト --%>
				<br>
		</div>

		<h1>商品一覧画面</h1>
		
		<div style="display:flex; gap:15px;flex-wrap: wrap;justify-content: gap;">

			<%
			//ユニフォーム情報の取得
			ArrayList<Uniform> list = (ArrayList<Uniform>) request.getAttribute("uniList");
			
			//ユニフォーム情報を獲得した分格納
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					Uniform uni = (Uniform) list.get(i);
			%>
			
			<div style="padding: 15px;
 						flex: 100 100 200px;">
				<!-- 商品名 -->
				<p><a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>">
						<%=uni.getUniname()%></a>
				<!-- 商品画像 -->
				<p><img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
					 alt="<%=uni.getUniname() %>"
					 style="height:150px;border:1px brack;">
				<p><%=fmt.moneyFormat(uni.getPrice()) %>
				</div>
			
			<%
			}

			}
			%>
	</div>

	</main>
</div>
</body>
</html>
