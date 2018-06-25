<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>accept-language</title>
</head>
<body>
<%
String lang = request.getHeader("accept-language");
if(lang.indexOf("ja") != -1) {
	out.println("こんにちは、ご機嫌いかがですか？");
} else {
	out.println("Hello, How are you ?");
}
%>
</body>
</html>
