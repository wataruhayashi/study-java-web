package to.msn.wings.lesson23;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson23/P_KukuServlet")
public class P_KukuServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>九九表</title>");
		out.println("</head><body>");
		out.println("<table border='1'><tr>");
		out.println("<th></th><th>1</th><th>2</th><th>3</th><th>4</th>");
		out.println("<th>5</th><th>6</th><th>7</th><th>8</th><th>9</th></tr>");
		for(int i = 1; i < 10; i++) {
			out.println("<tr>");
			out.println("<th>" + i + "</th>");
			for(int j = 1; j < 10; j++) {
				if(i * j > 40){ break; }
				out.println("<td align='right' width='20'>" + (i * j) + "</td>");
			}
			out.println("</tr>");
		}
		out.println("</table></body></html>");
	}
}
