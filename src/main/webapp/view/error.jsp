
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
   
  }
  .back-link {
    display: inline-block;
    margin-top: 40px;
    color: #ff2222;
    font-size: 1.1rem;
    text-decoration: none;
    border-bottom: 2px solid #ff0000;
    padding-bottom: 4px;
  }
  .back-link:hover {
    color: #ff6666;
    text-shadow: 0 0 20px #ff0000, 0 0 40px #ff0000;
  }

</style>
</head>

<%
String message = (String) request.getAttribute("error");
String cmd = (String) request.getAttribute("cmd");
%>

<body>
<div class="container">
  <div class="drip-container">
    <h1 class="error-title">●●エラー●●</h1>
    
  </div>

  <div style="margin-top: 75px;">
    <h2 class="error-msg"><%=message%></h2>
  </div>

  <p style="margin-top: 40px;">
    <%
    if (cmd.equals("menu")){
    %>
      <a class="back-link" href="<%=request.getContextPath()%>/view/menu.jsp">▶メニューに戻る</a>
    <%
    }else if(cmd.equals("omenu")){
    %>
      <a class="back-link" href="<%=request.getContextPath()%>/view/menuOwner.jsp">▶管理者メニューに戻る</a>
    <%
    }else if(cmd.equals("login")){
    %>
      <a class="back-link" href="<%=request.getContextPath()%>/view/login.jsp">▶ログイン画面に戻る</a>
    <%
    }else if(cmd.equals("insert")){
    %>
      <a class="back-link" href="<%=request.getContextPath()%>/view/insertUser.jsp">▶登録画面に戻る</a>
    <%
    }else{
    %>
      <a class="back-link" href="<%=request.getContextPath()%>/view/login.jsp">▶ログアウト</a>
    <%
    }
    %>
  </p>
</div>

</body>
</html>

