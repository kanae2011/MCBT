<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 정보 수정</title>
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script type="text/javascript">
$(function(){
	
	
	// 전달할 때의 데이터 찍기
	$("#writeForm").submit(function(){
		// alert("submit()");
		// alert($("#title").val());
		// alert($("#content").val());
		// C:\fakepath\flower01.jpg
		// alert($("#imageFile").val());
		// 첨부파일이 이미지 파일인지 알아내는 프로그램 작성 -> 확장자 : 파일명의 마지막 "." 이후의 글자
		var fileName = $("#imageFile").val();
		// substring(시작[, 끝]) - 부분 문자열 잘라내기
		// lastIndexOf(찾는 문자열) - 뒤에서 부터 찾는 문자열의 위치. 찾는 문자열이 없으면 -1이 된다.
		// toUpperCase() -> 모든 영문자를 대문자로 만들어 준다. <--> toLowerCase()
		var ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
		// alert(ext);
		
		// 이미지 확장자인지 확인하는 반복문
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
		
		// submit을 취소
		// return false;
		
	});

	// 취소 버튼을 클릭하면 이전 페이지로 이동
	$("#cancelBtn").click(function(){
		history.back();
	});
	
});
</script>

</head>
<body>
<div class="container">
	<h1>상품관리 정보 변경</h1>
	<!-- 파일첨부는 포함되지 않는다. enctype 지정 필요 X -->
	<!-- 파일첨부를 하는 입력에는 반드시 post방식이여야 하고 enctype 을 지정해야만 한다.
	  input tag의 type="file"로 지정한다. -->
	<form action="update.do" method="post" enctype="multipart/form-data" id="updateForm" >
		<input name="page" value="${param.page }" type="hidden">
		<input name="perPageNum" value="${param.perPageNum }" type="hidden">
		<div class="form-group">
			<label for="no">번호</label>
			<input name="no" id="no" class="form-control" value="${vo.no }" 
			readonly="readonly"/>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input name="title" id="title" class="form-control" value="${vo.title }" />
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea name="content" id="content" class="form-control" rows="5"
			 >${vo.content }</textarea>
		</div>
		<button class="btn btn-primary">수정</button>
		<button type="reset" class="btn btn-primary">새로입력</button>
		<button type="button" id="cancelBtn" class="btn btn-primary">취소</button>
	</form>
</div>
</body>
</html>