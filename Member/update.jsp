<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원가입</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	//취소
	$(function() {
		$(".cancelBackBtn").click(function() {
			history.back();
		});
	})

	
	$("#submit").on("click", function(){
		if($("pw").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#pw").focus();
			return false;
		}
	if($("#name").val()==""){
		alert("이름을 입력해주세요");
		$("#name").focus();
		return false;
	}
	if($("#alias").val()==""){
		alert("닉네임을 입력해주세요");
		$("#alias").focus();
		return false;
	}
	});
	if($("#tel").val()==""){
		alert("전화번호를 입력해주세요");
		$("#tel").focus();
		return false;
	}
	if($("#email").val()==""){
		alert("이메일 입력해주세요");
		$("#email").focus();
		return false;
	}
	});
	
})
</script>
<body>
		<section id="container">	
			<form action="/member/memberUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" value="${login.id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pw">패스워드</label>
					<input class="form-control" type="pw" id="pw" name="pw" value="${login.pw }" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="name">성명</label>
					<input class="form-control" type="text" id="name" name="name" value="${login.name}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="alias">닉네임</label>
					<input class="form-control" type="text" id="alias" name="alias" value="${login.alias}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="tel">전화번호</label>
					<input class="form-control" type="text" id="tel" name="tel" value="${login.tel}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" id="email" name="email" value="${login.email}"/>
				</div>										
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
</body>
</html>