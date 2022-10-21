<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insert" method="post">
<table>
<tr><td>이름</td><td><input type="text" name="name"></td></tr>
<tr><td>이메일</td><td><input type="text" name="email"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="password"></td></tr>
<tr><td>주소</td><td><input type="text" name="addr"></td></tr>
<tr><td>메모</td><td><textarea name="memo" rows="3" cols="30"></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
</table>
</form>
</body>
</html>