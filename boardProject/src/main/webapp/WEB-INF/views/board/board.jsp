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
<title>Board - Board Project</title>
<!-- CSS & JS -->
<jsp:include page="../inc/css.jsp"></jsp:include>
</head>
<body>
 <!-- Nav -->
 <jsp:include page="../inc/top.jsp"></jsp:include>
 <!-- Header -->
<header class="bg-dark py-5 p-4">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Board Project</h1>
            <p class="lead fw-normal text-white-50 mb-0">Board Project</p>
        </div>
 </div>
</header>
 <!-- Article -->
 <div class="py-5">
 <article class="container p-4 form-control">
 <table class="table d-sm-table table-striped table-hover" id="notice">
 <thead>
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    </thead>
    <tbody>
    <c:forEach var="boardDTO" items="${boardList }">
	<tr onclick="location.href='${pageContext.request.contextPath }/content?num=${boardDTO.num}'">
		<td>${boardDTO.num}</td>
		<td>${boardDTO.subject}</td>
		<td>${boardDTO.mem_id}</td>
		<td>${boardDTO.date}</td>
		<td>${boardDTO.readcount}</td>
	</tr>
	</c:forEach>
    </tbody>
</table>

<c:if test="${!empty sessionScope.id }">
	<button class="btn btn-outline-dark" type="submit" onclick="location.href='${pageContext.request.contextPath }/writeContent'">글쓰기</button>
</c:if>


<div class="col">
<ul class="pagination justify-content-center">
	<c:choose>
		<c:when test="${ pageDTO.startPage > pageDTO.pageBlock }">
			<li class="page-item"><a class="page-link" href='${pageContext.request.contextPath }/board?pageNum=${pageDTO.startPage-pageDTO.pageBlock}' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>
		</c:when>
		<c:otherwise>
			<li class="disabled page-item"><a class="page-link" href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/board?pageNum=${i}">${i} </a></li>
	</c:forEach>

	<c:choose>
		<c:when test="${ pageDTO.endPage < pageDTO.pageCount }">
			<li class="page-item"><a class="page-link" href='${pageContext.request.contextPath }/board?pageNum=${pageDTO.startPage+pageDTO.pageBlock}' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>
		</c:when>
		<c:otherwise>
			<li class="disabled page-item"><a class="page-link" href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>
		</c:otherwise>
	</c:choose>
	</ul>
</div>
</article>


</div>
 <!-- Footer -->
 <jsp:include page="../inc/bottom.jsp"></jsp:include>
</body>
</html>