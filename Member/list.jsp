 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<script type="text/javascript">
$(function() {

	$(".dataRow").click(function(){
		var id = $(this).find(".id").text();
		location = "view.do?id=" + id;
});
});
</script>
<style type="text/css">
table {
   font-family: arial, sans-serif;
   border-collapse: collapse;
   width: 100%;
}

td, th {
   border: 3px solid #eee;
   text-align: center;
   padding: 8px;
}

.dataRow:hover {
   background: #d9d9d9;
   cursor: pointer;
   /*       border: 3px dotted #888; */
}

.line {
   height: 20px;
}

.table {
   width: 30px;
}

#member_list {
   margin : 20px;
   padding: 30px;
}
</style>
</head>
<body>
   <h1>회원 리스트</h1>
   <div class="line">
   
   
   </div>
   <form action="view.do" method="post" id="member_list">
   <table class="container" style="font-family: CookieRun-Regular;">
      <tr>
      <th>아이디</th>
      <th>이름</th>
      <th>닉네임</th>
      <th>이메일</th>
      <th>전화번호</th>
      <th>가입일자</th>
      <th>등급번호</th>
      <th>상태</th>
<!--       <th>가입일자</th> -->
      </tr>
      <c:forEach items="${list }" var="vo">
         <tr class="dataRow">
            <td class="id">${vo.id }</td>
            <td>${vo.name }</td>
            <td>${vo.alias }</td>
            <td>${vo.email }</td>
            <td>${vo.tel }</td>
            <td>${vo.regDate }</td>
            <td>${vo.gradeNo }</td>
            <td>${vo.status }</td>
<%--          <td><span class="status">${vo.status }</span> --%>
<%--          <td>${row.regDate }</td> --%>
         </tr>
      </c:forEach>
   </table>
   </form>
</body>
</html>