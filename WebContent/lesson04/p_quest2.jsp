<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>アンケート結果</title>
</head>
<body>
<%
switch (Integer.parseInt(request.getParameter("food"))) {
	case 3  : out.println("僕も大好きです");break;
	case 2  : out.println("まぁまぁですね");break;
	case 1  : out.println("この世の食べ物とも思えない");break;
	default : out.println("！？？？");break;
}
%>
</body>
</html>
