<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*" %>
<%
Context context = new InitialContext();
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement("SELECT * FROM schedules ORDER BY schedule_date, schedule_time");
ResultSet rs = ps.executeQuery();
SimpleDateFormat dformat = new SimpleDateFormat("yyyy年MM月dd日");
SimpleDateFormat tformat = new SimpleDateFormat("HH時mm分");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>簡易スケジュール帳</title>
</head>
<body>
<table border="1">
<tr>
	<th>日付</th><th>時刻</th><th>予定名</th><th>備考</th><th>削除</th>
</tr>
<% while(rs.next()) { %>
	<tr>
		<td><%=dformat.format(rs.getDate("schedule_date")) %></td>
		<td><%=tformat.format(rs.getTime("schedule_time")) %></td>
		<td><%=rs.getString("title") %></td>
		<td><%=rs.getString("memo") %></td>
		<td>
			<a href="edit.jsp?id=<%=rs.getString("id") %>">編集</a>
		</td>
	</tr>
<%
}
rs.close();
ps.close();
db.close();
%>
</table>
</body>
</html>
