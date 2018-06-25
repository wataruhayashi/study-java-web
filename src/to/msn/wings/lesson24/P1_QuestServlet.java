package to.msn.wings.lesson24;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson24/P1_QuestServlet")
public class P1_QuestServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>アンケート結果</title>");
		out.println("</head><body>");
		String answer = request.getParameter("interest");
		if(Integer.parseInt(answer) == 1) {
			out.println("よかったぁ！");
		} else {
			out.println("えぇ、なんでぇ？？？");
		}
		out.println("</body></html>");
	}
}
