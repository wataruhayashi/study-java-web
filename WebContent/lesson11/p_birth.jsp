<%@ page contentType="text/html;charset=UTF-8"
				 import="java.util.*" %>
<%
long diff, min = 366;
boolean flag = false;
String name = null, msg = "";
String[] names = { "掛谷奈美", "望月美奈", "日尾有宏", "松岡徹", "山本晃子" };
int[][] ymd = {{1975, 8, 5}, {1950, 12, 1}, {1964, 4, 2}, {1968, 3, 1}, {1932, 6, 28}};
Calendar today = Calendar.getInstance();
Calendar birth = Calendar.getInstance();
int year = today.get(Calendar.YEAR);
for(int i = 0; i < names.length; i++) {
	birth.set(year, ymd[i][1]-1, ymd[i][2]);
	if(birth.equals(today)) {
		msg = names[i] + "さん、" + (year-ymd[i][0]) + "歳の誕生日、おめでとう！";
		flag = true;
		break;
	} else {
		if(birth.after(today)) {
			diff = (birth.getTimeInMillis() - today.getTimeInMillis()) / (24 * 60 * 60* 1000);
		} else {
			birth.set(year + 1, ymd[i][1] - 1, ymd[i][2]);
			diff = (birth.getTimeInMillis() - today.getTimeInMillis()) / (24 * 60 * 60 * 1000);
		}
		if(min > diff) {
			min = diff;
			name = names[i];
		}
	}
}
if(!flag) { msg = name + "さんの誕生日まで、あと" + min + "日"; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>お誕生日おめでとう！</title>
</head>
<body onload="alert('<%=msg %>')">
</body>
</html>
