<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.regex.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>URL文字列をリンクに変更</title>
</head>
<body>
<%
String msg = "「サーバサイド技術の学び舎 - WINGS（http://www.wings.msn.to/）」もよろしく！";
Pattern pattern = Pattern.compile("http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?" ,Pattern.CASE_INSENSITIVE);
Matcher match = pattern.matcher(msg);
out.println(match.replaceAll("<a href='$0'>$0</a>"));
%>
</body>
</html>
