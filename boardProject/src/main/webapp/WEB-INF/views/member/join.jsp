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
<title>Join - Board Project</title>
<!-- CSS & JS -->
<jsp:include page="../inc/css.jsp"></jsp:include>
<jsp:include page="../inc/postcode.jsp"></jsp:include>

<script type="text/javascript">
 	$(document).ready(function() {
		$('#join').submit(function() {
			if ($('#id').val()=="") {
				alert('아이디를 입력해주세요.');
				$('#id').focus();
				return false;
			}
			if ($('#pass').val()=="") {
				alert('비밀번호 입력해주세요.');
				$('#pass').focus();
				return false;
			}
			if ($('#pass').val() != $('#pass2').val()) {
				alert('비밀번호 틀림 입력해주세요.');
				$('#pass2').focus();
				return false;
			}
			if ($('#name').val()=="") {
				alert('이름을 입력해주세요.');
				$('#name').focus();
				return false;
			}
			if ($('#email').val()=="") {
				alert('이메일을 입력해주세요.');
				$('#email').focus();
				return false;
			}
			
		});	
		
		$('#idbtn').click(function(){
			$.ajax({
				url:'${pageContext.request.contextPath }/userCheck',
				data:{"id":$('#id').val()},
				success:function(rdata){
					if(rdata=='iddup'){
						rdata="아이디 중복";
					}else{
						rdata="아이디 사용가능"
					}
					$('#idmsg').html(rdata);
				}
			});
		});

		
 	});
 </script>
 
</head>
<body>
<c:if test="${! empty sessionScope.id }">
	<c:redirect url="/main"></c:redirect>
</c:if>
<!-- Nav -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="container p-4">
<div class="row">
<div class="col-lg-6 offset-lg-3">
 <form class="form-control" id="join" action="${pageContext.request.contextPath }/joinPro" name="fr" method="post">
  <label class="form-text">아이디</label>
  <input class="form-control" id="id" type="text" name="id" placeholder="id"><div id="idmsg">아이디 중복체크 해주세요</div><input type="button" value="중복확인" id="idbtn">
  <br>
  <label class="form-text">비밀번호</label>
  <input class="form-control" id="pass" type="password" name="pass" placeholder="pw"><br>
  <label class="form-text">비밀번호 확인</label>
  <input class="form-control" id="pass2" type="password" name="pass2" placeholder="pw2"><br>
  
  <label class="form-text">이름</label>
  <input class="form-control" id="name" type="text" name="name" placeholder="name"><br>
  
  <label class="form-text">이메일</label>
  <input class="form-control" id="email" type="email" name="email" placeholder="email@aa.aa"><br>
  
  <label class="form-text">우편번호</label>
  <input class="form-control" id="sample4_postcode" type="text" name="postcode" placeholder="postcode"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
  <label class="form-text">주소</label>
  <input class="form-control" id="sample4_roadAddress" type="text" name="address" placeholder="addr"><br>
  <label class="form-text">상세주소</label>
  <input class="form-control" id="sample4_extraAddress" type="text" name="detail_address" placeholder="detaddr"><br>
  
  <button class="form-control btn btn-outline-dark m-sm-1" type="submit">Submit</button>
  <button class="form-control btn btn-outline-dark m-sm-1" type="reset">Cancel</button> 
 </form>
 </div>
</div>
</div>

 <!-- Footer -->
 <jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>