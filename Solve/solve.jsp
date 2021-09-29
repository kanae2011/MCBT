<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript">

</script>

<style type="text/css">
@font-face {
	font-family: 'CookieRunOTF-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


.grid {
	padding: 10px 50px 30px;
	margin: 100px auto;
	width: 600px;
	background: #fff;
	border: 2px solid #eed0dc;
	border-radius: 20px;
	box-shadow: 5px 5px 5px #cbcbcb;
	
}

.grid h1 {
	color: #333;
	font-size: 2.4em;
	text-align: center;
	
}

h1 {
	font-family: CookieRunOTF-Bold;
	font-size: 30px;
}

#question {
	padding: 10px 2em;
	background: salmon;
	border-radius: 15px;
	font-size: 24px;
	color: #fff;
}

#quiz {
	text-align: center;
	font-size: 30px;
}

.buttons {
	padding: 70px 20px 10px;
	border: 2px solid #eed0dc;
	border-radius: 20px;
}

.btn {
 	margin: -30px 40px 50px 20px; 
	padding: 10px 20px;
	width: auto;
	color: #333;
	background: #eed0dc;
	border: 1px solid #ffe3ed;
	border-radius: 15px;
	cursor: pointer;
	transition: all .2s;
	font-size: 19px;
}

.next {
	margin: 10px 40px 20px 0;
	padding: 10px 20px;
	width: 180px;
	color: #333;
	background: #eed0dc;
	border: 1px solid #ffe3ed;
	border-radius: 15px;
	cursor: pointer;
	transition: all .2s;
	font-size: 19px;
}

.btn:hover, .next:hover {
	background: #c34c74;
	color: #fff;
}
</style>

<script type="text/javascript">
$(function(){
	
	// 체크박스 중복 체크
	$('input[type="checkbox"][name="pick"]').click(function(){
		 
		  if($(this).prop('checked')){
		 
		     $('input[type="checkbox"][name="pick"]').prop('checked',false);
		 
		     $(this).prop('checked',true);
		    }
		   });
	

	// 정답 미체크시 이벤트 처리
// 	$(".next").click(function(){
// 		﻿if($(this).parents(".checkbox").prop('checked',false)){
// 			alert("정답을 골라주세요");
// 			return false;
// 		}
// 	});
});
</script>

</head>
<body>
<div class="grid">
<h1>퀴즈</h1>
<form action="next.do" method="post">
	<input type="hidden" name="idx" value="${param.idx }">
   <div id="quiz">
      <p id="question">
      	<input type="hidden" name="no" value="${vo.no }">
      	${param.idx }.${vo.quiz }
      </p>

	<div class="buttons">
		<c:forEach items="${ex }" var="vo">
			<label><input type="checkbox" class="checkbox" name="pick" data-ex="${vo.eno }" value="${vo.eno }">
				<button type="button" class="btn" data-ex="${vo.eno }">${vo.ex }</button></label><br/>
		</c:forEach>
	</div>

      <footer>
         <button class="next">다음 문제로</button>
      </footer>
   </div>
</form>
</div>

</body>
</html>