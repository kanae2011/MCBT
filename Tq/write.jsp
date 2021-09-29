<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 등록</title>

<script type="text/javascript">
	$(function(){
		$(".cancelBackBtn").click(function(){
			history.back();
		});
		
	});
</script>

</head>
<body>
	<div class="container">
		<h1>문제 등록</h1>
		<form action="write.do" method="post">
		<input name="perPageNum" type="hidden" value="${param.perPageNum }">
			<div class="form-group">
			<label for="lev">난이도:</label>
			<label class="radio-inline"><input type="radio" name="lev" id="top" value="top">상</label>
			<label class="radio-inline"><input type="radio" name="lev" id="mid" value="mid">중</label>
			<label class="radio-inline"><input type="radio" name="lev" id="bottom" value="bottom">하</label>
			</div>
		
			<div class="form-inline form-group">
				<label for="quiz">문제:</label>
				<!-- required : 필수 입력, placeholder : 입력의 초기 안내,
					 pattern : 정규표현식으로 유효성 검사, title : 패턴이 맞지 않을때 나오는 메시지 -->
				<input name="quiz" type="text" class="form-control" id="quiz"
				pattern=".{2,100}" maxlength="100" required="required"
				title="4자이상 100자 이하 입력" placeholder="4자이상 100자 이하 입력">
			</div>
			
			<div class="form-inline form-group">
				<label for="id">아이디:</label> <input name="id" type="text" value="${login. id }"
					class="form-control" id="id"
					required="required" readonly="readonly">
			</div>

			<button class="btn btn-default">등록</button>
			<button class="btn btn-default" type="reset">새로입력</button>
			<button class="btn btn-default cancelBackBtn" type="button">취소</button>
		</form>
	</div>
</body>
</html>