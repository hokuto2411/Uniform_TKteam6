<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>手作りカーソルアクション迷路</title>
<style>
/* 全体のレイアウト */
.maze-wrapper {
    width: 600px;
    margin: 30px auto;
    text-align: center;
    font-family: "Meiryo", sans-serif;
}

/* 💡 迷路の土台（黒い壁：ここにマウスが触れたらアウト） */
.maze-board {
    position: relative;
    width: 500px;
    height: 400px;
    background-color: #333333; /* 壁の色 */
    margin: 20px auto;
    border: 4px solid #000000;
}

/* 💡 安全な白い通路の共通スタイル */
.path {
    position: absolute;
    background-color: #ffffff; /* 通路の色：白 */
}

/* 迷路のルート設計（位置とサイズ） */
.path-1 { top: 30px;  left: 30px;  width: 80px;  height: 80px;  } /* スタート部屋 */
.path-2 { top: 50px;  left: 110px; width: 150px; height: 40px;  } /* 右へ */
.path-3 { top: 50px;  left: 220px; width: 40px;  height: 200px; } /* 下へ */
.path-4 { top: 210px; left: 100px; width: 160px; height: 40px;  } /* 左へ */
.path-5 { top: 210px; left: 100px; width: 40px;  height: 150px; } /* 下へ */
.path-6 { top: 320px; left: 140px; width: 200px; height: 40px;  } /* 右へ */
.path-7 { top: 290px; left: 340px; width: 100px; height: 80px;  } /* ゴール部屋 */

/* スタートとゴールの文字装飾 */
.start-text {
    color: #0000ff;
    font-weight: bold;
    line-height: 80px;
    font-size: 14px;
}
.goal-link {
    display: block;
    color: #ff00ff;
    font-weight: bold;
    text-decoration: none;
    line-height: 80px;
    font-size: 16px;
    background-color: #ffffcc;
}
.goal-link:hover {
    background-color: #ffcc00;
}
</style>
</head>
<body>

	<div class="maze-wrapper">
		<h2>★ イライラカーソル迷路ゲーム ★</h2>
		<p style="font-size: 13px; color: #666;">
			【ルール】黒い壁（グレーの部分）を通らずに、白い道だけを進んで<br>
			一番奥の「GOAL」ボタンをポチッとクリックしてください！
		</p>

		<!-- 💡 修正ポイント①：黒い壁（土台）にマウスが乗ったら、JavaScriptの「hitWall()」を呼び出す -->
		<div class="maze-board" onmouseover="hitWall()">
		
			<!-- 💡 修正ポイント②：白い道（path）に乗った時は、event.stopPropagation() で「壁に当たった判定」を完全にブロックする！ -->
			<div class="path path-1" onmouseover="event.stopPropagation()"><span class="start-text">START</span></div>
			<div class="path path-2" onmouseover="event.stopPropagation()"></div>
			<div class="path path-3" onmouseover="event.stopPropagation()"></div>
			<div class="path path-4" onmouseover="event.stopPropagation()"></div>
			<div class="path path-5" onmouseover="event.stopPropagation()"></div>
			<div class="path path-6" onmouseover="event.stopPropagation()"></div>
			<div class="path path-7" onmouseover="event.stopPropagation()">
				<a href="<%= request.getContextPath() %>/view/menuOwner.jsp" class="goal-link">GOAL!!</a>
			</div>
			
		</div>
		
		<!-- 💡 警告メッセージの表示エリア -->
		<h3 id="statusText" style="color: green; margin-top: 15px;">ゲーム中...（白い道を進んでください）</h3>
	</div>

	<!-- 💡 判定をコントロールする手作りJavaScript -->
	<script>
	// 壁にぶつかった時の処理
	function hitWall() {
		// ステータス文字を赤くして「アウト」にする
		var status = document.getElementById('statusText');
		status.innerText = "アウト！！壁に触れました。最初からやり直し！";
		status.style.color = "red";
	}

	// スタート位置（path-1）にマウスが戻ったらステータスをリセットする親切設計
	document.querySelector('.path-1').addEventListener('mouseenter', function() {
		var status = document.getElementById('statusText');
		status.innerText = "ゲーム中...（白い道を進んでください）";
		status.style.color = "green";
	});
	</script>
</body>
</html>
