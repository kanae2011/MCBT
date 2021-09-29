<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.title }</title>
<!-- BootStrap 라이브러리 등록 - CDN 방식 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<!-- reply Model JS 포함 -->
<script type="text/javascript" src="/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function () {

	// 전역 변수 선언 - $(function(){~~}); -33번 줄 안에 선언된 함수에서는 공통으로 사용 가능
	var no = ${vo.no};
	console.log("JS Reply List no : " + no);
	var repPage = 1;
	var repPerPageNum = 5;
	var replyUL = $(".replyBox1");

	// 글보기를 하면 바로 댓글 리스트 호출
	showList();

	// function shewList() - no, page, perPageNum : 전역변수로 선언되어 있으므로 변수명 사용
	function showList() {
		// replyService 객체는 reply.js에서 선언하고 있다.
		replyService.list(
		// 서버에 넘겨 줄 데이터
		{no:no, repPage:repPage, repPerPageNum:repPerPageNum},
		// 성공했을 때의 함수. data라는 이름으로 list가 들어온다.
		//	 				function(list){
		function(data) {
			// list 데이터 확인
			// data 데이터 확인 -> JSON 데이터 : [object Object]
			//   - data.list / data.pageObject
			// 문자열로 만들어서 데이터 표시 - 눈으로 확인
			//	 					alert(data);
			//	 					alert(JSON.stringify(data));
			var list = data.list;
			//	 					return; // 데이터만 확인하고 처리는 하지 않도록 하기 위해서

			//	 					alert(list);
			var str = "";
			// li 태그 만들기-----------------
			// 데이터가 없을 때의 처리
			if (!list || list.length == 0) {
				//	 						alert("데이터 없음");
			} else { // 데이터가 있을 때의 처리
				// 	 						alert("데이터 있음");
				for (var i = 0; i < list.length; i++) {
					console.log(list[i]);
					// tag 만들기 - 데이터 한개당 li tag 하나가 생긴다.
					str += "<hr>";
					str += "<tr data-rno='"+ list[i].rno +"'>";
					str += "<div class='commentWriter'><strong>"+list[i].replyer+"</strong></div>";
					str += "<div><p><span class='commentContent'>"+list[i].replyContent+"</span></p></div>";
					str += "<div><span><small class='text-muted commentDate'>"+replyService.displyTime(list[i].replyDate)+"</small></span></div>";
// 	    			str += "<div class='text-right'>";
// 	    			str += "<button class='btn btn-default btn-xs replyUpdateBtn'>수정(미구현)</button>";
// 	    			str += "<button class='btn btn-default btn-xs replyDeleteBtn'>삭제(미구현)</button>";
// 	    			str += "</div>";
					str += "</tr>";
				}
			}
			replyUL.html(str); // 댓글 리스트 데이터를 표시
			// 댓글의 페이지 네이션 표시.
			var pageObject = data.pageObject; // 서버에서 넘어오는 데이터에서 pageObject를 꺼낸다.
			var str = ajaxPage1(pageObject);
// 			alert(str);
			$("#reply_nav").html(str);
		} // function(data) 의 끝
		);
	} // showList()의 끝
	function ajaxPage1(pageObject){
		var str = ""; // tag를 만들어서 저장할 변수
		
		// startPage ~ endPage 버튼 만들기
		for(i = pageObject.startPage ; i <= pageObject.endPage; i++){
		  	str += "<li data-page='" + i + "' class='reply_nav_li ";
		  	if(pageObject.page == i)
		  		str += "active";
		  	str += "'>";
		  	if(pageObject.page == i)
		  		str += "<a onclick='return false'>"+ i +"</a>";
		  	else 
		  		str += "<a class='move' data-toggle='tooltip' data-placement='top'>" + i + "</a>";
		  	str += "</li>";
		}
		return str;
	}
	// 댓글의 페이지 번호 클릭 이벤트 - 태그가 나중에 나온다. 그래서 on()
	// $(원래 있었던 객체 선택).on(이벤트, 새로 만들어진 태그, 실행함수) -> 이벤트의 전달
	$("#reply_nav").on("click", ".reply_nav_li", function() {
		//	 			alert("댓글 페이지네이션 클릭");
		// this => li / move 클래스 li-a에 작성해 놨다.
		if ($(this).find("a").hasClass("move")) {
			repPage = $(this).data("page");
			//	 				alert(repPage + " 페이지로 이동시킨다.");
			showList();
		}
		return false;
	});
	var textEle = $('textarea');
	textEle.on('keyup', function() {
		adjustHeight();
		
		if ($(this).val().length > 300) {
			alert("300자까지 작성할 수 있습니다");
			$(this).val($(this).val().substring(0, 300));
		}
	});
	function adjustHeight() {
		  var textEle = $('textarea');
		  textEle[0].style.height = 'auto';
		  var textEleHeight = textEle.prop('scrollHeight');
		  textEle.css('height', textEleHeight);
	};
	$(document).on('click','#replyWriteBtn',function(){
		var reply = {};
		reply.no = ${vo.no};
		reply.replyer = $("#replyer").val();
		reply.replyContent = $("#replyContent").val();
// 		alert(reply.replyer);
		replyService.write(reply, function(result){
			alert(result);
			showList();
		});
	});
	$("#replyWriteBtn").click(function() {
	});
	
}); // $(function(){~}) 의 끝.
</script>

