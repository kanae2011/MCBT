<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>level</title>
<style type="text/css">
@font-face {
    font-family: 'CookieRunOTF-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
/* 	background-color: #ffe6e6; */
}

ul {
	text-align: center;
	
}

h1 {
	text-align: center;
	margin: 250px 0px;
	font-family: CookieRunOTF-Bold;
	font-size: 50px;	
}

.actionBtn {
	margin: 100px;
	list-style: none;
	display: inline-block;
	
}

.li {
	margin: 100px;
	list-style: none;
	display: inline-block;
	font-family: CookieRunOTF-Bold;
	font-size: 20px;
}

.actionBtn {
	position: relative;
	display: block;
	width: 166px;
	height: 40px;
	margin: auto;
	text-decoration: none;
	
}

.actionBtn .hover .txt {
	display: block;
	width: 160px;
	color: #4c4c4d;
	background-color: #fff;
	text-align: center;
	margin: 0 auto;
	line-height: 34px;
	font-family: oswald;
	text-transform: uppercase;
	font-family: CookieRunOTF-Bold;
	font-size: 20px;
}

.actionBtn .hover:after {
	display: block;
	position: absolute;
	top: -5px;
	left: -2px;
	content: "";
	width: 100%;
	height: 40px;
	border: 2px solid salmon;
	transition: transform .2s;
	-webkit-transition: -webkit-transform .2s;
	-moz-transition: -moz-transform .2s;
}

.actionBtn:hover .hover:after {
	transform: scale(1.06, 1.25);
	-webkit-transform: scale(1.06, 1.25);
	-moz-transform: scale(1.06, 1.25);
}




</style>

</head>
<body>
<h1>난이도를 선택해주세요</h1>
<ul>
	<li class="li"><a href="random.do?lev=top" class="actionBtn">
		 <span class="hover">		
		 <span class="txt">상</span>
		</span>
	</a></li>
	<li class="li"><a  href="random.do?lev=mid" class="actionBtn">
		 <span class="hover">		
		 <span class="txt">중</span>
		</span>
	</a></li>
	<li class="li"><a href="random.do?lev=bottom" class="actionBtn">
		 <span class="hover">		
		 <span class="txt">하</span>
		</span>
	</a></li>
</ul>



</body>
</html>