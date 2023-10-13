<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	padding: 20px;
}
h1{
	text-align: center;
	font-size: 40px;
	font-weight: 700;
}
.sel{
	width: 300px;
}
.search{
	width: 500px;
}
.con{
	display : flex;
	justify-content: center;
}
.nav{
	display: flex;
	justify-content: center;
}
.sbtn{
	width: 150px;
}
</style>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<!-- 검색 라인 -->
	<div class="container-fluid con">
		<form action="/board/list" method="get" class="d-flex">
			<c:set value="${ph.pgvo.type }" var="typed"></c:set>
			<select name="type" class="form-select sel">
				<option ${typed == null? 'selected' : ''}>Choose</option>
				<option value="t" ${typed eq 't'? 'selected' : ''}>Title</option>
				<option value="w" ${typed eq 'w'? 'selected' : ''}>Writer</option>
				<option value="c" ${typed eq 'c'? 'selected' : ''}>Content</option>
				<option value="tw" ${typed eq 'tw'? 'selected' : ''}>Title+Writer</option>
				<option value="tc" ${typed eq 'tc'? 'selected' : ''}>Title+Content</option>
				<option value="wc" ${typed eq 'wc'? 'selected' : ''}>Writer+Content</option>
				<option value="twc" ${typed eq 'twc'? 'selected' : ''}>Title+Writer+Content</option>
			</select>
			<input type="text" class="form-control me-2 search" name="keyword" value="${ph.pgvo.keyword }" placeholder="검색어를 입력하세요..">
			<input type="hidden" name="pageNo" value="${ph.pgvo.pageNo }">
			<input type="hidden" name="qty" value="${ph.pgvo.qty }">
			<button type="submit" class="btn btn-outline-success sbtn">검색</button>
		</form>
	</div>

<table class="table table-dark table-striped">
	<thead>
		<tr>
			<th>#</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>댓글개수</th>
			<th>파일개수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="bvo">
			<tr>
				<td>${bvo.bno }</td>
				<td><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></td>
				<td>${bvo.writer }</td>
				<td>${bvo.registerDate }</td>
				<td>${bvo.read_count }</td>
				<td>${bvo.commentCount }</td>
				<td>${bvo.fileCount }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- 페이지네이션 라인 -->
	<nav aria-label="Page navigation example" class="nav">
		<ul class="pagination">
		    <c:if test="${ph.prev }">
				   <li class="page-item">
					    <a class="page-link" href="/board/list?pageNo=${ph.startPage-1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">Previous</a>
				   </li>
			</c:if>
		    
			<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
				   <li class="page-item">
					    <a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
				   </li>
			</c:forEach>
		    
		    <c:if test="${ph.next }">
				 <li class="page-item">
				    <a class="page-link" href="/board/list?pageNo=${ph.endPage+1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">Next</a>
				 </li>
			</c:if>
  		</ul>
	</nav>

<script type="text/javascript">
	const isOk = `<c:out value="${isOk}" />`;
	console.log(isOk);
	if(isOk == 1){
		alert('삭제완료!!');
	}
</script>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>