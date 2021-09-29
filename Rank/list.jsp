<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 2px solid #ffcc99;
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #eeeeee;
}
</style>
<meta charset="UTF-8">
<title>순위게시판</title>
<style type="text/css">
#image_gallery {
	margin:20px;
	padding-right: 30px;
	padding-bottom: 50px;
    padding-left: 440px;
    background-color: eee;
    color: white;
	}

#ta{
	padding-top: 50px;
	padding-right: 30px;
	padding-bottom: 50px;
    padding-left: 80px;
	}

.line {
	clear: both;
	height: 20px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#list_month").change(function(){
		location = "list.do?month=" + $(this).val();
	});
	$("#list_lev").change(function(){
// 			location = "list.do?date=" + date + "&lev=" + $(this).val();
		location = "list.do?lev=" + $(this).val();
	});
// 	var sMonth = 1;
// 	var eMonth = 12;
	
// 	var strMonth = "";
	
// 	for(var i=sMonth; i<=eMonth; i++) {
// 		strMonth +="<option value="+i+">"+i+"</option>";
// 	}
// 	document.getElementById("month").innerHTML = strMonth;
});
</script>
</head>
<body>
<h1>순위게시판</h1>
<div style="padding: 10px;">
	<div class="pull-right form-inline">
		<label>난이도</label>
			<select class="form-control" id="list_lev">
				<option value="">선택</option>
				<option ${(lev == top)?"":"" } value="top">상</option>
				<option ${(lev == mid)?"":"" } value="mid">중</option>
				<option ${(lev == bottom)?"":"" } value="bottom">하</option>
			</select>
	</div>
</div>

<div class="pull-left form-inline">
	<input type="month" id="list_month">
</div>

<!-- 	<select class="pull-left form-inline" id="month" name="month"></select> -->
<div class="line"></div>
<table class="container" style="font-family: CookieRun-Regular;">
	<tr>
<!-- 		<th>rno</th> -->
		<th>순위</th>
<!-- 		<th>no</th> -->
<!-- 		<th>lev</th> -->
		<th>아이디</th>
		<th>점수</th>
		<th>횟수</th>
		<th>난이도</th>
	</tr>
	<c:forEach items="${list }" var="vo" varStatus="status">
		<tr>
<%-- 			<c:forEach var="i" begin="1" end="10" varStatus="loop"> --%>
<%-- 			<c:if test="${loop.first }"> --%>
<%-- 			<td><c:out value = "${i }"/><p><td> --%>
<%-- 			</c:if> --%>
<%-- 			</c:forEach> --%>
<%-- 			<td>${vo.no }</td> --%>
<%-- 			<td>${vo.lev }</td> --%>
			<td>${status.count }</td>
			<td>${vo.id}</td>
			<td>${vo.score}0</td>
			<td>${vo.turn}</td>
			<td>${vo.lev}</td>
		</tr>
	</c:forEach>
</table>
<div class="line"></div>
	<div id="image_gallery">
	 <div class="row" id="tn">
	 	<c:forEach items="${ilist }" var="vo" varStatus="vs" >
	 		<!-- c:forEach 속성 중에서 varStatus="vs" => index나 count를 사용할 수 있는 객체 -->
	 		<c:if test="${(vs.index > 0) && (vs.index % 3 == 0)}">
	 			<!-- 인덱스 번호가 0이상이고 4의 배수이면 한줄(class="row")을 만든다.  -->
	 			${"</div>"} 
	 			${"<div class='row'>"} 
	 		</c:if>
	 		<!-- BootStrap Grid : 한줄은 12칸으로 나눠서 운영하는 시스템 -->
		  <div class="col-md-3 dataRow">
		    <div class="thumbnail">
		        <img src="${vo.fileName }" alt="Lights" style="width:150%; height: 350px;">
		        <div class="caption">
		          <p>[${vo.title }]</p>
		          <div class="row" style="padding : 0 15px;">
			          <div class="pull-left">${vo.id }</div>
			          <div class="pull-right">
			          	<fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd" />
			          </div>
		          </div> 
		        </div>
		    </div>
		  </div>
		  <!-- 썸네일 종료 -->
	  </c:forEach>
	</div>
</div>
<div class="line"></div>
<c:if test="${login.gradeNo == 9}">
	<div style=" margin: 40px;" class="pull-left">
		<a href="/image/list.do" class="btn btn-primary">관리</a>
	</div>
</c:if>
</body>
</html>