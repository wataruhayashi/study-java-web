package to.msn.wings.lesson26_28;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson26_28/P_MvcServlet1")
public class P_MvcServlet1 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException,IOException {
		ArrayList<Book> list = Book.getInfos();
		request.setAttribute("list", list);
		getServletContext().getRequestDispatcher("/lesson26_28/p_mvc1.jsp").forward(request, response);
	}
}