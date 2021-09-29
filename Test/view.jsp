<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 보기</title>
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
.ex{
	margin-left: 180px;
}

</style>

<body>
<div class="container">
<h1>문제 </h1>
<ul class="list group">
		<li class="list-group-item list-group-item-success row">
			<div class="col-md-2 title_label">번호</div>
			<div class="col-md-2">${vo.no }</div>
		</li>
		<li class="list-group-item list-group-item-success row">
			<div class="col-md-2 title_label">문제</div>
			<div class="col-md-2">${vo.quiz }</div>
		</li>
		<li class="list-group-item list-group-item-success row">
			<div class="col-md-2 title_label">보기</div>
			<br>
			<c:forEach items="${testEx }" var = "vo">
			<div  class="col-md-7 ex">${vo.eno }.${vo.ex }
			</div>
			</c:forEach>
		</li>
		<li class="list-group-item list-group-item-success row">
			<div class="col-md-2 title_label">정답</div>
			<div class="col-md-2">${vo.right }</div>
		</li>
	
</ul>
		<a href = "update.do?no=${vo.no }&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}" class="btn btn-default">수정</a>
 		<a href = "delete.do?no=${vo.no }&perPageNum=${pageObject.perPageNum}" class="btn btn-default" id="deleteBtn">삭제</a>
		<a href = "list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}" class="btn btn-default">목록</a>
</div>		
</body>
</html>