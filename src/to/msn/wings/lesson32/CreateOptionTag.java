package to.msn.wings.lesson32;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class CreateOptionTag extends TagSupport {
	private int start = 0;
	private int end = 10;
	public void setStart(int start) { this.start = start; }
	public void setEnd(int end) { this.end = end; }
	
	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			for(int i = this.start; i <= this.end; i++) {
				out.println("<option value='" + i + "'>" + i + "</option>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}
}
