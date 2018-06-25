<%@ page contentType="text/html;charset=UTF-8" %>
<%!
private String transferCRLT(String value) {
  String result = value.replace(System.getProperty("line.separator"), "<br />");
  return result;
}
%>
<html>
<head>
<title>改行文字をブラウザに表示</title>
</head>
<body>
<div style="border:1px solid; width:400px; height:100px;">
<%=transferCRLT(request.getParameter("esc")) %>
</div>
</body>
</html>
