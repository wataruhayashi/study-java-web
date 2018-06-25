<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*" %>
<%
Context context = new InitialContext();
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement("SELECT * FROM books WHERE isbn=?");
ps.setString(1, request.getParameter("isbn"));
ResultSet rs = ps.executeQuery();
DecimalFormat nformat = new DecimalFormat("#,###円");
SimpleDateFormat dformat = new SimpleDateFormat("yyyy年MM月dd日");
if(rs.next()){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>書籍情報詳細</title>
</head>
<body>
<table border="1">
<tr>
<th style="text-align:right;">ISBNコード</th>
<td><%=rs.getString("isbn") %></td>
</tr>
<tr>
<th style="text-align:right;">書名</th>
<td><%=rs.getString("title") %></td>
</tr>
<tr>
<th style="text-align:right;">価格</th>
<td><%=nformat.format(rs.getInt("price")) %></td>
</tr>
<tr>
<th style="text-align:right;">出版社</th>
<td><%=rs.getString("publish") %></td>
</tr>
<tr>
<th style="text-align:right;">刊行日</th>
<td><%=dformat.format(rs.getDate("published")) %></td>
</tr>
</table>
</body>
</html>
<%
}
ps.close();
db.close();
%>
