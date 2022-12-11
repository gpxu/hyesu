<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키</title>
</head>
<body>
	<%
		// 쿠키 만들기
		Cookie cookie1 = new Cookie("name", URLEncoder.encode("한사람", "UTF-8"));
		Cookie cookie2 = new Cookie("phone", URLEncoder.encode("010-4255-3236", "UTF-8"));
		
		// 쿠키를 클라이언트로 보내기
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		
		// 저장된 모든 쿠키를 읽어보자!!!
		Cookie[] cookies = request.getCookies();
		for(Cookie c : cookies){
			out.println(c.getName() + " : " + URLDecoder.decode(c.getValue(), "UTF-8") + "<br>");
		}
	%>
</body>
</html>