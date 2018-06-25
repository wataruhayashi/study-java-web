<%@ page contentType="text/html; charset=UTF-8"
         import="java.text.*" %>
<jsp:useBean id="list" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>書籍情報一覧</title>
</head>
<body>
<table border="1">
<tr>
	<th>ISBNコード</th><th>書名</th><th>価格</th>
	<th>出版社</th><th>刊行日</th>
</tr>
<%
DecimalFormat nformat = new DecimalFormat("#,###円");
SimpleDateFormat dformat = new SimpleDateFormat("yyyy年MM月dd日");
for(Object item : list) {
	to.msn.wings.lesson26_28.Book info = (to.msn.wings.lesson26_28.Book)item; %>
	<tr>
		<td><a href="P_MvcServlet2?isbn=<%=info.getIsbn() %>">
			<%=info.getIsbn() %></a></td>
		<td><%=info.getTitle() %></td>
		<td><%=nformat.format(info.getPrice()) %></td>
		<td><%=info.getPublish()%></td>
		<td><%=dformat.format(info.getPublished()) %></td>
	</tr>
<% } %>
</table>
</body>
</html>
