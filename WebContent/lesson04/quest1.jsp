<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>アンケート調査</title>
</head>
<body>
<form method="POST" action="quest2.jsp">
<div>
	この本はおもしろいですか？<br />
	<label>
		<input type="radio" name="interest" value="1" checked="checked" />おもしろい！
	</label>
	<label>
		<input type="radio" name="interest" value="0" />おもしろくない！
	</label>
</div>
<div>
	<input type="submit" value="登録" />
</div>
</form>
</body>
</html>
