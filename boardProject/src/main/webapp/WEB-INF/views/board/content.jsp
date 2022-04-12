<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta charset="UTF-8">
<title>${boardDTO.subject } - Board Project</title>
<!-- CSS & JS -->
<jsp:include page="../inc/css.jsp"></jsp:include>
</head>
<body>
 <!-- Nav -->
 <jsp:include page="../inc/top.jsp"></jsp:include>
 
 <div class="py-5">
 <article class="container p-4 form-control">
 
 <h1>Content</h1>
<table class="table">
<tr><td>글번호</td><td>${boardDTO.num }</td>
     <td>글쓴날짜</td><td>${boardDTO.date }</td></tr>
<tr><td>글쓴이</td><td>${boardDTO.mem_id }</td>
    <td>조회수</td><td>${boardDTO.readcount }</td></tr>
<tr><td>글제목</td><td colspan="3">${boardDTO.subject }</td></tr>

<c:if test="${boardDTO.file ne null}">
	<tr><td>파일</td>
    <td colspan="3">
    	<c:choose>
			<c:when test="">
				<img src="${pageContext.request.contextPath }/resources/upload/${boardDTO.file }" width="300" height="300">
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath }/resources/upload/${boardDTO.file }">${boardDTO.file }</a>
			</c:otherwise>
		</c:choose>
    </td></tr>
</c:if>

<tr><td>글내용</td><td colspan="3" style="white-space:pre">${boardDTO.content }</td></tr>
</table>

<c:if test="${!empty sessionScope.id }">
	<c:if test="${boardDTO.mem_id eq sessionScope.id }">
		<button class="btn btn-outline-dark" type="submit" onclick="location.href='${pageContext.request.contextPath }/updateContent?num=${boardDTO.num }'">글수정</button>
		<button class="btn btn-outline-dark" type="submit" onclick="location.href='${pageContext.request.contextPath }/deleteContent?num=${boardDTO.num }'">글삭제</button>
	</c:if>
</c:if>
<button class="btn btn-outline-dark" type="submit" onclick="location.href='${pageContext.request.contextPath }/board'">글목록</button>


</article>
</div>
</body>
</html>