<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.*" %>
<%
String msg = null;
int[] ymd = {1964, 8, 5};
Calendar today = Calendar.getInstance();
Calendar birth = Calendar.getInstance();
int year = today.get(Calendar.YEAR);
birth.set(year, ymd[1] - 1, ymd[2]);
if(birth.equals(today)) {
	msg = "ナミちゃんの" + (year - ymd[0]) + "歳の誕生日、おめでとう！";
} else {
	if(!birth.after(today)) {
		birth.set(Calendar.YEAR, year + 1);
	}
	long diff = (birth.getTimeInMillis() - today.getTimeInMillis()) / (24 * 60 * 60 * 1000);
	msg = "ナミちゃんの誕生日まで、あと" + diff + "日";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>お誕生日おめでとう！</title>
</head>
<body onload="window.alert('<%=msg %>')">
</body>
</html>
