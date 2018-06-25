<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.regex.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>正規表現で文字列を検索</title>
</head>
<body>
<%
String msg = "メールアドレスは、CQW15204@nifty.com です。";
msg += "y-yamada@mcn.ne.jp もあります。";
Pattern pattern = Pattern.compile(
	"[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+", Pattern.CASE_INSENSITIVE);
Matcher match = pattern.matcher(msg);
while(match.find()) {
	out.println(match.group() + "<br />");
}
%>
</body>
</html>
