<%@page import="com.mcbt.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = request.getParameter("id");
    String strGradeNo = request.getParameter("gradeNo");
    int gradeNo = Integer.parseInt(strGradeNo);
    
    MemberVO vo = new MemberVO();
    vo.setId(id);
    vo.setGradeNo(gradeNo);
    
    String url = request.getServletPath();
    
//     Service service = Beans.get(url);
//     ExeService.execute(service, vo);

 // 자동으로 /member/list.jsp로 이동이 되어야 한다.
 response.sendRedirect("list.jsp");
 %>
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>