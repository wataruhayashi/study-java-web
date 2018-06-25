package to.msn.wings.lesson25;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson25/P1_ReaderServlet")
public class P1_ReaderServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		ServletContext application = getServletContext();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>住所録一覧</title>");
		out.println("</head><body>");
		out.println("<table border='1'><tr>");
		out.println("<th>No.</th><th>名前</th><th>性別</th><th>電話番号</th><th>住所</th></tr>");
		FileReader reader = new FileReader(
			application.getRealPath("/WEB-INF/data/data.txt"));
			BufferedReader buf = new BufferedReader(reader);
			while(buf.ready()) {
				String line = buf.readLine();
				out.println("<tr>");
				StringTokenizer token = new StringTokenizer(line, "\t");
				while(token.hasMoreTokens()) {
					out.println("<td>" + token.nextToken() + "</td>");
				}
				out.println("</tr>");
			}
			buf.close();
		out.println("</table></body></html>");
	}
}
