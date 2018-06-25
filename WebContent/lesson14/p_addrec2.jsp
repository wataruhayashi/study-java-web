<%@ page contentType="text/html;charset=UTF-8"
         import="java.io.*" %>
<%
request.setCharacterEncoding("UTF-8");
StringBuilder builder = new StringBuilder();
FileWriter writer = new FileWriter(
	application.getRealPath("/WEB-INF/data/data.txt"), true);
BufferedWriter buf = new BufferedWriter(writer);
builder.append(request.getParameter("no"));
builder.append("\t");
builder.append(request.getParameter("name"));
builder.append("\t");
builder.append(request.getParameter("sex"));
builder.append("\t");
builder.append(request.getParameter("tel"));
builder.append("\t");
builder.append(request.getParameter("address"));
builder.append("\t");
buf.write(builder.toString());
buf.newLine();
buf.close();
response.sendRedirect("p_addrec1.jsp");
%>
