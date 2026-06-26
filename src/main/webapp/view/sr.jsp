<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 既存のオーナー用共通CSSを読み込みます -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/Owner.css" />
<title>企業理念・スローガン確認</title>
<style>
/* 手作り感を出すためのシンプルな枠線スタイル */
.slogan-container {
    width: 80%;
    margin: auto;
    font-family: "Meiryo", sans-serif;
    padding: 20px;
}
.slogan-section {
    margin-bottom: 30px;
    border: 2px solid #000000;
    background-color: #ffffff;
    padding: 20px;
}
.slogan-title {
    background-color: #00FFFF; /* チームのテーマカラー */
    color: #333333;
    padding: 8px 15px;
    margin-top: 0;
    font-size: 18px;
    border-bottom: 2px solid #000000;
}
.slogan-content {
    font-size: 15px;
    line-height: 1.8;
    color: #000000;
}
.highlight-text {
    font-size: 20px;
    font-weight: bold;
    color: #008080;
    text-align: center;
    margin: 15px 0;
    border-left: 5px solid #00FFFF;
    padding-left: 10px;
}
</style>
</head>
<body>
	<!-- 共通ヘッダーの読み込み -->
	<%@include file="/common/header_Owner.jsp"%>
	
	<div class="container">
		<!-- 共通サイドバーの読み込み -->
		
		<main style="width: 100%; padding: 20px;">
			<h1>企業情報・スローガン確認画面</h1>
			<hr style="border: 1px solid #000000; margin-bottom: 20px;">

			<div class="slogan-container">

				<!-- 💡 セクション1：経営理念 -->
				<div class="slogan-section">
					<h3 class="slogan-title">■ 経営方針・経営理念</h3>
					<div class="slogan-content">
						<p>お客様のあらゆるお困りごとを解決するための様々なソリューションを提供します。</p>
						<p>公平かつ正確に適時開示を行い、サステナブルな社会の実現に向けた取り組みを推進いたします。</p>
					</div>
				</div>

				<!-- 💡 セクション2：経営ビジョン（スローガン） -->
				<div class="slogan-section">
					<h3 class="slogan-title">■ 経営ビジョン・スローガン</h3>
					<div class="slogan-content">
						<div class="highlight-text">
							「Next Vision 50th」 ＆ 「DX戦略の推進」
						</div>
						<p style="text-align: center; font-size: 14px; color: #666;">
							〜 次なる50周年に向けた持続可能な成長と、デジタル変革による価値創造 〜
						</p>
					</div>
				</div>

				<!-- 💡 セクション3：企業行動憲章・基本方針 -->
				<div class="slogan-section">
					<h3 class="slogan-title">■ 企業行動憲章 および 基本方針</h3>
					<div class="slogan-content">
						<table border="1" style="width: 100%; border-collapse: collapse; margin-top: 10px;">
							<tr style="background-color: #f2f2f2;">
								<th style="width: 30%; padding: 8px;">項目</th>
								<th style="padding: 8px;">取り組み内容方針</th>
							</tr>
							<tr>
								<td style="padding: 8px; font-weight: bold; text-align: center;">マルチステークホルダー方針</td>
								<td style="padding: 8px;">株主、投資家、従業員、お客様すべてのステークホルダーとの健全な関係維持</td>
							</tr>
							<tr>
								<td style="padding: 8px; font-weight: bold; text-align: center;">DE&I 推進</td>
								<td style="padding: 8px;">ダイバーシティ、エクイティ＆インクルージョンの確保とハラスメント防止宣言の徹底</td>
							</tr>
							<tr>
								<td style="padding: 8px; font-weight: bold; text-align: center;">健康経営</td>
								<td style="padding: 8px;">従業員の人権方針に基づき、心身ともに健康で活躍できる人材育成と福利厚生の充実</td>
							</tr>
						</table>
					</div>
				</div>

			</div>
		</main>
	</div>

	<!-- 共通フッターの読み込み -->
	<%@include file="../common/footer.jsp"%>
</body>
</html>
