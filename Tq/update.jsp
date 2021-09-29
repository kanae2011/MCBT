<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제출제 게시판 글수정</title>

<script type="text/javascript">
	$(function() {
		$(".cancelBackBtn").click(function() {
			history.back();
		});
	})
</script>

</head>
<body>
	<div class="container">
		<h1>문제출제 게시판 글수정</h1>
		<form action="update.do" method="post">
			<input name="page" type="hidden" value="${param.page }" /> <input
				name="perPageNum" type="hidden" value="${param.perPageNum }" /> <input
				name="key" type="hidden" value="${param.key}" /> <input name="word"
				type="hidden" value="${param.word }" />
			<div class="form-group">
				<label for="no">번호:</label> <input name="no" type="text"
					class="form-control" id="no" value="${vo.no }" readonly="readonly">
			</div>

			<!-- 			<div class="form-group"> -->
			<!-- 				<label for="lev">난이도:</label> <input name="lev" type="text" -->
			<%-- 					class="form-control" id="lev" value="${vo.lev }" --%>
			<!-- 					readonly="readonly"> -->
			<!-- 			</div> -->

			<div class="form-group">
				<label for="lev">난이도:</label> <select name="lev"
					class="form-control" id="lev" ${vo.lev }>
					<option>top</option>
					<option>mid</option>
					<option>bottom</option>
				</select>
			</div>

			<!-- 			<div class="form-group"> -->
			<!-- 				<label for="accept">승인:</label> <input name="accept" type="text" -->
			<%-- 					class="form-control" id="accept" value="${vo.accept }"> --%>
			<!-- 			</div> -->

			<c:if test="${login.gradeNo == 9}">
				<div class="form-group">
					<label for="accept">승인:</label> <select name="accept"
						class="form-control" id="accept" ${vo.accept }>
						<option>대기</option>
						<option>승인</option>
						<option>거절</option>
					</select>
				</div>
			</c:if>

			<div class="form-group">
				<label for="quiz">문제:</label>
				<!-- required : 필수 입력, placeholder : 입력의 초기 안내,
					 pattern : 정규표현식으로 유효성 검사, title : 패턴이 맞지 않을때 나오는 메시지 -->
				<input name="quiz" type="text" class="form-control" id="quiz"
					pattern=".{4,100}" maxlength="100" required="required"
					value="${vo.quiz }">
			</div>

			<!-- 			<div class="form-group"> -->
			<!-- 				<label for="ex">보기:</label> -->
			<%-- 				<c:forEach items="${exvo }" var = "exvo"> --%>
			<%-- 				${exvo.eno } --%>
			<%-- 				<input name="ex" class="form-control" id="ex" value="${exvo.ex }"> --%>
			<%-- 				</c:forEach> --%>
			<!-- 			</div> -->

			<label for="ex">보기:</label>
			<div class="input-group">
				<c:forEach items="${exvo }" var="exvo">
					<span class="input-group-addon">${exvo.eno }</span>
					<input name="ex" class="form-control" id="ex" value="${exvo.ex }">
				</c:forEach>
			</div>

			<div class="form-group">
				<label for="right">정답:</label> <input name="right" type="text"
					class="form-control" id="right" value="${vo.right }">
			</div>

			<div class="form-group">
				<label for="id">아이디:</label> <input name="id" type="text"
					class="form-control" id="id" required="required" value="${vo.id }"
					readonly="readonly">
			</div>

			<button class="btn btn-default">수정</button>
			<button class="btn btn-default" type="reset">새로입력</button>
			<button class="btn btn-default cancelBackBtn" type="button">취소</button>
		</form>
	</div>
</body>
</html>