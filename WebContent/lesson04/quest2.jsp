<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>アンケート結果</title>
</head>
<body>
<%
String answer = request.getParameter("interest");
if(Integer.parseInt(answer) == 1) {
	out.println("よかったぁ！");
} else {
	out.println("えぇ、なんでぇ？？？");
}
%>
</body>
</html>