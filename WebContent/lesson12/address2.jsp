<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>アドレス帳検索（検索結果）</title>
</head>
<body>
<%
HashMap<String, String> map = new HashMap<String, String>();
map.put("輪笠貴子", "女, 0xx-xxx9-1111, 横浜市○×町5-18-199");
map.put("佐々木健司", "男, 04x-231x-xxxx, 川崎市○○町1-3213");
map.put("鳥内宮子","女, 09x-21xx-xx97, 横浜市◇◇区5-16");
map.put("金崎瑞穂", "女, 02x-654x-324x, 相模原市△△区1-9-21");
String name = request.getParameter("name");
if(map.containsKey(name)) {
	String result = map.get(name);
	StringTokenizer token = new StringTokenizer(result, ",");
%>
	<dl>
		<dt><%=name %></dt>
		<dd>
			<ol>
				<li><%=token.nextToken() %></li>
				<li><%=token.nextToken() %></li>
				<li><%=token.nextToken() %></li>
			</ol>
		</dd>
	</dl>
<% } else { %>
	<div style="color:Red">指定された名前は見つかりませんでした</div>
<% } %>
</body>
</html>
