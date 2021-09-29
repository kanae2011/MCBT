<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출제 문제 보기</title>

<!-- Awesome 4 icons lib : class="fa~ -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- util JS 포함 -->
<script type="text/javascript" src="/js/util.js"></script>

<!-- Reply Module JS 포함 -->
<script type="text/javascript" src="/js/reply.js"></script>

<style type="text/css">
body {
	font-size: large;
}

.title_label {
	border: 1px dotted #ddd;
}

ul.chat {
	list-style: none;
}

ul.chat>li {
	margin-bottom: 15px;
}

 pre {
 	 font-family: 'CookieRun-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
 }
</style>

<script type="text/javascript">
// alert("aaa" + 10);

$(function(){
	// 모달 안에 삭제 버튼 이벤트
	$("#modal_deleteBtn").click(function(){
		$("#modal_form").submit();
	});
	
	// 댓글 처리 JS 부분
	console.log("==================================");
	console.log("JS Reply List Test");
	
	// 전역 변수 선언 - $(function(){~~}); 36번줄 안에 선언된 함수에서는 공통으로 사용 가능
	var no = ${vo.no};
	console.log("JS Reply List no : " + no);
	var repPage = 1;
	var repPerPageNum = 5;
	var replyUL = $(".chat");
	
	// 글보기를 하면 바로 댓글 리스트 호출
	showList();
	
	// function showList() - no, page, perPageNum : 전역변수로 선언되어 있으므로 변수명 사용
	function showList(){
		// replyService 객체는 reply.js에서 선언하고 있다.
		replyService.list(
			// 서버에 넘겨줄 데이터
			{no:no, repPage:repPage, repPerPageNum:repPerPageNum},
			// 성공했을 때의 함수. data라는 이름으로 list가 들어온다.
			// function(list){
			function(data){
				// list 데이터 확인
				// data 데이터 확인 -> JSON 데이터 : [object Object]
				//   - data.list / data.pageObject
				// 문자열로 만들어서 데이터 표시 - 눈으로 확인
//				alert(data);
//				alert(JSON.stringify(data));
// 				return; // 데이터만 확인하고 처리는 하지 않도록 하기 위해서

				var list = data.list;
				// alert(list);
				var str = "";
				// li 태그 만들기----------------------------
				// 데이터가 없을 때의 처리
				if(!list || list.length == 0){
					// alert("데이터 없음");
					str += "<li>데이터가 존재하지 않습니다.</li>"
				} else{ // 데이터가 있을 때의 처리
					// alert("데이터 있음");
				for(var i = 0; i < list.length; i++){
					console.log(list[i]);
					// tag 만들기 - 데이터 한개당 li tag 하나가 생긴다.
					str += "<li class='left clearfix' data-rno='"+ list[i].rno +"'>";
					str += "<div>";
					str += "<div class='header'>";
					str += "<strong class='primary-font replyWriterData'>" + list[i].id + "</strong>";
					str += "<small class='pull-right text-muted'>" 
							+ replyService.displayTime(list[i].writeDate)
							+ "</small>";
					str += "</div>";
					str += "<p><pre style='background:none;' class='primary-font replyContentData'>" + list[i].content + "</pre></p>";
					str += "<div class='text-right'>";
					str += "<button class='btn btn-default btn-xs replyUpdateBtn'>수정</button>";
					str += "<button class='btn btn-default btn-xs replyDeleteBtn'>삭제</button>";
					str += "</div>";
					str += "</div>";
					str += "</li>";
					}
				}
				replyUL.html(str);// 댓글 리스트 데이터를 표시
				// 댓글의 페이지 네이션 표시.
				var pageObject = data.pageObject; // 서버에서 넘어오는 데이터에서 pageObject를 꺼낸다.
				var str = ajaxPage(pageObject);
//					alert(str);
				$("#reply_nav").html(str);
			} // function(data) 의 끝
		);
	} // showList()의 끝
	
	// 댓글 모달창의 전역 변수
	var replyModal = $("#replyModal");
	
	// 댓글 등록 버튼 이벤트 처리 : 댓글의 모달창 정보 조정과 보이기 --------------------------------
	$("#writeReplyBtn").click(function(){
		// alert("댓글등록");
		
		// 댓글 모달 창의 제목 바꾸기
		$("#replyModalTitle").text("댓글작성");
		
		// 작업할 데이터의 입력란을 보이게 안보이게
		$("#replyModal .form-group").show();
		$("#replyRnoDiv").hide();
		$("#replyNoDiv").hide();
		$("#replyIdDiv").hide();
		
		// 작업할 버튼을 보이게 안보이게
		var footer = $("#replyModal .modal-footer");
		footer.find("button").show();
		footer.find("#replyModalUpdateBtn, #replyModalDeleteBtn").hide();
		
		
		// reply > Form input 데이터 지우기 : input 중에서 id="replyNo"는 제외시킨다. not
		replyModal.find("textarea").val("");
		
		
		
		replyModal.modal("show");
	});
	
	// 댓글 모달창의 등록 버튼에 대한 이벤트 처리 - 입력된 데이터를 가져와서 JSON 데이터 만들기 - 서버에 전송
	$("#replyModalWriteBtn").click(function(){
		
		var id = $("#replyId").val();
		
		// alert(id);
		
		var reply = {};
		reply.no = $("#replyNo").val();
		reply.content = $("#replyContent").val();
		reply.id = id;
		// reply.perPageNum = repPerPageNum;
	// alert(reply);
	// alert(JSON.stringify(reply));
		
		// ajax를 이용한 댓글 등록 처리
		replyService.write(reply,
				// 성공했을때의 처리 함수
				function(result){
					alert(result);
					replyModal.modal("hide");
					showList();
			}
		);	
	});
	
	// 댓글 수정 폼 : 모달 (replyModal )----------------------------------
	$(".chat").on("click", ".replyUpdateBtn",function(){
		// alert("댓글 수정");
		// 모달창 제목 바꾸기
		$("#replyModalTitle").text("댓글 수정");
		
		// 작업할 데이터의 입력란을 보이게 안보이게
		$("#replyModal .form-group").show();
		$("#replyRnoDiv").hide();
		$("#replyNoDiv").hide();
		$("#replyIdDiv").hide();
		
		// 작업할 버튼을 보이게 안보이게
		var footer = $("#replyModal .modal-footer");
		footer.find("button").show();
		footer.find("#replyModalWriteBtn, #replyModalDeleteBtn").hide();
		
		// 데이터 수집
		// 전체 데이터를 포함하고 있는 태그 : li
		var li = $(this).closest("li");
		
		// html tag 안에 속성으로 data-rno="2" 값을 넣어 둔것은 obj.data("rno")로 찾아서 쓴다.
		var rno = li.data("rno");
		var content = li.find(".replyContentData").text();
		var id = $("#replyId").val();
		
		
		// 데이터 셋팅
		$("#replyRno").val(rno);
		$("#replyContent").val(content);
		$("#replyId").val(id);
		// 비밀번호는 지운다.
		// $("#replyPw").val("");
		
		replyModal.modal("show");
	});
	
	// 모달창 수정 버튼 이벤트 - 수정 처리 ------------------------------------
	$("#replyModalUpdateBtn").click(function(){
		// alert("수정처리");
		// 데이터 수집
		var reply = {};
		reply.rno = $("#replyRno").val();
		reply.content = $("#replyContent").val();
		reply.id = $("#replyId").val();
		
		// 수집한 데이터 확인
		// alert(JSON.stringify(reply));
		
		// reply.js 안에 있는 replyService.update를 호출해서 실행
		replyService.update(reply,
			function(result, status){
				//	alert("성공" + status);
					
				// 성공 메시지 출력
				if(status=="notmodified")
					alert("수정이 되지 않았습니다. 정보를 확인해 주세요.");
				else{
					alert(result);
						
					showList();
				}
				// 리스트를 다시 표시한다.
			},
			function(err, status){
					// 실패 메시지 출력
					// alert(err, status);
					alert(err);
				}
			); // replyService.update()의 끝 
			
			// 모달 창은 숨겨 둔다.
			replyModal.modal("hide");
	
		});
	
	// 댓글 삭제 폼 : 모달 (replyModal )----------------------------------
	$(".chat").on("click", ".replyDeleteBtn", function(){
		// alert("댓글 삭제");
		// 모달창 제목 바꾸기
		$("#replyModalTitle").text("댓글 삭제");
		
		// 작업할 데이터의 입력란을 보이게 안보이게
		$("#replyModal .form-group").show();
		
		$("#replyNoDiv, #replyRnoDiv, #replyContentDiv, #replyIdDiv").hide();
		
		// 작업할 버튼을 보이게 안보이게
		var footer = $("#replyModal .modal-footer");
		footer.find("button").show();
		footer.find("#replyModalWriteBtn, #replyModalUpdateBtn").hide();
		
		// 댓글 번호 가져오기
		var li = $(this).closest("li");
		var rno = li.data("rno");
		
		// 댓글 번호 셋팅
		$("#replyRno").val(rno);
		
// 		// 댓글 비밀번호 지우기
// 		$("#replyPw").val("");
		
		// 댓글 모달 보이게
		replyModal.modal("show");
		
	});
	
	// 댓글 삭제 처리
	$("#replyModalDeleteBtn").click(function(){
		// alert("댓글 삭제 처리");
		// 데이터 수집
		var reply= {};
		reply.rno = $("#replyRno").val();
		
		// reply.js 안에 있는 replyService.delete(reply JSON, 성공함수, 오류함수)
		replyService.delete(reply,
				function(result, status){
					// status - 비밀번호가 틀려서 삭제가 되지 않으면 "notmodified"
					// alert("result : " + result + "\nstatus : " + status);
					if(status=="success"){
						alert(result);
						// 성공적으로 삭제를 한 경우는 다시 리스트를 가져와서 표시해준다.
						showList();
					}else{
						alert("댓글 삭제에 실패하였습니다. 정보를 확인해주세요.");
					}
				},
				function(err){
					alert(err);
				}
		);
		
		replyModal.modal("hide");
		
	});
	// 댓글의 페이지 번호 클릭 이벤트 - 태그가 나중에 나온다. 그래서 on()
	// $(원래 있었던 객체 선택).on(이벤트, 새로 만들어진 태그, 실행함수) -> 이벤트의 전달
	$("#reply_nav").on("click", ".reply_nav_li",
		function(){
// 			alert("댓글 페이지네이션 클릭");
			// this => li / move 클래스 li-a에 작성해 놨다.
			if($(this).find("a").hasClass("move")){
				repPage = $(this).data("page");
// 				alert(repPage + " 페이지로 이동시킨다.");
				showList();
			} else {
				alert("이동시키지 않는다.");
			}
			return false;
		}
	);
	
}); // $(function(){~}) 의 끝.
</script>

