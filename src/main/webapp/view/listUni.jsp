<!--ユーザー：商品一覧 listlUni-->
<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.Uniform"%>
<%@page import="java.util.ArrayList,bean.User"%>
<%@page import="util.MyFormat"%>
<title>商品一覧</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/css/User.css">
</head>

<%
MyFormat fmt = new MyFormat();
%>

<body>
<style>
/* 画面全体を暗くするグレーの背景 */
.my-ad-bg {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 普通の半透明 */
    z-index: 9999;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* 中央の普通の白い四角枠 */
.my-ad-container {
    position: relative;
    width: 380px;
    background-color: #ffffff;
    padding: 20px;
    border: 3px solid #000000; /* あえて普通の黒い太線 */
    text-align: center;
}

/* 右上のバツ文字ボタン */
.my-ad-close {
    position: absolute;
    top: 5px;
    right: 10px;
    background: none;
    border: none;
    font-size: 24px;
    cursor: pointer;
}

/* 普通のボタン */
.my-ad-btn {
    padding: 8px 20px;
    font-size: 14px;
    cursor: pointer;
    background-color: #f0f0f0;
    border: 1px solid #777;
}
</style>

<!-- 広告のHTML部分 -->
<div id="popupAd" class="my-ad-bg">
    <div class="my-ad-container">
        <!-- 閉じるバツボタン -->
        <button class="my-ad-close" onclick="closeAd()">×</button>
        
        <p style="font-size: 14px; color: #ff0000; font-weight: bold; margin: 0;">★お得なキャンペーン情報★</p>
        <h3 style="margin: 10px 0;">限定クーポンをプレゼント！</h3>
        
        <!-- クーポンの中身 -->
        <div style="border: 2px dashed #000000; padding: 15px; margin-bottom: 15px; background-color: #ffffcc;">
            <p style="margin: 0; font-size: 13px;">
                購入確認のとき、コメント欄に<br>
                「T6TEAM6」と入力してください。
            </p>
            <p style="font-size: 20px; font-weight: bold; margin: 10px 0; color: #0000ff;">
                代金から 500円引き！
            </p>
            <p style="font-size: 8px; font-weight: bold; margin: 20px 0 0 200px; ">
            	
            </p>
        </div>
        
        <button class="my-ad-btn" onclick="closeAd()">閉じて買い物を続ける</button>
    </div>
</div>

<!-- 広告を消すJavaScript（そのまま） -->
<script>
function closeAd() {
    document.getElementById('popupAd').style.display = 'none';
}
</script>
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
			<p style="text-align:left; padding-left:10px">ようこそ♪<br>
				<%--ユーザー名 --%>
				<%User user=(User)session.getAttribute("user"); %>
				<%if(user==null){ %>
				<%--ログインしていない場合 --%>
				<p style="text-align:center">ゲスト　様
				<form action="<%=request.getContextPath()%>/view/login.jsp" method="post">
					<input type="submit" value="ログイン" class="color-change">
				</form>
				<%--ログインしている場合 --%>
				<%}else{ %>
				<p><%=user.getUsername()%>　様<br>
				<form action="<%=request.getContextPath()%>/logout" method="post">
					<input type="submit" value="ログアウト"class="color-change">
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
			
			<div class="color-change3">
				<!-- 商品名 -->
				<p><a href="<%=request.getContextPath()%>/detailUni?unino=<%=uni.getUnino()%>">
						▶<%=uni.getUniname()%></a>
				<!-- 商品画像 -->
				<p><img src="<%=request.getContextPath() %>/file/<%= uni.getImage() %>"
					 alt="<%=uni.getUniname() %>"
					 style="height:150px;border:1px brack;">
				<!-- 価格 -->
				<p><%=fmt.moneyFormat(uni.getPrice()) %>
				<!-- 在庫（追加） -->
				<p>在庫（残り<%=uni.getStock()%>個）
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
