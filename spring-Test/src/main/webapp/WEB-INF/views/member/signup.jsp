<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<h3>회원가입</h3>

<form action="/member/signup" method="post">
	ID : <input type="text" name="id" placeholder="아이디"> <br>
	Password : <input type="password" name="pw" placeholder="비밀번호"> <br>
	Name : <input type="text" name="name" placeholder="이름"> <br>
	Email : <input type="email" name="email" placeholder="이메일"> <br>
	Home : <input type="text" name="home" placeholder="주소"> <br>
	Age : <input type="text" name="age" placeholder="나이"> <br>
	<button type="submit">회원가입</button>
</form>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>