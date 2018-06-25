package to.msn.wings.lesson24;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson24/P3_CookieServlet")
public class P3_CookieServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		boolean flag = false;
		int count = 1;
		Cookie cook = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie current : cookies) {
				if(current.getName().equals("cnt") == true) {
					count = Integer.parseInt(current.getValue()) + 1;
					cook = new Cookie("cnt", (new Integer(count)).toString());
					cook.setMaxAge(60 * 60 * 24 * 180);
					response.addCookie(cook);
					flag = true;
					break;
				}
			}
		}
		if(!flag) {
			cook = new Cookie("cnt", "1");
			cook.setMaxAge(60 * 60 * 24 * 180);
			response.addCookie(cook);
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>クッキーで簡易アクセスカウンター</title>");
		out.println("</head><body>");
		out.println("あなたはこのサイトに" + count + "回、アクセスしました。");
		out.println("</body></html>");
	}
}
