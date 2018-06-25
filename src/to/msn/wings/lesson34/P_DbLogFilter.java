package to.msn.wings.lesson34;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

public class P_DbLogFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
		Connection db = null;
		PreparedStatement ps = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
			db = ds.getConnection();
			Date current = Calendar.getInstance().getTime();
			SimpleDateFormat dfmt = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat tfmt = new SimpleDateFormat("HH:mm:ss");
			ps = db.prepareStatement(
				"INSERT INTO logs(access_date, access_time, agent, path, ip_address) VALUES(?,?,?,?,?)");
			ps.setString(1, dfmt.format(current));
			ps.setString(2, tfmt.format(current));
			ps.setString(3, ((HttpServletRequest)request).getHeader("user-agent"));
			ps.setString(4, ((HttpServletRequest)request).getServletPath());
			ps.setString(5, request.getRemoteAddr());
			ps.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) { ps.close(); }
				if(db != null) { db.close(); }
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		chain.doFilter(request, response);
	}
	
	@Override
	public void init(FilterConfig config){}

	@Override
	public void destroy(){}
}
