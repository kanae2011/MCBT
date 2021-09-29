<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<style type="text/css">
.container { 
	border: 2px solid salmon;
	border-radius: 15px;
	font-size: 20px;
	width: 600px;
	padding: 100px 0;
	margin: 10px auto;
}

.all {
	margin: 300px auto;
}
</style>
</head>
<body>
<div class="all">
	<div class="container">
	<!-- <div class="panel panel-default" style="margin: 20px;"> -->
	<!--   <div style="font-size: 2em;">권한 오류 페이지</div> -->
	  <div>
	  	<p>
	  		요청하신 url에 대한 권한이 없습니다.
	  	</p>
		<c:if test="${!empty login }">
			당신에게는 페이지를 접근할 수 있는 권한이 없습니다.
		</c:if>
		<c:if test="${empty login }">
			로그인을 하셔야 합니다.
		</c:if>
	  	<p>
	  		오류가 지속적으로 일어나는 경우 사이트 관리자에게 연락 주세요.
	  	</p>
	  </div>
	  </div>
	  <c:if test="${empty login }">
			<a href="/member/loginForm.do" class="btn btn-default">로그인하기</a>  	
	  </c:if>
 </div>
</body>
</html>