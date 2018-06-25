<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*" %>
<%
Context context = new InitialContext();
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement("SELECT * FROM books ORDER BY published DESC");
ResultSet rs = ps.executeQuery();
DecimalFormat nformat = new DecimalFormat("#,###円");
SimpleDateFormat dformat = new SimpleDateFormat("yyyy年MM月dd日");
%>
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
<% while(rs.next()) { %>
	<tr>
		<td><a href="p_bookdesc.jsp?isbn=<%=rs.getString("isbn") %>">
			<%=rs.getString("isbn") %></a></td>
		<td><%=rs.getString("title") %></td>
		<td><%=nformat.format(rs.getInt("price")) %></td>
		<td><%=rs.getString("publish")%></td>
		<td><%=dformat.format(rs.getDate("published")) %></td>
	</tr>
<%
}
ps.close();
db.close();
%>
</table>
</body>
</html>
