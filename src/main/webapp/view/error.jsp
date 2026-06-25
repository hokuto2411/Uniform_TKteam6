<%--共通：エラー error.jsp --%>
<!DOCTYPE html>
<html>

<head> 
<%@page contentType="text/html; charset=UTF-8"%>
<title>エラー</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/User.css">
</head>

<%
String message = (String) request.getAttribute("error");
String cmd = (String) request.getAttribute("cmd");
%>

<body>
	<!-- ヘッダー -->
	<%@include file="/common/header_User.jsp"%>
	
	<!-- コンテンツ -->
	<div style = "margin-top:50px; padding-top:10%;text-align: center">
		<h1 style="border-bottom: 3px dotted #0000ff;">
			●●エラー●●</h1>
<br>
		<h2><%=message%></h2>
		<br>
		<p>
			<%
			if (cmd.equals("menu")){
				
			%>
				<a href="<%=request.getContextPath()%>/view/menu.jsp">メニューに戻る</a>
			<%
			}else if(cmd.equals("omenu")){
				
			%>
				<a href="<%=request.getContextPath()%>/view/menuOwner.jsp">管理者メニューに戻る</a>
			<%
			}else if(cmd.equals("login")){
				
			%>
				<a href="<%=request.getContextPath()%>/view/login.jsp">ログイン画面に戻る</a>
			<%
			}else if(cmd.equals("insert")){
				
			%>
				<a href="<%=request.getContextPath()%>/view/insertUser.jsp">登録画面に戻る</a>
			<%
			}else{
				
			%>
				<a href="<%=request.getContextPath()%>/view/login.jsp">ログアウト</a>
			<%
			}
			
			%>
		</p>
	</div>
</body>
</html>
