<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:set var="path" value="${pageContext.request.contextPath}" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원뷰</title>
<!-- BootStrap 라이브러리 등록 - CDN 방식 -->
<script type="text/javascript">
$(document).ready(function (){

	var id = ${vo.id};
	console.log("member id " + id);
});
$(function(){
	$("#updateBtn").click(function(){
		location = "updateForm.do";
	});
// 	$("#writeBtn").click(function(){
// 		location = "Form.do";
// 	});
	$("#deleteBtn").click(function(){
		location = "deleteForm.do";
});
	$("#mainBtn").click(function(){
		location = "/main/main.do";
	});
});
</script>
</head>
<body>
<div id="wrap">
	<div id="container" width="25px">
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" class="form-control" readonly="readonly" value="${vo.id }">
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" class="form-control" readonly="readonly" value="${vo.name }">
			</div>
			<div class="form-group">
				<label for="alias">닉네임</label>
				<input type="text" class="form-control" readonly="readonly" value="${vo.alias }">
			</div>
			<div class="form-group">
				<label for="gender">성별</label><br>
				<input type="tel" class="form-control" readonly="readonly" value="${vo.gender }">
			
			</div>
			<div class="form-group">
				<label for="birth">생년월일</label><br>
					<input type="datetime" class="form-control" readonly="readonly" value='${(!empty vo.birth) ? vo.birth.split("-")[0] : "" }'>
					<input type="datetime" class="form-control" readonly="readonly" value='${(!empty vo.birth) ? vo.birth.split("-")[1] : "" }'>
					<input type="datetime" class="form-control" readonly="readonly" value='${(!empty vo.birth) ? vo.birth.split("-")[2] : "" }'>
			</div>
			<div class="form-group">
				<label for="tel">전화번호</label><br>
					<input type="datetime" class="form-control" readonly="readonly" value='${(!empty vo.tel) ? vo.tel.split("-")[0] : "" }'>
					<input type="datetime" class="form-control" readonly="readonly" value='${(!empty vo.tel) ? vo.tel.split("-")[1] : "" }'>
					<input type="datetime" class="form-control" readonly="readonly" value='${(!empty vo.tel) ? vo.tel.split("-")[2] : "" }'>
			</div>
			<div class="form-group">
				<label for="email">이메일</label>
				<input type="text" class="form-control" readonly="readonly" value="${vo.email }">
			</div>
				<button id="updateBtn" class="updateBtn">내 정보 수정</button>
				<button id="deleteBtn" class="deleteBtn">회원 탈퇴</button>
				<button id="mainBtn" class="mainBtn">메인으로 돌아가기</button>
	</div>
</div>
</body>
</html>