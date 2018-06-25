<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="list" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>簡易スケジュール帳</title>
</head>
<body>
<table border="1">
<tr>
	<th>日付</th><th>時刻</th><th>予定名</th><th>備考</th><th>編集</th>
</tr>
<% for(Object item : list) {
	to.msn.wings.lesson26_28.Schedule info = (to.msn.wings.lesson26_28.Schedule)item; %>
	<tr>
		<td><%=info.getScheduleDate() %></td>
		<td><%=info.getScheduleTime() %></td>
		<td><%=info.getTitle() %></td>
		<td><%=info.getMemo() %></td>
		<td>
			<a href="edit.jsp?id=<%=info.getId() %>">編集</a>
		</td>
	</tr>
<% } %>
</table>
</body>
</html>
