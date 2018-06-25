<%@ page contentType="text/html; charset=UTF-8" %>
<%
Integer count = (Integer)session.getAttribute("cnt");
if(count == null) {
	session.setAttribute("cnt", 1);
	count = 1;
} else {
	count++;
	session.setAttribute("cnt", count);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>セッションで簡易アクセスカウンター</title>
</head>
<body>
あなたはこのサイトに<%=count %>回、アクセスしました。
</body>
</html>
