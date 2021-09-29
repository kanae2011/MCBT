<%@page import="java.util.List"%>
<%@page import="com.webjjang.util.PageObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<meta charset="UTF-8">
<title>상품관리</title>
<style type="text/css">
	.dataRow:hover{
		background: #d9d9d9;
		cursor: pointer;
/* 		border: 3px dotted #888; */
	}
	#image_gallery, .line{
		clear: both;
	}
	.line{
		height: 20px;
	}
</style>
<script type="text/javascript">
$(function(){
	
	<c:if test="${!empty msg}">
		// 처리된 결과 보여주는 경고창 - 이미지 등록 / 삭제 후 메시지
		// - sitemesh - default_decorator.jsp에서 해결
		alert("${msg}");
	</c:if>
	
	$(".dataRow").click(function(){
// 		alert("click");
		var no = $(this).find(".no").text();
		location = "view.do?no=" + no + "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
	});
	
	// 한페이지에 보여주는 데이터 선택의 이벤트 처리 -> 변경이 일어나면 처리
	$("#sel_perPageNum").change(function(){
		// alert("값 변경");
		// 다시 리스트 불러오기 - 전달 정보는 페이지:1, perPageNum을 선택된 값을 전달.
		location = "list.do?page=1&perPageNum=" + $(this).val();
	});
});
</script>
</head>
<body>
<div class="container">
	<h1>상품관리</h1>
	<!-- 위의 내용과 간격을 넓히는 빈 줄 -->
	<div class="line"></div>
	<div id="image_gallery">
		 <div class="row">
		 	<c:forEach items="${list }" var="vo" varStatus="vs" >
		 		<!-- c:forEach 속성 중에서 varStatus="vs" => index나 count를 사용할 수 있는 객체 -->
		 		<c:if test="${(vs.index > 0) && (vs.index % 4 == 0)}">
		 			<!-- 인덱스 번호가 0이상이고 4의 배수이면 한줄(class="row")을 만든다.  -->
		 			${"</div>"} 
		 			${"<div class='row'>"} 
		 		</c:if>
		 		<!-- BootStrap Grid : 한줄은 12칸으로 나눠서 운영하는 시스템 -->
			  <div class="col-md-3 dataRow">
			    <div class="thumbnail">
			        <img src="${vo.fileName }" alt="Lights" style="width:100%; height: 350px;">
			        <div class="caption">
			          <p>[<span class="no">${vo.no }</span>] ${vo.title }</p>
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
		<div>
			<pageObject:pageNav listURI="list.do" pageObject="${pageObject }" />
		</div>
		<c:if test="${!empty login }">
			<div class="pull-left">
				<a href="write.do?perPageNum=${pageObject.perPageNum }" class="btn btn-primary">등록</a>
			</div>
		</c:if>
	</div>
</div>
</body>
</html>