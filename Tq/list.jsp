<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제출제게시판 리스트</title>

<style type="text/css">

body{ 
font-size: large; 
}

.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(function() {
	
	${(empty msg)?"":"alert('"+= msg +="');"}
	
	$(".dataRow").click(function(){
		var no = $(this).find(".no").text();
		var query = ${(empty pageObject)?"''":"'&page=" += pageObject.page += "&perPageNum=" += pageObject.perPageNum += "'"};
		// 검색 정보 붙이기
		query += ${(empty pageObject.word)?"''":"'&key=" += pageObject.key
				+= "&word=" += pageObject.word += "'"};
		location = "view.do?no=" + no + query;
	});
});
</script>

</head>
<body>
<div class="container">
	<h1>문제 출제 게시판</h1>
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
	
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}&accept=대기"
		${accept == "대기"?"Active":""} class="btn btn-primary" style = "font-size=13px;">
		대기
		</a>
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}&accept=승인"
		${accept == "승인"?"Active":""} class="btn btn-primary" style = "font-size=13px;">
		승인
		</a>
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}&accept=거절"
		${accept == "거절"?"Active":""} class="btn btn-primary" style = "font-size=13px;">
		거절
		</a><div><br/></div>
	</div>
	<form>
	<input name="page" value="${pageObject.page }" type="hidden" />
	<input name="perPageNum" value="${pageObject.perPageNum }" type="hidden" />
	  <div class="input-group">
	  <span class="input-group-addon">
	  	<select name="key">
	  		<option value="t" ${(pageObject.key == "t")?"selected":"" }>문제</option>
	  		<option value="w" ${(pageObject.key == "w")?"selected":"" }>작성자</option>
	  		<option value="tw" ${(pageObject.key == "tw")?"selected":"" }>문제+작성자</option>
	  	</select>
	  </span>
	    <input type="text" class="form-control" placeholder="Search"
	    name="word" value="${pageObject.word }">
	    <div class="input-group-btn">
	      <button class="btn btn-default" type="submit">
	        <i class="glyphicon glyphicon-search"></i>
	      </button>
	    </div>
	  </div>
	</form>
	<ul class="list-group">
		<c:if test="${empty list }">
			<li class="list-group-item">
				데이터가 존재하지 않습니다.
			</li>
		</c:if>
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="vo">
				<li class="list-group-item dataRow">
					<div class="col-12">
						<span class="no">${vo.no }</span>.
						${vo.quiz }
						<c:if test="${vo.accept == '대기' }">
							<div class="col-3 label label-default pull-right" style="width: 5em; height: 2em; align-content: center; padding-top: 0.5em; margin-top: 1em;"><span style="padding-top: 3em; ">${vo.accept }</span></div>
						</c:if>
						<c:if test="${vo.accept == '승인' }">
							<div class="col-3 label label-primary pull-right"style="width: 5em; height: 2em; align-content: center; padding-top: 0.5em; margin-top: 1em;"><span style="padding-top: 3em; ">${vo.accept }</span></div>
						</c:if>
						<c:if test="${vo.accept == '거절' }">
							<div class="col-3 label label-danger pull-right"style="width: 5em; height: 2em; align-content: center; padding-top: 0.5em; margin-top: 1em;"><span style="padding-top: 3em; ">${vo.accept }</span></div>
						</c:if>
					</div>
					${vo.id }(<fmt:formatDate value="${vo.writeDate }"/>) - 난이도: ${vo.lev }
				</li>
			</c:forEach>
		</c:if>
	</ul>
<%-- 	<c:if test="${login.gradeNo == 9}"> --%>
	<!-- a tag, js : location, 주소 입력 : get 방식으로 넘어 간다. post방식 꼭 지정을 해야 한다. -->
	<a href = "write.do?perPageNum=${pageObject.perPageNum }" class="btn btn-default">글쓰기</a>
<%-- 	</c:if> --%>
	<div class="articlePaginate">
		<pageObject:pageNav listURI="list.do" pageObject="${pageObject }" 
		query="&key=${pageObject.key }&word=${pageObject.word }"/>
	</div>
</div><div><br/></div>
</body>
</html>