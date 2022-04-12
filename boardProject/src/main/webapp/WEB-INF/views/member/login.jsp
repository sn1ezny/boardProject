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
<title>Login - Board Project</title>
<!-- CSS & JS -->
<jsp:include page="../inc/css.jsp"></jsp:include>
</head>
<body>
<c:if test="${! empty sessionScope.id }">
	<c:redirect url="/main"></c:redirect>
</c:if>
<!-- Nav -->
<jsp:include page="../inc/top.jsp"></jsp:include>

<!-- Login Form -->
<div class="container p-4">
 <div class="row">
  <div class="col-lg-6 offset-lg-3">
   <div class="login-form">
    <form  class="form-control" action="${pageContext.request.contextPath }/loginPro" method="post">
     <label class="form-text">아이디</label>
     <input class="form-control" type="text" name="id" placeholder="id"><br>
     <label class="form-text">비밀번호</label>
     <input class="form-control" type="password" name="pass" placeholder="pw"><br>
    
     <button class="form-control btn btn-outline-dark m-sm-1 d-flex" type="submit">Submit</button>
     <button class="form-control btn btn-outline-dark m-sm-1 d-flex" type="reset">Cancel</button> 
     <div class="switch-login">
      <a href="${pageContext.request.contextPath }/join" class="or-login">회원가입</a>
     </div>
    </form>
   </div>
  </div>
 </div>
</div>

 <!-- Footer -->
 <jsp:include page="../inc/bottom.jsp"></jsp:include>
</body>
</html>