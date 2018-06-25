package to.msn.wings.lesson25;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson25/P2_RegexpServlet")
public class P2_RegexpServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>正規表現で文字列を検索</title>");
		out.println("</head><body>");
		String msg = "メールアドレスは、CQW15204@nifty.com です。";
		msg += "y-yamada@mcn.ne.jp もあります。";
		Pattern pattern = Pattern.compile(
			"[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+", Pattern.CASE_INSENSITIVE);
		Matcher match = pattern.matcher(msg);
		while(match.find()) {
			out.println(match.group() + "<br />");
		}
		out.println("</body></html>");
	}
}
