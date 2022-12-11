<%@page import="kr.human.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 받고
		String name = request.getParameter("name");
		String ageStr = request.getParameter("age");
		String genderStr = request.getParameter("gender");
	
		// 객체 생성해서 각각의 자료형에 맞춰서 형변환 작업을 해서 넣어야 한다.
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setAge(Integer.parseInt(ageStr));
		vo.setGender(Boolean.parseBoolean(genderStr));
		vo.setIp(request.getRemoteAddr());
		
		out.println(vo);
	%>
</body>
</html>