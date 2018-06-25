<%@ page contentType="text/html;charset=UTF-8" %>
<%!
String[] names = { "松岡", "薄井", "本多", "川村", "日尾" };
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>みんなにこんにちは！</title>
</head>
<body>
<%
int i;
int count = names.length;
for(i = 0; i < count; i++) {
  out.println("<p>こんにちは、" + names[i] + "さん！ </p>");
}
%>
</body>
</html>