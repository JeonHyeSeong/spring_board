<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<h2>게시글 등록</h2>
<!-- mapping 상태는 get / post가 별도의 mapping을 가짐 -->
<form action="/board/register" method="post">
	title : <input type="text" name="title"> <br>
	writer : <input type="text" name="writer"> <br>
	content : <textarea rows="5" cols="50" name="content"></textarea> <br>
	<button type="submit">등록</button>
</form>
<br>
<a href="/">
	<button type="button">홈</button>
</a>
<a href="/board/list">
	<button type="button">리스트</button>
</a>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>