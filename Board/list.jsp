<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커뮤니티</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<!-- <link rel="stylesheet" href="/css/board.css" /> -->
<!-- <script src="/static/js/board.js"></script> -->
<script type="text/javascript">
$(function() {
	$("#writeBtn").click(function() {
		location.href = "${path}/board/write.do";
	});
	// 한페이지에 보여주는 데이터 선택의 이벤트 처리 -> 변경이 일어나면 처리
	$("#perPageNumSel").change(function() {
		let key = "${pageObject.key}";
		let word = "${pageObject.word}";
		// 다시 리스트 불러오기 - 전달 정보는 페이지:1, perPageNum을 선택된 값을 전달.
		location.href = "list.do?page=1&perPageNum=" + $(this).val() + "&key=" + key + "&word=" + word;
	});
	$(".dataRow").click(function(){
		var no = $(this).find(".no").text();
		var query = ${(empty pageObject)?"''":"'&page=" += pageObject.page
				+= "&perPageNum=" += pageObject.perPageNum += "'"};
		// 검색 정보 붙이기
		query += ${(empty pageObject.word)?"''":"'&key=" += pageObject.key
				+= "&word=" += pageObject.word += "'"};
		location = "view.do?no=" + no + "&inc=1" + query;
	});
});
</script>
<style type="text/css">
span.category {color: #888888;}
span.reply {color: red;}
div.top-bar {width: 900px;margin: 0 auto;display: grid;padding-bottom: 20px;grid-template-columns: 1fr 1fr 4fr 1fr;}
div.bottom-bar {width: 900px;margin: 0 auto;padding-bottom: 20px;}
div.top-bar > div:first-child {text-align: left;}
div.top-bar > div:last-child, div.bottom-bar > div:last-child {text-align: right;}
select.selectOption {width: 150px;padding-right: 10px;padding-left: 10px;min-width: 150px;margin-right:10px;}
.classStyle {color: #ff99aa;border: 1px solid #ff99aa;border-radius: 3px;}
.writeBtn {background:#ff99aa;color:#fff;border:none;position:relative;width: 150px;height:35px;font-size:1em;padding:0 2em;cursor:pointer;transition:800ms ease all;outline:none;}
.writeBtn:hover{background:#fff;color:#ff99aa;}
.writeBtn:before,
.writeBtn:after{content:'';position:absolute;top:0;right:0;height:2px;width:0;background:#ff99aa;transition:400ms ease all;}
.writeBtn:after{right:inherit;top:inherit;left:0;bottom:0;}
.writeBtn:hover:before,
.writeBtn:hover:after{width:100%;transition:800ms ease all;}
.searchBox{transform: translate(0%, 0%);height: 35px;background-color: #fff;border: 1px solid #ff99aa;border-radius: 30px;transition: 0.4s;width:40px;}
.searchBox:hover{box-shadow: 0px 0px .5px 1px #ff99aa;width: 282px;}
.searchBox:hover > .searchBtn{background-color: #fff;}
.searchBox:hover > .searchWord{width: 240px;padding: 0 6px;}
.searchBtn{width: 38px;height: 33px;background-color: #fff;border-radius: 50%;display: flex;justify-content: center;align-items: center;color: #ff99aa;}
.searchWord{display: flex;padding-top: 2px;padding: 0;width: 0px;border:none;background: none;outline: none;float: left;font-size: 1rem;line-height: 33px;transition: .4s;}
table.board {width: 900px;border-spacing: 0;margin: 0 auto;color: #333;font-size: 11pt;}
table.board th {border-top: 1px solid #ff7799;border-bottom: 1px solid #ff7799;background-color: #fffafa;height: 35px;text-align: center;}
table.board td {border-bottom: 1px solid #ffdcdc;height: 35px;}
table.board tr:last-child td {border-bottom: 1px solid #ff7799;}
table.board tr td:first-child {width: 10%;text-align: center;}
table.board tr td:nth-child(2) {width: 6%;text-align: center;}
table.board tr td:nth-child(3) {width: 50%;}
table.board tr td:nth-child(4) {width: 12%;text-align: center;}
table.board tr td:nth-child(5) {width: 12%;text-align: center;}
table.board tr td:nth-child(6) {width: 12%;text-align: center;}
.dataRow:hover {background: #eee;cursor: pointer;}
.articlePaginate {display: block;text-align: center;}
</style>
</head>
<body>
	<div class="container">
		<!-- 숨김정보 -->
		<%
		Date now = new Date();
		%>
		<%
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(now);
		%>
		<h1 style="font-size: 20px; width: 100%;">Total : ${listCnt }</h1>

		<form>
			<input name="page" value="1" type="hidden" /> <input
				name="perPageNum" value="${pageObject.perPageNum }" type="hidden" />
			<div class="top-bar">
				<select name="key" class="selectOption classStyle">
					<option value="tcw" ${(pageObject.key == "tcw")?"selected":"" }>전체</option>
					<option value="t" ${(pageObject.key == "t")?"selected":"" }>제목</option>
					<option value="c" ${(pageObject.key == "c")?"selected":"" }>내용</option>
					<option value="w" ${(pageObject.key == "w")?"selected":"" }>작성자</option>
				</select>
				
				<select id="perPageNumSel" class="selectOption classStyle">
					<c:choose>
						<c:when test="${pageObject.perPageNum == 5}">
							<option value="5" selected>5개</option>
						</c:when>
						<c:otherwise>
							<option value="5">5개</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pageObject.perPageNum == 10}">
							<option value="10" selected>10개</option>
						</c:when>
						<c:otherwise>
							<option value="10">10개</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pageObject.perPageNum == 15}">
							<option value="15" selected>15개</option>
						</c:when>
						<c:otherwise>
							<option value="15">15개</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pageObject.perPageNum == 20}">
							<option value="20" selected>20개</option>
						</c:when>
						<c:otherwise>
							<option value="20">20개</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pageObject.perPageNum == 30}">
							<option value="30" selected>30개</option>
						</c:when>
						<c:otherwise>
							<option value="30">30개</option>
						</c:otherwise>
					</c:choose>
				</select>
				<div class="searchBox selectOption classStyle">
					<input type="text" maxlength="20" class="searchWord" name="word"
						value="${pageObject.word }" placeholder="Search"
						autocomplete="off">

					<button class="searchBtn btn" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</div>
				<c:if test="${!empty login }">
				<button id="writeBtn" type="button" class="writeBtn selectOption">글쓰기</button>
				</c:if>
			</div>
		</form>
		<div class="board">
			<table class="board">
				<c:if test="${empty list }">
					<tr>
						<th colspan="6">해당하는 게시글이 없습니다.</th>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<tr>
						<th>#</th>
						<th></th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="vo" items="${list}">
						<c:choose>
							<c:when test="${vo.show == 'Y' || login.gradeNo >= 9 }">
								<tr class="board dataRow">
									<td><span class="no">${vo.no}</span></td>
									<td><span class="category">[${vo.category }]</span></td>
									<td>${vo.title }<c:if test="${vo.replyhit != 0}">
											<span class="reply"> [${vo.replyhit}]</span>
										</c:if></td>
									<td>${vo.writer }</td>
									<c:set var="today" value="<%=today%>" />
									<fmt:formatDate value="${vo.writedate}" pattern="yyyy-MM-dd"
										var="searchFormated" />
									<c:set var="todayVar" value="${searchFormated}" />
									<td><c:if test="${today == todayVar}">
											<fmt:formatDate value="${vo.writedate}" pattern="HH:mm" />
										</c:if> <c:if test="${today != todayVar}">
											<fmt:formatDate value="${vo.writedate}" pattern="yyyy.MM.dd." />
										</c:if></td>
									<td>${vo.hit}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td><span class="no">${vo.no}</span></td>
									<td></td>
									<td>삭제된 게시글 입니다.<c:if test="${vo.replyhit != 0}">
											<span class="reply"> [${vo.replyhit}]</span>
										</c:if></td>
									<td>익명</td>
									<c:set var="today" value="<%=today%>" />
									<fmt:formatDate value="${vo.writedate}" pattern="yyyy-MM-dd"
										var="searchFormated" />
									<c:set var="todayVar" value="${searchFormated}" />
									<td><c:if test="${today == todayVar}">
											<fmt:formatDate value="${vo.writedate}" pattern="HH:mm" />
										</c:if> <c:if test="${today != todayVar}">
											<fmt:formatDate value="${vo.writedate}" pattern="yyyy.MM.dd." />
										</c:if></td>
									<td>${vo.hit}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<div class="articlePaginate">
			<pageObject:pageNav listURI="list.do" pageObject="${pageObject }"
			query="&key=${pageObject.key }&word=${pageObject.word }" />
		</div>
	</div>
</body>
</html>