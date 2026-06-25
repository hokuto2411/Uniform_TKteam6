
<%--共通：エラー error.jsp --%>
<!DOCTYPE html>
<html>

<head>
<%@page contentType="text/html; charset=UTF-8"%>
<title>エラー</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Yomogi&display=swap');
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body {
    background: #0a0000;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Yomogi', serif;
    overflow: hidden;
    position: relative;
  }
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background: radial-gradient(ellipse 80% 60% at 50% 30%, #2a0000 0%, #0a0000 70%);
    z-index: 0;
  }
  .bg-blood {
    position: fixed;
    inset: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    pointer-events: none;
  }
  .container {
    position: relative;
    z-index: 10;
    text-align: center;
    padding: 60px 40px;
  }
  .error-title {
    font-size: clamp(2.5rem, 6vw, 4rem);
    color: #ff0000;
    position: relative;
    display: inline-block;
    line-height: 1.3;
    text-shadow:
      0 0 10px #ff0000,
      0 0 30px #ff0000,
      0 0 60px rgba(255,0,0,0.8),
      3px 6px 0px #7a0000;
    animation: flicker 4s infinite;
    letter-spacing: 0.08em;
  }
  .drip-container {
    position: relative;
    display: inline-block;
  }
  .drip-svg {
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    pointer-events: none;
  }
  .error-msg {
    font-size: clamp(1.3rem, 3vw, 1.8rem);
    color: #ff2222;
    margin-top: 60px;
    text-shadow:
      0 0 10px #ff0000,
      0 0 25px rgba(255,0,0,0.7),
      1px 2px 0 #7a0000;
    animation: shake 0.3s infinite alternate;
    letter-spacing: 0.05em;
  }
  .back-link {
    display: inline-block;
    margin-top: 40px;
    color: #ff2222;
    font-size: 1.1rem;
    text-decoration: none;
    border-bottom: 2px solid #ff0000;
    padding-bottom: 4px;
    transition: all 0.3s;
    text-shadow: 0 0 10px #ff0000, 0 0 20px rgba(255,0,0,0.5);
    letter-spacing: 0.05em;
  }
  .back-link:hover {
    color: #ff6666;
    text-shadow: 0 0 20px #ff0000, 0 0 40px #ff0000;
  }
  @keyframes flicker {
    0%,89%,91%,93%,100% { opacity: 1; }
    90% { opacity: 0.4; }
    92% { opacity: 0.9; }
  }
  @keyframes shake {
    0%   { transform: translate(-1px, 0) rotate(-0.3deg); }
    100% { transform: translate(1px, 0) rotate(0.3deg); }
  }
</style>
</head>

<%
String message = (String) request.getAttribute("error");
String cmd = (String) request.getAttribute("cmd");
%>

<body>

<svg class="bg-blood" viewBox="0 0 1000 700" preserveAspectRatio="xMidYMid slice" xmlns="http://www.w3.org/2000/svg">
  <ellipse cx="80" cy="60" rx="45" ry="18" fill="#cc0000" opacity="0.9"/>
  <ellipse cx="920" cy="120" rx="30" ry="12" fill="#dd0000" opacity="0.8"/>
  <ellipse cx="150" cy="650" rx="60" ry="20" fill="#bb0000" opacity="0.9"/>
  <ellipse cx="880" cy="600" rx="40" ry="15" fill="#cc0000" opacity="0.9"/>
  <circle cx="200" cy="80" r="5" fill="#ff2222" opacity="0.9"/>
  <circle cx="220" cy="65" r="3" fill="#ff0000" opacity="0.9"/>
  <circle cx="190" cy="95" r="7" fill="#ee0000" opacity="0.9"/>
  <circle cx="750" cy="100" r="6" fill="#ff2222" opacity="0.9"/>
  <circle cx="780" cy="80" r="4" fill="#ff0000" opacity="0.9"/>
  <circle cx="50" cy="300" r="8" fill="#dd0000" opacity="0.8"/>
  <circle cx="930" cy="400" r="6" fill="#ff2222" opacity="0.9"/>
  <circle cx="100" cy="500" r="5" fill="#ff0000" opacity="0.8"/>
  <circle cx="870" cy="200" r="9" fill="#ee0000" opacity="0.8"/>
  <circle cx="300" cy="620" r="7" fill="#ff2222" opacity="0.9"/>
  <circle cx="650" cy="650" r="5" fill="#ff0000" opacity="0.9"/>
  <circle cx="400" cy="30" r="4" fill="#ff2222" opacity="0.7"/>
  <circle cx="600" cy="50" r="6" fill="#ff0000" opacity="0.7"/>
  <circle cx="700" cy="660" r="8" fill="#ee0000" opacity="0.8"/>
  <circle cx="450" cy="670" r="5" fill="#ff2222" opacity="0.7"/>
  <path d="M80 0 Q85 40 78 80 Q82 120 75 160 Q80 200 72 250" stroke="#ff0000" stroke-width="5" fill="none" opacity="0.9"/>
  <circle cx="72" cy="262" r="10" fill="#dd0000" opacity="0.9"/>
  <path d="M920 0 Q915 50 922 100 Q918 150 925 200" stroke="#ff0000" stroke-width="7" fill="none" opacity="0.9"/>
  <circle cx="925" cy="214" r="12" fill="#cc0000" opacity="0.9"/>
  <path d="M500 0 Q496 40 503 80 Q498 120 505 160" stroke="#ee0000" stroke-width="4" fill="none" opacity="0.7"/>
  <circle cx="505" cy="172" r="8" fill="#dd0000" opacity="0.8"/>
  <path d="M200 700 Q195 660 202 620 Q198 580 205 540" stroke="#ff0000" stroke-width="6" fill="none" opacity="0.9"/>
  <circle cx="198" cy="528" r="11" fill="#cc0000" opacity="0.9"/>
  <path d="M700 700 Q695 650 702 600 Q698 560 705 520 Q700 480 708 440" stroke="#ee0000" stroke-width="5" fill="none" opacity="0.8"/>
  <circle cx="708" cy="428" r="9" fill="#dd0000" opacity="0.9"/>
  <ellipse cx="30" cy="450" rx="18" ry="25" fill="#cc0000" opacity="0.5"/>
  <rect x="20" y="425" width="5" height="20" rx="2" fill="#cc0000" opacity="0.45"/>
  <rect x="27" y="422" width="5" height="22" rx="2" fill="#cc0000" opacity="0.45"/>
  <rect x="34" y="424" width="5" height="20" rx="2" fill="#cc0000" opacity="0.45"/>
  <rect x="41" y="427" width="5" height="17" rx="2" fill="#cc0000" opacity="0.45"/>
  <ellipse cx="960" cy="250" rx="18" ry="25" fill="#cc0000" opacity="0.5"/>
  <rect x="950" y="225" width="5" height="20" rx="2" fill="#cc0000" opacity="0.45"/>
  <rect x="957" y="222" width="5" height="22" rx="2" fill="#cc0000" opacity="0.45"/>
  <rect x="964" y="224" width="5" height="20" rx="2" fill="#cc0000" opacity="0.45"/>
  <rect x="971" y="227" width="5" height="17" rx="2" fill="#cc0000" opacity="0.45"/>
