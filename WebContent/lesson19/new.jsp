<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%!
private String createOption(int start, int end) {
	StringBuilder builder = new StringBuilder();
	for(int i = start; i <= end; i++) {
		builder.append("<option value='" + i + "'>" + i + "</option>");
	}
	return builder.toString();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>簡易スケジュール帳</title>
</head>
<body>
<form method="POST" action="insert.jsp">
<div>
	<label>予定名：<br />
		<input type="text" name="title" size="50" maxlength="255" />
	</label>
</div>
<div>
	<label>日付：<br />
		<select name="date_year"><%=createOption(2015, 2020)%></select>年
		<select name="date_month"><%=createOption(1, 12)%></select>月
		<select name="date_day"><%=createOption(1, 31)%></select>日
	</label>
</div>
<div>
	<label>開始時間：<br />
		<select name="time_hour"><%=createOption(0, 23)%></select>時
		<select name="time_minute"><%=createOption(0, 59)%></select>分
	</label>
</div>
<div>
	<label>備考：<br />
		<input type="text" name="memo" size="70" maxlength="255" />
	</label>
</div>
<div>
	<input type="submit" value="登録" />
</div>
</form>
</body>
</html>