</head>
<body>
	<div class="container">
		<h1>문제 출제 글보기</h1>
		<table class="table">
			<tr>
				<th style="width: 100px;">번호</th>
				<td style="margin: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.no }
					<c:if test="${vo.accept == '대기' }">
						<div class="col-3 label label-default pull-right"
							style="width: 5em; height: 2em; align-content: center; padding-top: 0.5em;">${vo.accept }</div>
					</c:if> <c:if test="${vo.accept == '승인' }">
						<div class="col-3 label label-primary pull-right"
							style="width: 5em; height: 2em; align-content: center; padding-top: 0.5em;">${vo.accept }</div>
					</c:if> <c:if test="${vo.accept == '거절' }">
						<div class="col-3 label label-danger pull-right"
							style="width: 5em; height: 2em; align-content: center; padding-top: 0.5em;">${vo.accept }</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.id }</td>
			</tr>
			<tr>
				<th>문제</th>
				<td>${vo.quiz }</td>
			</tr>
			<tr>
				<th>보기</th>
				<td><c:forEach items="${exvo }" var="evo">
						<div>${evo.eno }. ${evo.ex }</div>
					</c:forEach></td>
			</tr>
			<tr>
				<th>정답</th>
				<td>${vo.right }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${vo.writeDate }"
						pattern="yyyy.MM.dd" /></td>
			</tr>
		</table>
