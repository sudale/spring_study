<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="register">가입</a>
	<table border=1>
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>주소</td>
			<td>메모</td>
			<td>삭제</td>
		</tr>
		<c:forEach items="${list}" var="member">
		<tr>
			<td><a href="update/${member.id}">${member.id }</a></td>
			<td>${member.name }</td>
			<td>${member.email}</td>
			<td>${member.addr }</td>
			<td>${member.memo }</td>
			<td><input type="button" value="삭제" onclick="location.href='/member/delete/${member.id}'"></td>
		</tr>
		</c:forEach>
</table>
</body>
</html>