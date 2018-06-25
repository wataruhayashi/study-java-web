package to.msn.wings.lesson24;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson24/P2_QueryServlet")
public class P2_QueryServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>クエリ情報を取得する</title>");
		out.println("</head><body><table border='1'>");
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String name = params.nextElement();
			out.println("<tr><th>" + name + "</th>");
			out.println("<td>" + request.getParameter(name) + "</td></tr>");
		}
		out.println("</table></body></html>");
	}
}
