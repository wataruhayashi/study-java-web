package to.msn.wings.lesson31;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import to.msn.wings.lesson26_28.Book;

@WebServlet("/lesson31/P_MvcServlet2")
public class P_MvcServlet2 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException {
		Book info = Book.getInfo(request.getParameter("isbn"));
		request.setAttribute("info", info);
		getServletContext().log(info.getIsbn());
		getServletContext().getRequestDispatcher("/lesson31/p_mvc2.jsp").forward(request, response);
	}
}
