<%@page import="kr.human.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	MemberVO vo = new MemberVO(); 
	request.setAttribute("vo",vo);
	--%>
	<jsp:useBean id="vo" class="kr.human.vo.MemberVO" scope="request"/>
	<%-- 모든 Setter를 호출해준다. --%>
	<jsp:setProperty property="*" name="vo"/>
	<%-- vo.setIp(request.getRemoteAddr())  --%>
	<jsp:setProperty property="ip" name="vo" value="${pageContext.request.remoteAddr }"/>
	
	<%-- Getter를 호출해 준다. --%>
	이름 : <jsp:getProperty property="name" name="vo"/> <br /> 
	나이 : <jsp:getProperty property="age" name="vo"/> <br /> 
	성별 : <jsp:getProperty property="gender" name="vo"/> <br /> 
	IP : <jsp:getProperty property="ip" name="vo"/> <br />
	<hr />
	이름 : ${vo.name } <br /> 
	나이 : ${vo.age } <br /> 
	성별 : ${vo.gender ? "남자" : "여자" } <br /> 
	IP : ${vo.ip } <br />
	 
</body>
</html>