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
<title>Board Project</title>
<!-- CSS & JS -->
<jsp:include page="../inc/css.jsp"></jsp:include>
</head>
<body>
 <!-- Nav -->
 <jsp:include page="../inc/top.jsp"></jsp:include>
 <!-- Header -->
 <header class="bg-dark py-5">
     <div class="container px-4 px-lg-5 my-5">
         <div class="text-center text-white">
             <h1 class="display-4 fw-bolder">Board Project</h1>
             <p class="lead fw-normal text-white-50 mb-0">Board Project</p>
         </div>
	 </div>
 </header>
 <!-- Section -->
 <section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        
        <c:forEach begin="1" end="10" step="1">
        	<jsp:include page="../inc/item.jsp"></jsp:include>
        </c:forEach>
        
        </div>
    </div>
 </section>
 <!-- Footer -->
 <jsp:include page="../inc/bottom.jsp"></jsp:include>
 
</body>
</html>