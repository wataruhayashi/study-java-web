<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>九九表</title>
</head>
<body>
<table border="1">
<tr>
	<th></th><th>1</th><th>2</th><th>3</th><th>4</th>
	<th>5</th><th>6</th><th>7</th><th>8</th><th>9</th>
</tr>
<%
int i = 1;
while(i < 10) {
	out.println("<tr>");
	out.println("<th>" + i + "</th>");
	int j = 1;
	while(j < 10) {
		if(i * j > 40) { break; }
		out.println("<td align='right' width='20'>" + (i * j) + "</td>");
		j++;
	}
	out.println("</tr>");
	i++;
}
%>
</table>
</body>
</html>
