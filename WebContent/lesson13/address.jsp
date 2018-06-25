<%@ page contentType="text/html;charset=UTF-8"
         import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>住所録一覧</title>
</head>
<body>
<table border="1">
<tr>
	<th>No.</th><th>名前</th><th>性別</th><th>電話番号</th><th>住所</th>
</tr>
<%
FileReader reader = new FileReader(
	application.getRealPath("/WEB-INF/data/data.txt"));
BufferedReader buf = new BufferedReader(reader);
while(buf.ready()) {
	String line = buf.readLine();
	out.println("<tr>");
	StringTokenizer token = new StringTokenizer(line, "\t");
	while(token.hasMoreTokens()) {
		out.println("<td>" + token.nextToken() + "</td>");
	}
	out.println("</tr>");
}
buf.close();
%>
</table>
</body>
</html>
