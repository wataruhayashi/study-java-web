package to.msn.wings.lesson26_28;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson26_28/P_SearchServlet1")
public class P_SearchServlet1 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>書籍情報一覧</title>");
		out.println("</head><body>");
		out.println("<table border='1'><tr>");
		out.println("<th>ISBNコード</th><th>書名</th><th>価格</th>");
		out.println("<th>出版社</th><th>刊行日</th></tr>");
		ArrayList<Book> list = Book.getInfos();
		DecimalFormat nformat = new DecimalFormat("#,###円");
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy年MM月dd日");
		for(Book info : list){
			out.println("<tr><td><a href='P_SearchServlet2?isbn=" +
				info.getIsbn() + "'>" + info.getIsbn() + "</a></td>");
			out.println("<td>" + info.getTitle() + "</td>");
			out.println("<td>" + nformat.format(info.getPrice()) + "</td>");
			out.println("<td>" + info.getPublish() + "</td>");
			out.println("<td>" + dformat.format(info.getPublished()) + "</td>");
		}
		out.println("</tr></table></body></html>");
	}
}
