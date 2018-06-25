package to.msn.wings.lesson32;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class P1_Text2TableTag extends TagSupport {
	private String path = null;
	private String titleColor = "#FFffCC";
	private String dataColor = "#FFffFF";
	public void setPath(String path) { this.path = path; }
	public void setTitleColor(String titleColor) { this.titleColor = titleColor; }
	public void setDataColor(String dataColor) { this.dataColor = dataColor; }
	
	@Override
	public int doStartTag() throws JspException {
		boolean flag = true;
		ServletContext application=pageContext.getServletContext();
		JspWriter out = pageContext.getOut();
		try {
			FileReader reader = new FileReader(application.getRealPath(this.path));
			BufferedReader buf = new BufferedReader(reader);
			out.println("<table border='1'>");
			while(buf.ready()) {
				String line = buf.readLine();
				if(flag) {
					out.println("<tr style='background:" + titleColor + "'>");
					flag = false;
				} else {
					out.println("<tr style='background:" + dataColor + "'>");
				}
				StringTokenizer token = new StringTokenizer(line, "\t");
				while(token.hasMoreTokens()) {
					out.println("<td>" + token.nextToken() + "</td>");
				}
				out.println("</tr>");
			}
			out.println("</table>");
			buf.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}
}
