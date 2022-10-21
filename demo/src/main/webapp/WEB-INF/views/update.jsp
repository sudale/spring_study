<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
<h3>수정하기</h3>
		<p>
			id : <input type="text" name="id" id="id" value="${member.id }" readonly="readonly"/>
		</p>
		<p>
			Name : <input type="text" name="name" id="name" value="${member.name }"/>
		</p>
		<p>
			Password : <input type="text" name="password" id="password" />
		</p>
		<p>
			Email : <input type="text" name="email" id="email" value="${member.email }"/>
		</p>
		<p>
			Addr : <input type="text" name="addr" id="addr" size="30" value="${member.addr }"/>
		</p>
		<p>
			Memo : <textarea rows="5" cols="50" id="memo" name="memo">${member.memo }</textarea>
		</p>
<button type="button"id="btnUpdate">수정하기</button>
<script src="/js/member.js"></script>
</body>
</html>