<!-- 		<!-- 데이터 표시하는 부분 -->
<!-- 		<ul class="list-group"> -->
<!-- 			<li class="list-group-item row"> -->
<!-- 				<div class="col-md-2 title_label">번호</div> -->
<!-- 				<div class="col-12"> -->
<%-- 					<span class="col-md-10">${vo.no }</span> --%>
<%-- 					<c:if test="${vo.accept == '대기' }"> --%>
<!-- 						<div class="col-3 label label-default pull-right" -->
<%-- 							style="width: 5em; height: 2em; align-content: center; padding-top: 0.5em; margin-top: 1em;">${vo.accept }</div> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${vo.accept == '승인' }"> --%>
<!-- 						<div class="col-3 label label-primary pull-right" -->
<!-- 							style="width: 5em; height: 2em; align-content: center; padding-top: 0.5em; margin-top: 1em;"> -->
<%-- 							<span style="padding-top: 3em;">${vo.accept }</span> --%>
<!-- 						</div> -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${vo.accept == '거절' }"> --%>
<!-- 						<div class="col-3 label label-danger pull-right" -->
<!-- 							style="width: 5em; height: 2em; align-content: center; padding-top: 0.5em; margin-top: 1em;"> -->
<%-- 							<span style="padding-top: 3em;">${vo.accept }</span> --%>
<!-- 						</div> -->
<%-- 					</c:if> --%>
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li class="list-group-item row"> -->
<!-- 				<div class="col-md-2 title_label">난이도</div> -->
<%-- 				<div class="col-md-10">${vo.lev }</div> --%>
<!-- 			</li> -->
<!-- 			<li class="list-group-item row"> -->
<!-- 				<div class="col-md-2 title_label">문제</div> -->
<%-- 				<div class="col-md-10">${vo.quiz }</div> --%>
<!-- 			</li> -->
<!-- 			<li class="list-group-item row"> -->
<%-- 				<div class="col-md-2 title_label">보기</div> <c:forEach --%>
<%-- 					items="${exvo }" var="evo"> --%>
<%-- 					<div class="col-md-10 ex">${evo.eno }${evo.ex }</div> --%>
<%-- 				</c:forEach> --%>
<!-- 			</li> -->

