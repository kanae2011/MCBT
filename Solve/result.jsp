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

.score {
	font-family: CookieRunOTF-Bold;
	font-size: 60px;
}

.main, .answer, .rank {
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

.main:hover, .answer:hover, .rank:hover {
	background: #c34c74;
	color: #fff;
}

.result {
	padding: 30px 50px;
	margin: 100px auto;
	width: 600px;
	background: #fff;
	border: 2px solid #eed0dc;
	border-radius: 20px;
	box-shadow: 5px 5px 5px #cbcbcb;
	color: #333;
	font-size: 2.4em;
	text-align: center;
}
</style>

</head>
<body>
<div class="result">
	<p class="score">${score}점</p>
	<c:if test="${score >= 80 }">
		<img alt="#" width="70%" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MTZfMzMg%2FMDAxNjIxMTY3NTU4ODI4.mdikjT6CfFCynp3ppB5MqX1PRRheDuSMQaynfu1O92cg.pboSwOE3XUKrRGV5hwp9hXYaJqGdt8f_rlSvHAko0Ngg.JPEG.gidwndkim0121%2F%25C2%25AF%25B1%25B8%25C4%25AB%25C6%25E4.JPG&type=sc960_832">
	</c:if>
	<c:if test="${score >= 60 && score < 80}">
		<img alt="#" width="70%" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTA0MTlfMjcx%2FMDAxNTU1NjU2NjU4MzU3.OdCWgVxPezIChwHydqW-lPz1Wy_qyRUXUrl_P_QUkHsg.XWNzanbH06yw3a_aQe1NC6kELxUxjG3rg3AKBztrEQQg.JPEG.mdibic%2Foutput_396984721.jpg&type=sc960_832">
	</c:if>
	<c:if test="${score >= 30 && score <= 50}">
		<img alt="#" width="70%" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA4MjNfMTcg%2FMDAxNTk4MTQ4ODA0MzMw.-tWumzc48IzDoPSxaCIurDXasUiR_Kdt0p4eIRAHmmYg.6McH-kRDSXW1TbOZ1eD0lOr172ICLPZbYwjFM1e5wrsg.PNG.oxoggbbq%2F11_%252826%2529.png&type=sc960_832">
	</c:if>
	<c:if test="${score <= 20}">
		<img alt="#" width="70%" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODAyMTRfMTc0%2FMDAxNTE4NjE3NTQ0MjA2.ef-XIJDLUQWV-sgsQCMi7YYgHIO7mIhF9CaJYY7cb8Ug.ViOGknUWM9NiMYrqQek4f2yazh4Q6z37zkrkM3UK5Fcg.PNG.leeyr1018%2F3.png&type=sc960_832">
	</c:if>
	
	<a href="main.do"><button class="main">다시풀기</button></a>
	<a href="/rank/list.do"><button class="rank">랭킹보기</button></a>
	<a href="view.do"><button class="share answer">정답보기</button></a>
</div>
</body>
</html>