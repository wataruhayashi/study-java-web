<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>住所の登録</title>
</head>
<body>
<form method="POST" action="p_addrec2.jsp">
<div>
	<label>No：<br />
		<input type="text" name="no" size="3" />
	</label>
</div>
<div>
	<label>名前：<br />
		<input type="text" name="name" size="20" />
	</label>
</div>
<div>
	<label>性別：<br />
	<select name="sex">
		<option value="男">男</option>
		<option value="女">女</option>
	</select>
	</label>
</div>
<div>
	<label>TEL：<br />
		<input type="text" name="tel" size="20" />
	</label>
</div>
<div>
	<label>住所：<br />
		<input type="text" name="address" size="60" />
	</label>
</div>
<div>
	<input type="submit" value="登録" />
</div>
</form>
</body>
</html>
