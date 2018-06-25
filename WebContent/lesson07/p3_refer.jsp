<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>リファラーの判定</title>
</head>
<body>
<%
String refer = request.getHeader("referer");
String host = request.getServerName();
if(refer == null || refer.indexOf(host) == -1) {
	out.println("あなたは他のサイトから訪れました");
} else {
	out.println("あなたはこのサイト内のページからリンクしてきました");
}
%>
</body>
</html>
