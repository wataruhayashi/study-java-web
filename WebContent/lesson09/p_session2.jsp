<%@ page contentType="text/html; charset=UTF-8" %>
<%
String[] names = { "name", "address" };
if(request.getParameter("rec") != null) {
	for(int i = 0; i < names.length; i++) {
		session.setAttribute(names[i], request.getParameter(names[i]));
	}
	out.println("セッションに情報が保存されました");
} else {
	session.invalidate();
	out.println("セッションから情報を破棄しました");
}
%>
