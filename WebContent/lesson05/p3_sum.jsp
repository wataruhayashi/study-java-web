<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>1～100の間の奇数を合計</title>
</head>
<body>
<%
int result = 0;
for(int i = 1; i <= 100; i++) {
	if(i % 2 == 0) { continue; }
	result += i;
}
out.println("合計値：" + result);
%>
</body>
</html>
