package to.msn.wings.lesson34;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

// @WebFilter(urlPatterns = "/*", filterName = "LogFilter",
//   dispatcherTypes = DispatcherType.REQUEST,
//   initParams = @WebInitParam(name = "path", value = "/WEB-INF/data")
// )
public class LogFilter implements Filter {
	private String path = null;

	@Override
	public void init(FilterConfig config) {
		this.path = config.getInitParameter("path");
	}
	
	@Override
	public void destroy() {}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest)request;
		ServletContext app = req.getSession().getServletContext();
		Date current = Calendar.getInstance().getTime();
		SimpleDateFormat dfmt = new SimpleDateFormat("yyyyMMdd");
		String path = this.path + "/" + dfmt.format(current).toString() + ".log";
		FileWriter writer = new FileWriter(app.getRealPath(path), true);
		BufferedWriter buf = new BufferedWriter(writer, 10);
		SimpleDateFormat tfmt = new SimpleDateFormat("HH:mm:ss");
		buf.write(tfmt.format(current).toString());
		buf.write("\t");
		buf.write(req.getHeader("user-agent"));
		buf.write("\t");
		buf.write(req.getServletPath());
		buf.write("\t");
		buf.write(req.getRemoteAddr());
		buf.newLine();
		buf.close();
		chain.doFilter(request, response);
	}
}
