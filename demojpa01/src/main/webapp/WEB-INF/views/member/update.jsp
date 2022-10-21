<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/member/update" method="post">
<table>
<tr><td>아이디</td><td><input type="text" name="id" value="${member.id}" readonly></td></tr>
<tr><td>이름</td><td><input type="text" name="name" value="${member.name}" readonly></td></tr>
<tr><td>이메일</td><td><input type="text" name="email" value="${member.email}"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="password" value="${member.password}"></td></tr>
<tr><td>주소</td><td><input type="text" name="addr" value="${member.addr}"></td></tr>
<tr><td>메모</td><td><textarea name="memo" rows="3" cols="30">${member.memo}</textarea></td></tr>
<tr><td colspan="2">
<input type="submit" value="수정">
<input type="button" value="삭제" onclick="location.href='/member/delete/${member.id}'">
</td></tr>
</table>
</form>
</body>
</html>