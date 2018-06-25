<%@ page contentType="text/html; charset=UTF-8" %>
<%
String[] names  = { "name", "address" };
String[] values = { "", "" };
for(int i = 0; i < names.length; i++) {
	values[i] = (String)session.getAttribute(names[i]);
	values[i] = (values[i] == null) ? "" : values[i];
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>セッションで情報を保持</title>
</head>
<body>
<form method="POST" action="p_session2.jsp">
<div>
	<label>名前：<br />
		<input type="text" name="name" size="20"
			value="<%=values[0] %>" />
	</label>
</div>
<div>
	<label>E-Mail：<br />
		<input type="text" name="address" size="40"
			value="<%=values[1] %>" />
	</label>
</div>
<div>
	<label>
		<input type="checkbox" name="rec" value="true" checked />
		情報を記録する
	</label>
</div>
<div>
	<input type="submit" value="登録" />
</div>
</form>
</body>
</html>
