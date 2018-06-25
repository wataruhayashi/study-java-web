<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>予約文字のエスケープ</title>
</head>
<body>
<form method="POST" action="EscapeServlet">
<label>入力文字：
  <input type="text" name="esc" size="20" />
</label>
<input type="submit" value="送信" />
</form>
</body>
</html>
