<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.action {
	 display: inline-block;
	 min-width: 200px;
	 min-height: 35px;
	 margin: auto;
	 padding: 15px 0;
	 border-bottom: 1px solid #222;
	 box-sizing: border-box;
	 -webkit-box-sizing: border-box;
	 -moz-box-sizing: border-box;
	 transition: padding .4s cubic-bezier(0.45,-0.11, 0, 0.8);
	 -webkit-transition: padding .4s cubic-bezier(0.45,-0.11, 0, 0.8);
	 -moz-transition: padding .4s cubic-bezier(0.45,-0.11, 0, 0.8);
	 text-transform: uppercase;
	 text-decoration: none;
}
.action:before {
	content: '';
	 display: block;
	 clear:both;
}
.action .lb {
	 display: block;
	 float: left;
	 font-size: 16px;
	 color:#222;
	 font-weight: bold;
	 font-family: 'Montserrat', sans-serif;
}
.action .ico-arr2 {
	 display: block;
	 float: right;
	 width: 18px;
	 height: 12px;
	 margin-top: 1px;
	 background:  no-repeat left top;
}
.action:hover {
	 padding: 15px 17px;
}

h1 {
 	padding: 150px 0;
 	font-size: 50px; 
}
</style>
</head>
<body>
<h1>
┎────────────────┒ <br/>
MCBT<br/>
┖────────────────┚<br/>
　　        ᕱ ᕱ  ||<br/>
　           ( ･ω･ ||<br/>
  　            /　つ🥕<br/>
</h1>
<!-- <img alt="a" src="../upload/image/mcbt.jpg"><br/> -->
<a href="../solve/main.do" class="code_view action">
	 <span class="lb">문제풀러가기</span>
	 <span class="ico-arr2">></span>
</a>
</body>
</html>