<style type="text/css">

body {position: relative;}
div {display: block;}
td {width: 1080px;}
span.category {color: #888888;}
span.reply {color: red;}
/* 글전체 박스 */
.contentBox {
	width: 100%;
	padding: 29px 29px 0;
	border: 1px solid #ebecef;
	border-radius: 6px;
	padding-bottom: 30px;
	word-break: break-all;
}
/* 댓글리스트 */
.replyBox1 { 
	width: 100%;
	border-radius: 6px;
	padding-bottom: 30px;
	word-break: break-all;
}
/* 댓글 리스트 padding */
.commentWriter {
	margin-bottom: 4px;
}
/* 글밑 버튼 오른쪽 배치 */
div.contentBtn {
	padding-top: 50px;
}
/* 댓글등록 버튼 */
div.replyBtn {
	margin: auto;
	text-align: right;
	width: 100%;
}
.replyBox2 {
    border: 1px solid #ebecef;
}
/* 글정보 */
.header {
	position: relative;
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #ebecef;
}
.title {
	font-size: 26px;
	padding-bottom: 20px;
	font-weight: 700;
}

.writer {
	padding-bottom: 5px;
	font-size: 13px;
	font-weight: 700;
}

.content {
	position: relative;
	margin-bottom: 20px;
	padding-top: 20px;
	padding-bottom: 20px;
}
/* 페이징 */
.articlePaginate {
	display: block;
	text-align: center;
}
.articlePaginate > li > a {
	float: none;
}

/* 댓글입력폼 */
input[type=text] {
    float: left;
    width: 100%;
    padding: 12px 16px;
    border: 1px solid #ebecef;
    font-size: 0.875em;
    color: #777;
}
.replyContent {
    overflow-y: auto;
    display: block;
    resize: none;
    width: 100%;
    padding: 12px 16px;
    border: 1px solid #ebecef;
    font-size: 0.875em;
    color: #777;
    overflow: hidden;
}
</style>

</head>
<body>
	<c:choose>
		<c:when test="${vo.show == 'Y' || login.gradeNo >= 9 }">
			<div class="container" style="margin-top: 50px;">
				<div class="contentBox">
					<div class="header">
						<h3 class="title">${vo.title }</h3>
						<h1 class="writer">${vo.writer }</h1>
						<span class="date" style="display: inline;"> <fmt:formatDate value="${vo.writedate }" pattern="yyyy.MM.dd HH:mm" /></span>
						<span class="hit">조회 ${vo.hit }</span>
					</div>
					<div class="content">${vo.content }</div>
					<div id="reply_cnt"><span class="box"><i class="fa fa-comments fa-fw"></i>댓글 <strong>${vo.replyhit }</strong></span></div>
					<!-- 댓글 목록 영역 -->
					<ul class="replyBox1" style="padding-left: 0px;"></ul>
					<c:if test="${!empty login }">
					<div class="replyBox2">
					<input type="text" id="replyer" name="replyer" placeholder="이름" autocomplete="off" maxlength="8" value="${login.id }" readonly="readonly"/>
<!-- 					<input type="password" id="password" name="password" placeholder="비밀번호" autocomplete="off" maxlength="8" /> -->
					<textarea id="replyContent" name="replyContent"  class="replyContent" onkeyup="adjustHeight();" 
				 	placeholder="댓글을 남겨보세요" rows="4" maxlength="300"></textarea></div>
					<div class="replyBtn">
					<button class="btn btn-default" id="replyWriteBtn">등록</button>
					</div>
					</c:if>
					<c:if test="${vo.replyhit > 5}">
						<div class="articlePaginate">
							<ul class="pagination" id="reply_nav"></ul>
						</div>
					</c:if>
				</div>
				<div class="contentBtn">
					<c:if test="${login.id == vo.writer || login.gradeNo >= 9 }">
						<a class="btn btn-default" href="update.do?no=${vo.no }">글수정</a>
						<a class="btn btn-default" href="delete.do?no=${vo.no }">글삭제</a>
					</c:if>
					<a class="btn btn-default"
						href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum }">목록</a>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<!-- show가 n이면 -->
			삭제된 게시글 입니다.
		</c:otherwise>
	</c:choose>
</body>
</html>