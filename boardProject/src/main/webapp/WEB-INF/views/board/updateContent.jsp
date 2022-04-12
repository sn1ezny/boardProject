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

<c:if test="${empty sessionScope.id }">
	<c:redirect url="/main"></c:redirect>
</c:if>
<!-- 게시판 -->
<article class="container px-4 px-lg-5 mt-5">
<h1>글쓰기</h1>
<!-- enctype="multipart/form-data" -->
<form class="form-control" action="${pageContext.request.contextPath }/updateContentPro" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="${boardDTO.num }">
<table class="table" id="notice">
<tr><td>이름</td>
    <td><input class="form-control" type="text" id="mem_id" name="mem_id" value="${boardDTO.mem_id }" readonly></td></tr>
<tr><td>제목</td>
    <td><input class="form-control" type="text" id="subject" name="subject" value="${boardDTO.subject }"></td></tr>
<tr><td>파일</td>
    <td><input class="form-control" type="file" id="file" name="file" value="${boardDTO.file }"></td></tr>    
<tr><td>내용</td>
    <td><textarea class="form-control" id="content" name="content" rows="10" cols="20">${boardDTO.content }</textarea></td></tr>
</table>

<button class="form-control btn btn-outline-dark m-sm-1 d-flex" type="submit">글수정</button>
<button class="form-control btn btn-outline-dark m-sm-1 d-flex" type="button" onclick="location.href='${pageContext.request.contextPath }/board'">글목록</button>
</form>

<div class="clear"></div>
<div id="page_control">

</div>
</article>
 <!-- Footer -->
 <div class="p-4">
 </div>
 <jsp:include page="../inc/bottom.jsp"></jsp:include>
 
</body>
</html>