</svg>

<div class="container">
  <div class="drip-container">
    <h1 class="error-title">●●エラー●●</h1>
    <svg class="drip-svg" viewBox="0 0 520 65" height="65" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
      <rect x="0" y="0" width="520" height="6" fill="#ff0000" opacity="1"/>
      <path d="M30 6 L27 36 Q30 50 33 36 L30 6Z" fill="#ff0000"/>
      <circle cx="30" cy="53" r="9" fill="#ee0000"/>
      <path d="M80 6 L78 22 Q80 33 82 22 L80 6Z" fill="#ff0000"/>
      <circle cx="80" cy="37" r="6" fill="#ee0000"/>
      <path d="M140 6 L136 42 Q140 60 144 42 L140 6Z" fill="#ff2222"/>
      <circle cx="140" cy="62" r="10" fill="#ff0000"/>
      <path d="M200 6 L198 28 Q200 40 202 28 L200 6Z" fill="#ff0000"/>
      <circle cx="200" cy="44" r="7" fill="#ee0000"/>
      <path d="M260 6 L256 46 Q260 62 264 46 L260 6Z" fill="#ff2222"/>
      <circle cx="260" cy="63" r="9" fill="#ff0000"/>
      <path d="M320 6 L318 20 Q320 30 322 20 L320 6Z" fill="#ff0000"/>
      <circle cx="320" cy="34" r="6" fill="#ee0000"/>
      <path d="M380 6 L377 38 Q380 54 383 38 L380 6Z" fill="#ff0000"/>
      <circle cx="380" cy="57" r="9" fill="#ee0000"/>
      <path d="M430 6 L428 25 Q430 37 432 25 L430 6Z" fill="#ff2222"/>
      <circle cx="430" cy="41" r="7" fill="#ff0000"/>
      <path d="M490 6 L487 44 Q490 60 493 44 L490 6Z" fill="#ff2222"/>
      <circle cx="490" cy="62" r="10" fill="#ff0000"/>
    </svg>
  </div>

  <div style="margin-top: 75px;">
    <h2 class="error-msg"><%=message%></h2>
  </div>

  <p style="margin-top: 40px;">
    <%
    if (cmd.equals("menu")){
    %>
      <a class="back-link" href="<%=request.getContextPath()%>/view/menu.jsp">メニューに戻る</a>
    <%
    }else if(cmd.equals("omenu")){
    %>
      <a class="back-link" href="<%=request.getContextPath()%>/view/menuOwner.jsp">管理者メニューに戻る</a>
    <%
    }else if(cmd.equals("login")){
    %>
      <a class="back-link" href="<%=request.getContextPath()%>/view/login.jsp">ログイン画面に戻る</a>
    <%
    }else if(cmd.equals("insert")){
    %>
      <a class="back-link" href="<%=request.getContextPath()%>/view/insertUser.jsp">登録画面に戻る</a>
    <%
    }else{
    %>
      <a class="back-link" href="<%=request.getContextPath()%>/view/login.jsp">ログアウト</a>
    <%
    }
    %>
  </p>
</div>

</body>
</html>
