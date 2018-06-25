<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>単語帳検索（検索結果）</title>
</head>
<body>
<%
HashMap<String, String> map = new HashMap<String, String>();
map.put("JSP", "Java Server Pages \t Java言語で記述できるHTML埋込型言語");
map.put("XML", "eXtensible Markup Language \t 要素を定義できるデータ記述言語");
map.put("PHP", "Hypertext PreProcessor \t 豊富な関数が魅力のHTML埋込型言語");
map.put("ASP.NET", "Active Server Pages .NET \t IIS上で動作するサーバサイド処理環境");
String keywd = request.getParameter("keywd");
if(map.containsKey(keywd)) {
	String result = map.get(keywd);
	StringTokenizer token = new StringTokenizer(result, "\t");
%>
	<dl>
		<dt>
			検索キーワード：<%=keywd %></dt>
		<dd>
			<ol>
				<li><%=token.nextToken() %></li>
				<li><%=token.nextToken() %></li>
			</ol>
		</dd>
	</dl>
<% } else { %>
	<div style="color:Red">指定された単語は見つかりませんでした</div>
<% } %>
</body>
</html>
