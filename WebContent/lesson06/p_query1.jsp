<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>フォーム情報を取得</title>
</head>
<body>
<form method="POST" action="p_query2.jsp">
<div>
	<label>名前：
		<input type="text" name="nam" size="15" />
	</label>
</div>
<div>
	よく使う技術：
	<label><input type="checkbox" name="lang" value="jsp" />Java</label>
	<label><input type="checkbox" name="lang" value="asp.net" />ASP.NET</label>
	<label><input type="checkbox" name="lang" value="php" />PHP</label>
</div>
<div>
	<input type="submit" value="登録" />
</div>
</form>
</body>
</html>
