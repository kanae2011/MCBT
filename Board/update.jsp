<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 수정</title>
<!-- BootStrap 라이브러리 등록 - CDN 방식 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#content').on('keyup', function() {
			$('#content_cnt').html("(" + $(this).val().length + " / 1000)");

			if ($(this).val().length > 1000) {
				alert("1000자까지 작성할 수 있습니다");
				$(this).val($(this).val().substring(0, 1000));
				$('#content_cnt').html("(1000 / 1000)");
			}
		});
	});

	$(function() {
		$(".cancelBtn").click(function() {
			history.back();
		});
	});
</script>
<style type="text/css">
select.swal2-select {
	width: 100px;
	height: 35px;
	text-align: center;
	padding-left: 10px;
}

.contentBox {
	width: 100%;
	padding: 29px 29px 0;
	border: 1px solid #ebecef;
	border-radius: 6px;
	padding-bottom: 30px;
	word-break: break-all;
}

input, textarea {
	border-radius: 6px;
}

.article_header {
	position: relative;
	margin-bottom: 20px;
	border-bottom: 1px solid #ebecef;
}

div {
	display: block;
}

body {
	position: relative;
	text-size-adjust: none;
	font-weight: 400;
	font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum,
		sans-serif;
}

div.button {
	padding-top: 50px;
	margin: auto;
	text-align: center;
	width: 100%;
}
</style>

</head>
<body>
	<c:choose>
		<c:when test="${vo.writer == login.id}">
			<div class="container" style="margin-top: 50px;">
				<div class="contentBox">
					<form action="update.do" method="post">
						<div class="article_header">
							<div class="form-group">
								<select name="category" class="swal2-select"
									style="margin-bottom: 10px;">
									<option value="자유" selected>자유</option>
									<option value="질문">질문</option>
									<option value="답변">답변</option>
								</select> <input type="text" name="no" class="form-control"
									readonly="readonly" value="${vo.no }"> <input
									type="text" name="title" maxlength="50" class="form-control"
									autocomplete="off" required="required" placeholder="제목을 입력하세요"
									pattern=".{1,50}" value="${vo.title }">
							</div>
						</div>
						<div class="article_header">
							<div class="form-group">
								<input type="text" name="writer" maxlength="10"
									class="form-control" autocomplete="off" required="required"
									placeholder="작성자를 입력하세요"
									pattern="[A-Za-z가-힣][0-9A-Za-z가-힣]{1,9}" value="${vo.writer }"
									readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<textarea id="content" name="content" class="form-control"
								autocomplete="off" required="required" placeholder="내용을 입력하세요"
								rows="20" cols="80" maxlength="1000" style="resize: none;">${vo.content }</textarea>
							<div id="content_cnt">(0 / 1000)</div>
						</div>
						<div class="button">
							<button class="btn btn-default">수정</button>
							<button type="reset" class="btn btn-default">새로입력</button>
							<button type="button" class="btn btn-default cancelBtn">취소</button>
						</div>
					</form>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			권한이 없습니다.
		</c:otherwise>
	</c:choose>
</body>
</html>