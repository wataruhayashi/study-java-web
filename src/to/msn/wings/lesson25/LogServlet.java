package to.msn.wings.lesson25;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
  urlPatterns = { "/lesson25/LogServlet" },
  initParams = { @WebInitParam(name = "path", value = "/WEB-INF/data/") }
)
public class LogServlet extends HttpServlet {
	private String param = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.param = config.getInitParameter("path");
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		this.log(request);
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>カスタマイズ版アクセスログ</title>");
		out.println("</head><body>");
		out.println("<p>ログを記録しました。</p>");
		out.println("</body></html>");
	}

	private void log(HttpServletRequest request) {
		try {
			ServletContext application = getServletContext();
			StringBuilder builder = new StringBuilder();
			Calendar cal = Calendar.getInstance();
			Date current = cal.getTime();
			SimpleDateFormat dformat = new SimpleDateFormat("yyyyMM");
			String path = this.param + dformat.format(current) + ".log";
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
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}
