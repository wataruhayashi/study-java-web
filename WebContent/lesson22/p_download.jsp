<%@ page contentType="application/octet-stream; charset=Windows-31J"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%
response.setHeader("Content-Disposition", "attachment; filename=schedules.csv");
Context context = new InitialContext();
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement("SELECT * FROM schedules ORDER BY schedule_date, schedule_time");
ResultSet rs = ps.executeQuery();
ResultSetMetaData meta = rs.getMetaData();
while(rs.next()) {
	for(int i = 1; i <= meta.getColumnCount(); i++) {
		out.print(rs.getString(i));
		if(i != meta.getColumnCount()) { out.print(","); }
	}
	out.print("\r\n");
}
rs.close();
ps.close();
db.close();
out.close();
%>