package to.msn.wings.lesson31;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import to.msn.wings.lesson26_28.Schedule;

@WebServlet("/lesson31/InsertServlet")
public class InsertServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Schedule info = new Schedule();
		info.setTitle(request.getParameter("title"));
		info.setScheduleDate(request.getParameter("date_year") + "-" +
			request.getParameter("date_month") + "-" +
			request.getParameter("date_day"));
		info.setScheduleTime(request.getParameter("time_hour") + ":" +
				request.getParameter("time_minute"));
		info.setMemo(request.getParameter("memo"));
		info.insertInfo();
		response.sendRedirect("MvcServlet");
	}
}
