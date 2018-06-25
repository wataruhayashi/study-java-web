package to.msn.wings.lesson26_28;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson26_28/SearchServlet")
public class SearchServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>簡易スケジュール帳</title>");
		out.println("</head><body>");
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<th>日付</th><th>時刻</th><th>予定名</th><th>備考</th><th>編集</th>");
		out.println("</tr>");
		ArrayList<Schedule> list = Schedule.getInfos();
		for(Schedule info : list){
			out.println("<tr>");
			out.println("<td>" + info.getScheduleDate() + "</td>");
			out.println("<td>" + info.getScheduleTime() + "</td>");
			out.println("<td>" + info.getTitle() + "</td>");
			out.println("<td>" + info.getMemo() + "</td>");
			out.println("<td><a href='edit.jsp?id=" + info.getId() + "'>編集</a></td>");
			out.println("</tr>");
		}
		out.println("</table></body></html>");
	}
}
