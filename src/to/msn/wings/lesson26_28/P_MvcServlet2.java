package to.msn.wings.lesson26_28;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson26_28/P_MvcServlet2")
public class P_MvcServlet2 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException,IOException {
		Book info = Book.getInfo(request.getParameter("isbn"));
		request.setAttribute("info", info);
		getServletContext().getRequestDispatcher("/lesson26_28/p_mvc2.jsp").forward(request, response);
	}
}
