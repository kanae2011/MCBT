<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보기 작성 게시판</title>



<script type="text/javascript">

</script>

</head>
<body>
	<div class="container">
		<h1>보기등록</h1>
		<ul class="list group">
		
			<li class="list-group-item text-center" >
				<div class="list group" style="float:none; margin:0 auto;">번호</div>
				<div class="list group">${vo.no }</div>
			</li>
			<li class="list-group-item">
				<div class="list group">난이도</div>
				<div class="list group">${vo.lev }</div>
			</li>
			<li class="list-group-item">
				<div class="list group">문제</div>
				<div class="list group">${vo.quiz }</div>
			</li>
			
		</ul>
	
			<!-- 보기등록란 -->
		<form action="write02.do" method="post">
			<div class="form-group">
				<input name="no" type="hidden" value="${vo.no }">
			</div>
			
			<div class="form-group">
				<label for="ex">보기 등록</label><br>
				<input name="ex" value="${exvo.ex }" size="100">
			</div>
			<button class="btn btn-primary btn-xs ">등록</button>
		</form>
		
		<c:if test="${!empty exList }">
		<c:forEach items="${exList }" var="exvo">
			<li class="list-group-item dataRow">
				<input name="no" type="hidden" value="${vo.no }">
				<div class="form-group">
					<input name="eno" value="${exvo.eno }" readonly="readonly">
				</div>
				<div class="form-group">
					<input name="ex" value="${exvo.ex }">
				</div>
			</li>
		</c:forEach>
		<form action="write03.do" method="post">
				<input name="no" type="hidden" value="${vo.no }">
			<div class="form-group dataRight">
				<label for="right">정답</label><br>
				<input name="right" value="${vo.right }">
			</div>
			<button class="btn btn-primary btn-xs ">등록</button>
			</form>
		
		</c:if>
	</div>
</body>
</html>