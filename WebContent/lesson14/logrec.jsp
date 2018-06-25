<%@ page pageEncoding="UTF-8"
				 import="java.util.* ,java.text.* ,java.io.*" %>
<%
StringBuilder builder = new StringBuilder();
Calendar cal = Calendar.getInstance();
Date current = cal.getTime();
SimpleDateFormat dformat = new SimpleDateFormat("yyyyMM");
String path = "/WEB-INF/data/" + dformat.format(current) + ".log";
FileWriter writer = new FileWriter(application.getRealPath(path), true);
BufferedWriter buf = new BufferedWriter(writer, 10);
SimpleDateFormat tformat = new SimpleDateFormat("H:m:s");
builder.append(tformat.format(current));
builder.append("\t");
builder.append(request.getServletPath());
builder.append("\t");
builder.append(request.getHeader("referer"));
builder.append("\t");
builder.append(request.getHeader("user-agent"));
builder.append("\t");
buf.write(builder.toString());
buf.newLine();
buf.close();
%>
