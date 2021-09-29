<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<meta charset="UTF-8">
<title>상품관리</title>

<script type="text/javascript">
$(function(){
	// 허용되는 이미지 파일 형식들

	var imageExt = ["JPG", "JPEG", "GIF", "PNG"];
	
		// 처리된 결과 보여주는 경고창
		// - sitemesh - default_decorator.jsp에서 해결
	
	// 이벤트 처리
	// 이미지 바꾸기 모달창의 바꾸기 버튼
	$("#changeBtn").click(function(){
		// alert("change");
		// 파일이 비어 있는지 확인
		var fileName = $("#imageFile").val();
		// alert(fileName);
		// 바꿀 파일란이 비어 있는 경우의 처리
		if(!fileName){
			alert("바꿀 이미지를 반드시 선택하셔야 합니다.");
			$("#imageFile").focus();
			return false;
		}
		// 바꿀 파일란이 비어 있지 않는 경우의 처리 - 지원하는 이미지 확인 처리
		// substring(시작[, 끝]) - 부분 문자열 잘라내기
		// lastIndexOf(찾는 문자열) - 뒤에서 부터 찾는 문자열의 위치. 찾는 문자열이 없으면 -1이 된다.
		// toUpperCase() -> 모든 영문자를 대문자로 만들어 준다. <--> toLowerCase()
		var ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
		// alert(ext);
		
		// 이미지 확장자인지 확인하는 반복문 - imageExt가 위에 배열로 선언이 되어져 있어야만 한다. 
		var checkExt = false; // 지원하지 않는 확장자를 기본으로 셋팅
		for(i = 0; i < imageExt.length; i++){
			if(ext == imageExt[i]){
				checkExt = true; // 지원하는 확장자로 바꾼다.
				break;
			}
		}
		// 지원하지 않는 이미지 파일 선택경의 처리
		if(!checkExt){
			alert("지원하지 않는 이미지 파일입니다.");
			$("#imageFile").focus();
			return false;
		}

		// 강제적으로 폼 데이터를 전송한다.
		$("#updateFileForm").submit();
	});
	
	// 취소 버튼 이벤트
	$("#cancelBtn").click(function(){
		// 확인을 누르면 true / 취소를 누르면 false가 리턴
		// false가 리턴되면 a 태그를 취소시킴
		history.back();
// 		return false;
	});

	// 삭제 버튼 이벤트
	$("#deleteBtn").click(function(){
		// 확인을 누르면 true / 취소를 누르면 false가 리턴
		// false가 리턴되면 a 태그를 취소시킴
		return confirm("지울꺼야?");
	});

});
</script>

</head>
<body>
<div class="container">
	<h1>상품관리 글보기</h1>
	<table class="table">
		<tr>
			<th style="width: 100px;">번호</th>
			<td>${vo.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.title }</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><img src="${vo.fileName }" style="width: 95%" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${vo.content }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.id }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<c:if test="${vo.id == login.id || login.gradeNo == 9}">
					<!-- 작성자가 로그인한 회원인 경우와 관리자에게만 나타나는 메뉴 -->
					<a href="update.do?no=${vo.no }&page=${param.page }&perPageNum=${param.perPageNum}" class="btn btn-primary">수정(제목,내용)</a>
					<button type="button" class="btn btn-primary"
					 data-toggle="modal" data-target="#myModal">파일바꾸기</button>
					<a href="delete.do?no=${vo.no }&perPageNum=${param.perPageNum}&deleteFile=${vo.fileName}" class="btn btn-primary" id="deleteBtn">삭제</a>
					<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}"
					 class="btn btn-primary">목록</a>
				</c:if>
				<c:if test="${empty login }">
				<!-- EL 객체 - param.page => rquerst.getParameter("page") -->
				<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}"
					 class="btn btn-primary">목록</a>
				</c:if>
			</td>
		</tr>
	</table>
	
  <!-- Modal : 이미지 바꾸기 -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">이미지 바꾸기</h4>
        </div>
        <div class="modal-body">
          <p>바꿀 이미지 파일을 선택하세요.</p>
          <form action="updateFile.do" method="post" enctype="multipart/form-data" 
          id="updateFileForm">
          	<!-- 페이지 정보를 숨겨서 넘긴다. -->
          	<input name="page" value="${param.page }" type="hidden" />
          	<input name="perPageNum" value="${param.perPageNum }" type="hidden" />
          	<div class="form-group">
          		<label for="no">번호</label>
          		<input name="no" id="no" class="form-control" value="${vo.no }" 
          		 readonly="readonly"/>
          	</div>
          	<div class="form-group">
          		<label for="deleteFile">원본파일</label>
          		<input name="deleteFile" id="deleteFile" class="form-control"
          		 value="${vo.fileName }" readonly="readonly"/>
          	</div>
          	<div class="form-group">
          		<label for="imageFile">바꿀 파일 선택</label>
          		<input name="multipartFile" id="imageFile" class="form-control"
          		 type="file" />
          	</div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="changeBtn">바꾸기</button>
          <button type="button" class="btn btn-primary" id="cancelBtn">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>