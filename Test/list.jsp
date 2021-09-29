<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 목록</title>

<style type="text/css">
.dataRow:hover{
	cursor : pointer;
	background: #d8f3eb;
}
</style>
<script type="text/javascript">
$(function() {
	//문제 보기로 이동함수
	$(".dataRow").click(function () {
		var no = $(this).find(".no").text();
		//페이지 정보 붙이기
		var query = ${(empty pageObject)?"''":"'&page=" += pageObject.page 
				+= "&perPageNum=" += pageObject.perPageNum += "'"};
		location = "view.do?no=" + no + query  ;		
		
	});
	
// 	//레벨 이동 함수
// 	$("#top").click(function () {
// 		location = "list.do?lev=1";
// 	});
// 	$("#mid").click(function () {
// 		location = "list.do?lev=2";
// 	});
// 	$("#bottom").click(function () {
// 		location = "list.do?lev=3";
// 	});

});

</script>
</head>
<body>
<div class="container">
<h1>
<a href="list.do">문제 목록</a>
</h1>
	<div>
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}&lev=top"
		${lev == "top"?"Active":""} class="btn btn-primary" style = "font-size=13px;">
		상
		</a>
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}&lev=mid"
		${lev == "mid"?"Active":""} class="btn btn-primary" style = "font-size=13px;">
		중
		</a>
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}&lev=bottom"
		${lev == "bottom"?"Active":""} class="btn btn-primary" style = "font-size=13px;">
		하
		</a>
	
	</div>


<!-- <div id="btn_group" style="margin: 20px;"> -->
<!-- 			<button id="top" > -->
<!-- 				<span>상</span> -->
<!-- 			</button> -->
<!-- 			<button id="mid"> -->
<!-- 				<span>중</span> -->
<!-- 			</button> -->
<!-- 			<button id="bottom"> -->
<!-- 				<span>하</span> -->
<!-- 			</button> -->
			
<!-- 		</div> -->
<table class="table">
	<tr>
		<th>번호</th>
		<th>문제</th>
	</tr>
	
	<c:forEach items="${list }" var="vo">
	<tr class="dataRow">
		<th class="no">${vo.no }</th>
		<th>${vo.quiz }</th>
	</tr>
		</c:forEach>

</table>
<!-- a tag, js : location, 주소 입력:get 방식으로 넘김 / post방식은 지정을 꼭 해주어야 함 -->
		<a href=testReg01.do?perPageNum=${pageObject.perPageNum} class="btn btn-default">등록</a>
		<div>
		<pageObject:pageNav listURI="list.do" pageObject="${pageObject }" query="&lev=${param.lev }" />	
		</div>

</div>
</body>
</html>