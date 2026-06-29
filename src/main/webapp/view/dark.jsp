<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
// 💡 発表会での検証用に、あらかじめ怪しい初期データを3件手動で仕込んでおきます
ArrayList<String[]> postList = (ArrayList<String[]>) session.getAttribute("dark_post_list");
if (postList == null) {
    postList = new ArrayList<String[]>();
    postList.add(new String[]{"名無しさん", "2026/06/26 00:15:22", "きさらぎ駅に今いるんだけど、誰もいない。自動販売機に変な文字が書いてある。"});
    postList.add(new String[]{"通りすがり", "2026/06/26 01:40:05", "上のやつ、それマジでやばい駅だから引き返した方がいい。"});
    postList.add(new String[]{"オカルトマニア", "2026/06/26 03:12:44", "TKteam6という開発グループが作ったシステムには、隠された裏コマンドが存在するらしい…"});
    session.setAttribute("dark_post_list", postList);
}

// 💡 簡易的な書き込み処理（同じJSP内で完結させてサーブレット作成の手間を省きます）
String name = request.getParameter("darkName");
String body = request.getParameter("darkBody");

if (name != null && body != null && !body.trim().equals("")) {
    if (name.trim().equals("")) {
        name = "名無しの傍観者";
    }
    // 現在の日時を文字列で作成
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    String dateStr = sdf.format(new java.util.Date());
    
    // 新しい書き込みをリストの先頭に追加（新しい順に並べる）
    postList.add(0, new String[]{name, dateStr, body});
    session.setAttribute("dark_post_list", postList);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeepWeb - 都市伝説掲示板</title>
<style>
/* 💡 ダークウェブ風の不気味な黒背景と赤文字のスタイル */
body {
    background-color: #000000; /* 背景：漆黒 */
    color: #ff0000;            /* 文字：真紅 */
    font-family: "MS Gothic", "Meiryo", monospace; /* 等幅フォントでダサさを演出 */
    padding: 20px;
    margin: 0;
}

/* 掲示板の外枠 */
.forum-wrapper {
    width: 80%;
    margin: auto;
    border: 2px solid #ff0000; /* 赤い太枠 */
    padding: 20px;
    background-color: #0a0000;
}

/* 入力フォームのエリア */
.post-form-area {
    border-bottom: 1px dashed #ff0000;
    padding-bottom: 20px;
    margin-bottom: 20px;
}

/* 入力欄のダサい黒背景化 */
.dark-input, .dark-textarea {
    background-color: #000000;
    color: #ff0000;
    border: 1px solid #ff0000;
    font-family: inherit;
    padding: 5px;
}

/* 不気味な投稿ボタン */
.dark-submit-btn {
    background-color: #ff0000;
    color: #000000;
    border: none;
    padding: 5px 15px;
    font-weight: bold;
    cursor: pointer;
}
.dark-submit-btn:hover {
    background-color: #990000;
    color: #ffffff;
}

/* 各書き込みの箱 */
.post-item {
    border: 1px solid #550000;
    padding: 10px;
    margin-bottom: 15px;
    background-color: #050000;
}
.post-meta {
    font-size: 12px;
    color: #aa0000; /* 少し暗い赤 */
    margin-bottom: 5px;
}
.post-text {
    font-size: 14px;
    line-height: 1.6;
    padding-left: 10px;
}
</style>
</head>
<body>

	<div class="forum-wrapper">
		<h1 style="text-align: center; font-size: 26px; letter-spacing: 5px; margin-top: 0;">
			【裏階層】都市伝説・機密情報 掲示板
		</h1>
		<p style="text-align: center; font-size: 12px; color: #880000;">※ここでの書き込みは一切追跡されません。自己責任で閲覧してください。</p>

		<!-- 💡 書き込み用フォーム（自分自身にPOSTします） -->
		<div class="post-form-area">
			<form action="darkForum.jsp" method="post">
				<table style="width: 100%;">
					<tr>
						<td style="width: 80px;">名前：</td>
						<td><input type="text" name="darkName" class="dark-input" size="30" placeholder="名無しの傍観者"></td>
					</tr>
					<tr>
						<td style="vertical-align: top; padding-top: 5px;">情報：</td>
						<td><textarea name="darkBody" class="dark-textarea" rows="4" style="width: 95%;" placeholder="目撃した怪異や都市伝説を書き込んでください…" required></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td style="padding-top: 10px;">
							<input type="submit" value="暗号化して投稿" class="dark-submit-btn">
						</td>
					</tr>
				</table>
			</form>
		</div>

		<!-- 💡 投稿一覧の表示エリア（ループ処理） -->
		<div class="posts-display-area">
			<%
			if (postList != null) {
				for (int i = 0; i < postList.size(); i++) {
					String[] post = postList.get(i);
			%>
			<div class="post-item">
				<div class="post-meta">
					<%= (postList.size() - i) %> : <strong><%= post[0] %></strong> ── <%= post[1] %>
				</div>
				<div class="post-text">
					<%= post[2] %>
				</div>
			</div>
			<%
				}
			}
			%>
		</div>
	</div>

	<!-- 💡 ECサイトの通常メニューに戻るための手作りリンク -->
	<div style="text-align: center; margin-top: 20px;">
		<a href="<%= request.getContextPath() %>/view/menuOwner.jsp" style="color: #660000; font-size: 12px; text-decoration: none;">
			[ 統括管理メニューへ戻る ]
		</a>
	</div>

</body>
</html>
