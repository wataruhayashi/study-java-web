package to.msn.wings.lesson31;

public class WingsUtil {
	public static String createOption(int start, int end) {
		StringBuilder builder = new StringBuilder();
		for(int i = start; i <= end; i ++) {
			builder.append("<option value='" + i + "'>" + i + "</option>");
		}
		return builder.toString();
	}
}
