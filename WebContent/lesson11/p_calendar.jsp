<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.*" %>
<%
Calendar today = Calendar.getInstance();
int today_y = today.get(Calendar.YEAR);
int today_m = today.get(Calendar.MONTH);

today.set(Calendar.DATE, 1);
int first = today.get(Calendar.DAY_OF_WEEK) - 1;
today.set(today_y, today_m + 1, 0);
int last = today.get(Calendar.DATE);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>今月のカレンダー</title>
</head>
<body>
<table border="1">
<tr>
	<th>日</th><th>月</th><th>火</th><th>水</th>
	<th>木</th><th>金</th><th>土</th>
</tr>
<%
for(int i = 1; i <= first + last; i++) {
	if(i % 7 == 1) {out.print("<tr>");}
	if(i > first) {
		out.print("<td>" + (i - first) + "</td>");
	} else {
		out.print("<td>&nbsp;</td>");
	}
	if(i % 7 == 0) {out.println("</tr>");}
}
%>
</table>
</body>
</html>
