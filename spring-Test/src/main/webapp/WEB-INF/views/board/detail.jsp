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

<table class="table table-dark table-striped">
	<tr>
		<th>#</th>
		<td>${bvo.bno }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${bvo.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${bvo.writer }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${bvo.content }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${bvo.registerDate }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${bvo.read_count }</td>
	</tr>
</table>
<a href="/board/modify?bno=${bvo.bno }"><button type="button">수정</button></a>
<a href="/board/remove?bno=${bvo.bno }"><button type="button">삭제</button></a>
<!-- comment line -->
<div>
<br>
	<!-- 댓글 작성 라인 -->
	<div>
		<span id="cmtWriter">${ses.id }</span>
		<input type="text" id="cmtText" placeholder="Add Comment...">
		<button type="button" id="cmtPostBtn">댓글 등록</button>
	</div>
	<!-- 댓글 표시 라인 -->
	<div>
		<ul id="cmtListArea">
			<li>
				<div>
					<div>Writer</div>
					Content
				</div>
				<span>reg_date</span>
			</li>
		</ul>
	</div>
</div>


<script type="text/javascript">
	const bnoVal = `<c:out value="${bvo.bno}" />`;
	const wriVal = `<c:out value="${ses.id}" />`;
	console.log(bnoVal);
</script>
<script src="/resources/js/boardComment.js"></script>
<script type="text/javascript">
getCommentList(bnoVal);
</script>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>