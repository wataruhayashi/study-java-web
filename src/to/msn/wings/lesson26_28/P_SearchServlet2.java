package to.msn.wings.lesson26_28;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson26_28/P_SearchServlet2")
public class P_SearchServlet2 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException,IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		DecimalFormat nformat = new DecimalFormat("#,###円");
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy年MM月dd日");
		Book info = Book.getInfo(request.getParameter("isbn"));
		if(info != null){
			out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
			out.println("<title>書籍情報詳細</title>");
			out.println("</head><body>");
			out.println("<table border='1'><tr>");
			out.println("<th style='text-align:right;'>ISBNコード</th><td>");
			out.println(info.getIsbn() + "</td>");
			out.println("</tr><tr>");
			out.println("<th style='text-align:right;'>書名：</th><td>");
			out.println(info.getTitle() + "</td>");
			out.println("</tr><tr>");
			out.println("<th style='text-align:right;'>価格：</th><td>");
			out.println(nformat.format(info.getPrice()) + "</td>");
			out.println("</tr><tr>");
			out.println("<th style='text-align:right;'>出版社：</th><td>");
			out.println(info.getPublish() + "</td>");
			out.println("</tr><tr>");
			out.println("<th style='text-align:right;'>刊行日：</th><td>");
			out.println(dformat.format(info.getPublished()) + "</td>");
			out.println("</tr></table></body></html>");
		}else{
			out.println("該当する情報はありません。");
		}
	}
}
