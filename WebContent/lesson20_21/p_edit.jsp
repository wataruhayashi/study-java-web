<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*" %>
<%
int count = 1;
String[] pubs = {"翔泳社", "秀和システム", "日経BP", "技術評論社"};
Context context = new InitialContext();
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement("SELECT * FROM books ORDER BY published DESC");
ResultSet rs = ps.executeQuery();
SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>書籍情報更新／削除</title>
</head>
<body>
<form method="POST" action="p_update.jsp">
<input type="submit" value="更新／削除" />
<table border="1">
<tr>
	<th>削除</th><th>ISBNコード</th><th>書名</th>
	<th>価格</th><th>出版社</th><th>刊行日</th>
</tr>
<% while(rs.next()){ %>
	<tr>
		<td><input type="checkbox" name="delete<%=count %>" value="1" /></td>
		<td><%=rs.getString("isbn") %>
			<input type="hidden" name="isbn<%=count %>"
				value="<%=rs.getString("isbn")%>" /></td>
		<td>
			<input type="text" name="title<%=count %>" size="25"
				value="<%=rs.getString("title")%>" /></td>
		<td>
			<input type="text" name="price<%=count %>" size="5"
				value="<%=rs.getString("price")%>" />円</td>
		<td>
			<select name="publish<%=count %>">
				<% for(String pub : pubs){ %>
					<option value="<%=pub %>"
						<%
						if(pub.equals(rs.getString("publish"))){
							out.print("selected");
						} %>><%=pub %></option>
				<% } %>
			</select></td>
		<td>
			<input type="text" name="published<%=count %>" size="12"
				value="<%=dformat.format(rs.getDate("published")) %>" /></td>
	</tr>
<%
	count++;
}
rs.close();
ps.close();
db.close();
%>
</table>
<input type="hidden" name="count" value="<%=count %>" />
</form>
</body>
</html>
