<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

body {
	font-size: 16px;
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
	padding: 30px 20px;
	border: 2px solid #eed0dc;
	border-radius: 20px;
	
}

.btn{
	margin: 10px 25px 20px 0;
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

.next, .before, .main{
	margin: 10px 25px 20px 0;
	padding: 10px;
	width: 180px;
	color: #333;
	background: #eed0dc;
	border: 1px solid #ffe3ed;
	border-radius: 15px;
	cursor: pointer;
	transition: all .2s;
	font-size: 19px;
}


.main:hover, .before:hover, .next:hover, .answer {
	background: #c34c74;
	color: #fff;
}
</style>

<script type="text/javascript">
	$(".main").click(function(){
		location = "main.do";
	});

</script>
</head>


<body>
<div class="grid">
<h1>정답</h1>
   <div id="quiz">
      <p id="question">
      	<input type="hidden" name="no" value="${vo.no }">
      	${param.idx }.${vo.quiz }
      </p>

	<div class="buttons">
		<c:forEach items="${ex }" var="ex">
				<c:if test="${vo.right == ex.eno }">
					<button type="button" class="btn answer" data-ex="${ex.eno }">${ex.ex }</button><br/>
				</c:if>
				<c:if test="${vo.right != ex.eno }">
					<button type="button" class="btn" data-ex="${ex.eno }">${ex.ex }</button><br/>
				</c:if>
		</c:forEach>
	</div>

      <footer>
      	<c:if test="${param.idx > 1 }">
         	<a href="answerBefore.do?idx=${param.idx }"><button class="before">이전 문제로</button></a>
         </c:if>
         <c:if test="${param.idx < 10 }">
         	<a href="answerNext.do?idx=${param.idx }"><button class="next">다음 문제로</button></a>
         </c:if>
      </footer>
   </div>
<a href="main.do"><button class="main">다시풀기</button></a>
</div>
</body>
</html>