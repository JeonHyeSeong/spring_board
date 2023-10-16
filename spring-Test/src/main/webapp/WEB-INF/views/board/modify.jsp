<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<c:set value="${BoardDTO.bvo }" var="bvo"></c:set>
<form action="/board/modify" method="post" enctype="multipart/form-data">
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
	<!-- file 표시 라인 -->
	<c:set value="${BoardDTO.flist }" var="flist"></c:set>
	<div>
		<ul>
			<!-- 파일 개수만큼 li를 추가하여 파일을 표시 타입이 1일 경우만 표시 -->
			<!-- li
				div => img 그림표시
				div => div 파일이름, 작성일자 span 크기 설정 -->
			<!-- 하나의 파일만 따와서 fvo로 저장 -->
			<c:forEach items="${flist }" var="fvo">
				<li>
					<c:choose>
						<c:when test="${fvo.file_type > 0 }">
							<div>
								<!-- /upload/year/month/day/uuid_file_name -->
								<img alt="그림없음." src="/upload/${fn:replace(fvo.save_dir,'\\','/') }/
								${fvo.uuid}_th_${fvo.file_name}">
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<!-- file 아이콘 같은 모양 값으로 넣을 수 있음. -->
							</div>
						</c:otherwise>
					</c:choose>
					<div>${fvo.file_name }</div>
					<button type="button" class="file-x" data-uuid="${fvo.uuid }">X</button>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<!-- 수정 파일 등록 라인 -->
	file : <input type="file" id="file" name="files" multiple="multiple" style="display: none">
	<button type="button" id="trigger">FileUpload</button> <br>
	<div id="fileZone">
	
	</div>
	
	<button type="submit" id="regBtn">수정</button>
</form>

<script type="text/javascript" src="/resources/js/boardModify.js"></script>
<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>