<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
InitialContext context = new InitialContext();
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
Connection db = ds.getConnection();
db.setAutoCommit(false);
PreparedStatement up = db.prepareStatement("UPDATE books SET title=?, price=?, publish=?, published=? WHERE isbn=?");
PreparedStatement del = db.prepareStatement("DELETE FROM books WHERE isbn=?");
int count = Integer.parseInt(request.getParameter("count"));
for(int i = 1; i < count; i ++) {
	if(request.getParameter("delete" + i) == null) {
		up.setString(1, request.getParameter("title" + i));
		up.setString(2, request.getParameter("price" + i));
		up.setString(3, request.getParameter("publish" + i));
		up.setString(4, request.getParameter("published" + i));
		up.setString(5, request.getParameter("isbn" + i));
		up.executeUpdate();
	} else {
		del.setString(1, request.getParameter("isbn" + i));
		del.executeUpdate();
	}
}
up.close();
del.close();
db.commit();
db.close();
response.sendRedirect("p_edit.jsp");
%>
