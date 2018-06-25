<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*, javax.naming.*, javax.sql.*" %>
<%!
private String createOption(int start, int end, int def) {
	StringBuilder builder = new StringBuilder();
	for(int i = start; i <= end; i++) {
		builder.append("<option value='" + i + "' ");
		if(i == def) { builder.append("selected"); }
		builder.append(">" + i + "</option>");
	}
	return builder.toString();
}
%>
<%
request.setCharacterEncoding("UTF-8");
Context context = new InitialContext();
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement("SELECT * FROM schedules WHERE id=?");
ps.setString(1, request.getParameter("id"));
ResultSet rs = ps.executeQuery();
if(rs.next()) {
	Calendar d = Calendar.getInstance();
	Calendar t = Calendar.getInstance();
	d.setTime(rs.getDate("schedule_date"));
	t.setTime(rs.getTime("schedule_time"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>簡易スケジュール帳</title>
</head>
<body>
<form method="POST" action="update.jsp">
<div>
	<label>予定名：<br />
		<input type="hidden" name="id" value="<%=rs.getString("id") %>" />
		<input type="text" name="title" size="50" maxlength="255"
			value="<%=rs.getString("title") %>" />
	</label>
</div>
<div>
	<label>日付：<br />
		<select name="date_year">
			<%=createOption(2015, 2020, d.get(Calendar.YEAR))%></select>年
		<select name="date_month">
			<%=createOption(1, 12, d.get(Calendar.MONTH) + 1)%></select>月
		<select name="date_day">
			<%=createOption(1, 31, d.get(Calendar.DATE))%></select>日
	</label>
</div>
<div>
	<label>開始時間：<br />
		<select name="time_hour">
			<%=createOption(0, 23, t.get(Calendar.HOUR_OF_DAY))%></select>時
		<select name="time_minute">
			<%=createOption(0, 59, t.get(Calendar.MINUTE))%></select>分
	</label>
</div>
<div>
	<label>備考：<br />
		<input type="text" name="memo" size="70" maxlength="255"
		value="<%=rs.getString("memo") %>" />
	</label>
</div>
<div>
		<input type="submit" name="update" value="更新" />
		<input type="submit" name="delete" value="削除"
			onclick="return confirm('本当に削除しても良いですか？')" />
</div>
</form>
</body>
</html>
<%
}
%>