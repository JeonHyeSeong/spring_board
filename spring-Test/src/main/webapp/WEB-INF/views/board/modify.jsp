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

<form action="/board/modify" method="post">
	<table class="table table-dark table-striped">
		<tr>
			<th>#</th>
			<td><input type="text" name="bno" value="${bvo.bno }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="${bvo.title }"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="50" name="content">${bvo.content }</textarea></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${bvo.registerDate }</td>
		</tr>
	</table>
	<button type="submit">수정</button>
</form>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>