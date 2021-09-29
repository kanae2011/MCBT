<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>

  <!-- 부트스트랩 라이브러리와 마우스가 올라 갔을 때의 CSS는 default_decorator.jsp 에서 전체적으로 잡음. -->
<script type="text/javascript">
$(function(){
	$("#cancelBtn").click(function(){
		history.back();
	});
});
</script>
<style>
html{background-color:#ffffff;}#wrap{background-color:#ffffff;}
#container{width:500px;height:100%;margin:0 auto;text-align:left;padding:20px 20px 0 20px;padding-top:200px;}
input[type=text]{
  width: 100%;
  padding: 0px 20px;
  height: 51px;
  margin: 4px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
input[type=password]{
  width: 100%;
  padding: 0px 20px;
  height: 51px;
  margin: 4px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
.deleteBtn {
  width: 49.5%;
  background-color: #03C75A;
  color: #ffffff;
  padding: 0px 20px;
  height: 51px;
  margin: 4px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size:18px;
  font-weight:700;
}
.cancelBtn {
  width: 49.5%;
  background-color: #8E8E8E;
  color: #ffffff;
  padding: 0px 20px;
  height: 51px;
  margin: 4px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size:18px;
  font-weight:700;
}
</style>
</head>
<body>
<div id="wrap">
	<div id="container">
		<form action="delete.do" method="post">
			<div class="form-group">
				<label for="id">아이디</label>
				<input name="id" id="id" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label>
				<input name="pw" id="pw" type="password" class="form-control" />
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input name="name" id="name" type="text" class="form-control" />
			</div>
			<button type="submit" class="deleteBtn">탈퇴</button>
			<button type="button" id="cancelBtn" class="cancelBtn">취소</button>
		</form>
	</div>
</div>
</body>
</html>