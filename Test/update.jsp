<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 수정</title>

<script type="text/javascript">
$(function () {
	$(".cancelBtn").click(function () {
		history.back();
	});
});
</script>
<style type="text/css">
.form-control{
	width: 50%;
	margin-left: 25%;
	text-align: center;
}
.row{
	margin-right: 200px;
	margin-left: 160px;
}

</style>
</head>
<body>
<h1>문제 수정</h1>
	<form action="update.do" method="post">
	<input name="page" value="${param.page }" type="hidden">
 	<input name="perPageNum" value="${param.perPageNum }" type="hidden">
 	
	<ul class="list group ul">
	 <li class="list-group-item list-group-item-success row">
	 <div class="form-group">
		<label for="no">번호</label><br>
		<input name="no" class="form-control" value="${vo.no }" readonly="readonly">
	 </div>
	 <div class="form-group">
		<label for="quiz">문제</label><br>
		<input name="quiz" class="form-control" type="text" value="${vo.quiz }">
	 </div>
	 </li>
	</ul>
	<button class="btn btn-default">수정</button>
	<button class="btn btn-default" type="reset">새로입력</button>
	<button class="btn btn-default cancelBtn" >취소</button>
	</form>
</body>
</html>