<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그아웃은 세션에 저장된 정보를 지워주면 된다.
	session.removeAttribute("userid");
	// 메인 화면으로 보낸다.
	response.sendRedirect("loginForm.jsp");
%>