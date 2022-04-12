<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="${pageContext.request.contextPath }/main">Board Project</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/main">Home</a></li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/board">Board</a></li>
            </ul>
            
            <c:choose>
				<c:when test="${empty sessionScope.id }">
					<form class="d-flex" action="${pageContext.request.contextPath }/login" method="get">
		                <button class="btn btn-outline-dark" type="submit">Login</button>
		            </form>
		            <form class="d-flex" action="${pageContext.request.contextPath }/join" method="get">
		                <button class="btn btn-outline-dark" type="submit">Join</button>
		            </form>
				</c:when>
				
				<c:otherwise>
					<form class="d-flex" action="${pageContext.request.contextPath }/logout" method="get">
						<button class="btn btn-outline-dark" type="submit">logout</button>
		            </form>
		            <form class="d-flex" action="${pageContext.request.contextPath }/update" method="get">
		                <button class="btn btn-outline-dark" type="submit">update</button>
	     			</form>	
				</c:otherwise>
			</c:choose>
			
        </div>
    </div>
</nav>