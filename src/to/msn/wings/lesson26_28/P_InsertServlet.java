package to.msn.wings.lesson26_28;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson26_28/P_InsertServlet")
public class P_InsertServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Book info = new Book();
		info.setIsbn(request.getParameter("isbn"));
		info.setTitle(request.getParameter("title"));
		info.setPrice(request.getParameter("price"));
		info.setPublish(request.getParameter("publish"));
		info.setPublished(request.getParameter("published"));
		info.insertInfo();
		response.sendRedirect("p_new.jsp");
	}
}
