<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>クエリ情報を取得</title>
</head>
<body>
<table border="1">
<%
Enumeration params = request.getParameterNames();
while(params.hasMoreElements()) {
	String name = (String)(params.nextElement());
	out.println("<tr><th>" + name + "</th>");
	out.println("<td>" + request.getParameter(name) + "</td></tr>");
}
%>
</table>
</body>
</html>
