package to.msn.wings.lesson24;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson24/EscapeServlet")
public class EscapeServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>予約文字のエスケープ</title>");
		out.println("</head><body>");
		out.println("入力した文字：");
		out.println(this.htmlEscape(request.getParameter("esc")));
		out.println("</body></html>");
	}

	private String htmlEscape(String value) {
		StringBuilder result = new StringBuilder();
		for(int i = 0; i < value.length(); i++) {
			switch(value.charAt(i)) {
				case '&' :
					result.append("&amp;");
					break;
				case '<' :
					result.append("&lt;");
					break;
				case '>' :
					result.append("&gt;");
					break;
				default :
					result.append(value.charAt(i));
					break;
			}
		}
		return result.toString();
	}
}
