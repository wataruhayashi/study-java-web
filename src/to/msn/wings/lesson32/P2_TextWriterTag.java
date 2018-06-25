package to.msn.wings.lesson32;

import java.io.BufferedWriter;
import java.io.FileWriter;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class P2_TextWriterTag extends BodyTagSupport {
	String path = null;
	public void setPath(String path) { this.path = path; }
		
	@Override
	public int doStartTag() throws JspException {
		return EVAL_BODY_BUFFERED;
	}
	
	@Override
	public int doEndTag() throws JspException {
		try {
			ServletContext application=pageContext.getServletContext();
			FileWriter writer = new FileWriter(
				application.getRealPath(this.path), true);
			BufferedWriter buf = new BufferedWriter(writer);
			buf.write(bodyContent.getString().trim());
			buf.newLine();
			buf.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
}
