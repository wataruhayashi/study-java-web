<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="Nul">
<%
String s = (String)request.getAttribute("Etu");
if(s == null){s = "0";}
%>
<%=s %>
	<input type="radio" name="etu" value="0" <% if(s=="0" || s == null){ %>checked<%} %>>閲覧
	<input type="radio" name="etu" value="2" <% if(s=="2"){ %>checked<%} %>>編集可
	<input type="submit" value="ボタン" />
</form>
</body>
</html>