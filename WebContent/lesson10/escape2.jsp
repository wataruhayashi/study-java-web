<%@ page contentType="text/html;charset=UTF-8" %>
<%!
private String htmlEscape(String value) {
	StringBuilder result = new StringBuilder();
	for(int i = 0; i < value.length(); i++) {
		switch(value.charAt(i)) {
			case '&' :
				result.append("&amp;");
				break;
			case '<' :
				result.append("&lt;");
				break;
			case '>' :
				result.append("&gt;");
				break;
			default :
				result.append(value.charAt(i));
				break;
		}
	}
	return result.toString();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>予約文字のエスケープ</title>
</head>
<body>
入力した文字：<%=htmlEscape(request.getParameter("esc")) %>
</body>
</html>
