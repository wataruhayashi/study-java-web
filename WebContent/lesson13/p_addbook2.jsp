<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.*,java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>アドレス帳検索（検索結果）</title>
</head>
<body>
<%
String no = null, name = null, sex = null, tel = null, address = null;
boolean flag = false;
String key = request.getParameter("name");
FileReader reader = new FileReader(
	application.getRealPath("/WEB-INF/data/data.txt"));
BufferedReader buf = new BufferedReader(reader);
while(buf.ready()) {
	String line = buf.readLine();
	StringTokenizer token = new StringTokenizer(line, "\t");
	no      = token.nextToken();
	name    = token.nextToken();
	sex     = token.nextToken();
	tel     = token.nextToken();
	address = token.nextToken();
	if(name.equals(key)) {
		flag = true;
		break;
	}
}
buf.close();
if(flag) {
%>
	<dl>
		<dt style="font-size:14pt;font-weight:bold"><%=name %></dt>
		<dd>
			<ol>
				<li><%=sex %></li>
				<li><%=tel %></li>
				<li><%=address %></li>
			</ol>
		</dd>
	</dl>
<% } else { %>
	<div style="color:Red">指定された名前は見つかりませんでした</div>
<% } %>
</body>
</html>
