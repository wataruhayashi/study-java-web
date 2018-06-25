<%@ page contentType="text/html; charset=UTF-8"
  import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
Context context = new InitialContext();
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
Connection db = ds.getConnection();
PreparedStatement ps;

if (request.getParameter("delete") != null) {
  ps = db.prepareStatement("DELETE FROM schedules WHERE id=?");
  ps.setString(1, request.getParameter("id"));
} else {
  ps = db.prepareStatement("UPDATE schedules SET title=?, schedule_date=?, schedule_time=?, memo=? WHERE id=?");
  ps.setString(1, request.getParameter("title"));
  ps.setString(2, request.getParameter("date_year") + "-" +
    request.getParameter("date_month") + "-" +
    request.getParameter("date_day"));
  ps.setString(3, request.getParameter("time_hour") + ":" +
    request.getParameter("time_minute"));
  ps.setString(4, request.getParameter("memo"));
  ps.setString(5, request.getParameter("id"));
}
ps.executeUpdate();
ps.close();
db.close();
response.sendRedirect("select.jsp");
%>