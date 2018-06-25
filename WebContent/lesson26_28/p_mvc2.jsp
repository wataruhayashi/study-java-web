<%@ page contentType="text/html; charset=UTF-8"
         import="java.text.*" %>
<jsp:useBean id="info" class="to.msn.wings.lesson26_28.Book" scope="request" />
<%
DecimalFormat nformat = new DecimalFormat("#,###円");
SimpleDateFormat dformat = new SimpleDateFormat("yyyy年MM月dd日");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>書籍情報詳細</title>
</head>
<body>
<table border="1">
<tr>
<th style="text-align:right;">ISBNコード</th>
<td><%=info.getIsbn() %></td>
</tr>
<tr>
<th style="text-align:right;">書名</th>
<td><%=info.getTitle() %></td>
</tr>
<tr>
<th style="text-align:right;">価格</th>
<td><%=nformat.format(info.getPrice()) %></td>
</tr>
<tr>
<th style="text-align:right;">出版社</th>
<td><%=info.getPublish() %></td>
</tr>
<tr>
<th style="text-align:right;">刊行日</th>
<td><%=dformat.format(info.getPublished()) %></td>
</tr>
</table>
</body>
</html>
