<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>書籍情報登録</title>
</head>
<body>
<form method="POST" action="P_InsertServlet">
<div>
	<label>ISBNコード：<br />
		<input type="text" name="isbn" size="20" /></label>
</div>
<div>
	<label>書名：<br />
		<input type="text" name="title" size="50" /></label>
</div>
<div>
	<label>価格：<br />
		<input type="text" name="price" size="5" />円</label>
</div>
<div>
	<label>出版社：<br />
	<select name="publish">
		<option value="翔泳社">翔泳社</option>
		<option value="秀和システム">秀和システム</option>
		<option value="日経BP">日経BP</option>
		<option value="技術評論社">技術評論社</option>
	</select></label>
</div>
<div>
	<label>刊行日<br />
		<input type="text" name="published" size="12" /></label>
</div>
<div>
	<input type="submit" value="登録" />
</div>
</form>
</body>
</html>
