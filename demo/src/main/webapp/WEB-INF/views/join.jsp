<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="join" method="POST">

		<p>
			Name : <input type="text" name="name" />
		</p>
		<p>
			Password : <input type="text" name="password" />
		</p>
		<p>
			Email : <input type="text" name="email" />
		</p>
		<p>
			Addr : <input type="text" name="addr" size="30" />
		</p>
		<p>
			Memo : <textarea rows="5" cols="50" name="memo"></textarea>
		</p>
		<p>
			<input type="submit" value="저장" />
		</p>
	</form>
</body>
</html>