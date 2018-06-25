<%@ page contentType="application/octet-stream; charset=Windows-31J"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%
response.setHeader("Content-Disposition", "attachment; filename=output.txt");
Context context = new InitialContext();
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement("SELECT * FROM books");
ResultSet rs = ps.executeQuery();
ResultSetMetaData meta = rs.getMetaData();
for(int i = 1; i <= meta.getColumnCount(); i++) {
	out.print(meta.getColumnName(i));
	if(i != meta.getColumnCount()) { out.print("\t"); }
}
out.print("\r\n");
while(rs.next()) {
	for(int j = 1; j <= meta.getColumnCount(); j++) {
		out.print(rs.getString(j));
		if(j != meta.getColumnCount()) { out.print("\t"); }
	}
	out.print("\r\n");
}
rs.close();
ps.close();
db.close();
out.close();
%>