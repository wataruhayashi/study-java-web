package to.msn.wings.lesson26_28;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson26_28/MvcServlet")
public class MvcServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		ArrayList<Schedule> list = Schedule.getInfos();
		request.setAttribute("list", list);
		getServletContext().getRequestDispatcher("/lesson26_28/mvc.jsp").forward(request, response);
	}
}