<!-- 			<li class="list-group-item row"> -->
<!-- 				<div class="col-md-2 title_label">정답</div> -->
<%-- 				<div class="col-md-10">${vo.right }</div> --%>
<!-- 			</li> -->
<!-- 			<li class="list-group-item row"> -->
<!-- 				<div class="col-md-2 title_label">아이디</div> -->
<%-- 				<div class="col-md-10">${vo.id }</div> --%>
<!-- 			</li> -->
<!-- 			<li class="list-group-item row"> -->
<!-- 				<div class="col-md-2 title_label">작성일</div> -->
<!-- 				<div class="col-md-10"> -->
<%-- 					<fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd" /> --%>
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 		</ul> -->

		<c:if test="${login.gradeNo == 9 }">

		</c:if>

		<c:if
			test="${login.gradeNo == 9 || login.id == vo.id && vo.accept == '대기' }">
			<a
				href="update.do?no=${vo.no }&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}"
				class="btn btn-default">수정</a>
			<a class="btn btn-default" data-toggle="modal" data-target="#myModal"
				onclick="return false;">삭제</a>
		</c:if>

		<a
			href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}"
			class="btn btn-default">리스트</a>
			<div><br/></div>

		<!-- 댓글의 시작 -->
		<div class="row" style="margin-top: 20px- 40px;">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i> 댓글
						<button class="btn btn-primary btn-xs pull-right"
							id="writeReplyBtn">댓글 쓰기</button>
					</div>
					<div class="panel-body">
						<ul class="chat">
							<!-- 데이터가 있는 만큼 반복 처리 li태그 만들어 내기 -->
							<!-- rno를 표시하지 않고 태그 안에 속성으로 숨겨 놓음 data-rno="12" -->
							<li class="left clearfix" data-rno="12">
								<div>
									<div class="header">
										<strong class="primary-font">user00</strong> <small
											class="pull-right text-muted">2021.04.21 14:21</small>
									</div>
									<div class="content-Text">테스트중</div>
									<div class="text-right">
										<button class="btn btn-default btn-xs replyUpdateBtn">수정</button>
										<button class="btn btn-default btn-xs replyDeleteBtn">삭제</button>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<!-- 댓글 panel-body 의 끝 -->
					<div class="panel-footer">
						<ul class="pagination" id="reply_nav">
							<li><a href="">1</a></li>
							<li class="active"><a href="">2</a></li>
						</ul>
					</div>
				</div>
				<!-- 댓글 panel 의 끝 -->
			</div>
		</div>
		<!-- 댓글의 끝 -->

	</div>
	<!-- container 끝 -->

	<!-- Modal - 게시판 글 삭제시 사용되는 모달 창 -->
	<!-- 		<div id="myModal" class="modal fade" role="dialog"> -->
	<!-- 			<div class="modal-dialog"> -->

	<!-- 				Modal content -->
	<!-- 				<div class="modal-content"> -->
	<!-- 					<div class="modal-header"> -->
	<!-- 						<button type="button" class="close" data-dismiss="modal">&times;</button> -->
	<!-- 						<h4 class="modal-title">게시판 글삭제 비밀번호 입력</h4> -->
	<!-- 					</div> -->
	<!-- 					<div class="modal-body"> -->
	<!-- 						<form action="delete.do" method="post" id="modal_form"> -->
	<%-- 							<input type="hidden" name="no" value="${vo.no }"> <input --%>
	<!-- 								type="hidden" name="perPageNum" -->
	<%-- 								value="${pageObject.perPageNum }"> --%>
	<!-- 							<div class="form-group"> -->
	<!-- 								<label>비밀번호 : </label> <input name="pw" type="password" -->
	<!-- 									class="form-control" id="pw" pattern="[^가-힣ㄱ-ㅎㅏ-]{4,20}" -->
	<!-- 									required="required" title="비밀번호는 4-20자까지 입력, 한글은 입력할 수 없습니다." /> -->
	<!-- 							</div> -->
	<!-- 						</form> -->
	<!-- 					</div> -->
	<!-- 					<div class="modal-footer"> -->
	<!-- 						<button type="button" class="btn btn-default" id="modal_deleteBtn">삭제</button> -->
	<!-- 						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- Modal - 게시판 글 삭제시 사용되는 모달 창의 끝 -->

	<!-- Modal - 댓글 쓰기 / 수정 시 사용되는 모달 창 -->
	<div id="replyModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-comments fa-fw"></i> <span id="replyModalTitle">Reply
							Modal</span>
					</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group" id="replyRnoDiv">
							<label for="replyRno">댓글번호:</label> <input name="rno" type="text"
								class="form-control" id="replyRno" readonly="readonly">
						</div>
						<div class="form-group" id="replyNoDiv">
							<label for="replyNo">게시판 번호:</label> <input name="no" type="text"
								class="form-control" id="replyNo" readonly="readonly"
								value="${vo. no }">
						</div>
						<div class="form-group" id="replyContentDiv">
							<label for="replyContent">내용:</label>
							<textarea name="content" class="form-control" rows="3"
								id="replyContent" required="required"></textarea>
						</div>
						<div class="form-group" id="replyIdDiv">
							<label for="replyId">작성자:</label> <input name="id" type="text"
								class="form-control" id="replyId" readonly="readonly"
								value="${login. id }">
						</div>
						<!-- 							<div class="form-group" id="replyDeleteAlert"> -->
						<!-- 								<label for="replyPW">비밀번호:</label>  -->
						<!-- 								<input name="pw"type="text" class="form-control" id="replyPw" -->
						<!-- 								 pattern=".{4,20}"> -->
						<!-- 							</div> -->
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						id="replyModalWriteBtn">등록</button>
					<button type="button" class="btn btn-default"
						id="replyModalUpdateBtn">수정</button>
					<button type="button" class="btn btn-default"
						id="replyModalDeleteBtn">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>
	<!-- Modal - 댓글 쓰기 / 수정 시 사용되는 모달 창의 끝 -->
</body>
</html>