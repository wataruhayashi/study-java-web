<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ヘッダー情報の取得</title>
</head>
<body>
<table border="1">
<%
Enumeration<String> headers = request.getHeaderNames();
while(headers.hasMoreElements()) {
  String name = headers.nextElement();
%>
  <tr>
  <th><%=name %></th>
  <td><%=request.getHeader(name) %></td>
  </tr>
<% } %>
</table>
</body>
</html>
