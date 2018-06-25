<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>user-agent</title>
</head>
<body>
<%
String agent=request.getHeader("user-agent");
if(agent.indexOf("Chrome") != -1) {
	out.println("あなたはGoogle Chromeを使っています");
} else {
	out.println("あなたはGoogle Chrome以外のブラウザを使っています");
}
%>
</body>
</html>