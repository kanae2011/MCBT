<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보기등록</title>
<!-- bootstrap 라이브러리 등록 / CDN 방식 : sitemesh decoreator.jsp에서 한꺼번에 해결  -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
.ex {
	margin-left: 180px;
}

.dataRow{
	margin-top: 20px;
}

.dataRight{
	margin-top: 20px;
}

.regBtn{
	margin-top: 20px;
}
</style>

<body>
	<div class="container">
		<h1>보기등록</h1>
		<ul class="list group">
			<li class="list-group-item list-group-item-success row">
				<div class="col-md-2 title_label">번호</div>
				<div class="col-md-2">${vo.no }</div>
			</li>
			<li class="list-group-item list-group-item-success row">
				<div class="col-md-2 title_label">문제</div>
				<div class="col-md-2">${vo.quiz }</div>
			</li>
			
		</ul>
	
		<!-- 보기등록란 -->
		<form action="testReg02.do" method="post">
				<input name="no" type="hidden" value="${vo.no }">
			
			<div class="form-group">
				<label for="ex">보기 등록</label><br>
				<input name="ex" value="${exvo.ex }" size="100">
			</div>
			<button class="btn btn-primary ">등록</button>
		</form>
		
		
		<c:if test="${!empty exList }">
		<c:forEach items="${exList }" var="exvo">
			<li class="list-group-item dataRow">
				<input name="no" type="hidden" value="${vo.no }">
				<div class="form-group">
					<input name="eno" value="${exvo.eno }" readonly="readonly" size="5">
				</div>
				<div class="form-group">
					<input name="ex" value="${exvo.ex }" size="30">
				</div>
			</li>
		</c:forEach>
			<form action="testReg03.do" method="post">
				<input name="no" type="hidden" value="${vo.no }" > 
			<div class="form-group dataRight">
				<label for="right">정답</label><br>
				<input name="right" value="${vo.right }">
			</div>
			<button class="btn btn-primary regBtn">등록</button>
			</form>
		</c:if>
		
	</div>
</body>
</html>