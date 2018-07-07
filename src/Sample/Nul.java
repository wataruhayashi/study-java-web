package Sample;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Nul
 */
@WebServlet("/Nul")
public class Nul extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Nul() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s = request.getParameter("etu");
		if(s=="0") {
		    System.out.println(00000);
		    request.setAttribute("Etu", "0");
		}else {
		    System.out.println(22222);
		    request.setAttribute("Etu", "2");
		}
		response.sendRedirect("Nul.jsp");

	}

}
