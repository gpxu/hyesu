<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그아웃은 세션에 저장된 정보를 지워주면 된다.
	session.removeAttribute("userid");
	// 메인 화면으로 보낸다.
	//response.sendRedirect("loginForm.jsp");
	
	// 원래 있었던 화면으로 가야한다.
	// 어디를 통해서 이곳으로 왔는지를 알아낸다
	String referer = request.getHeader("referer");
	if(referer==null || referer.trim().length()==0){ // 이전주소가 없다면
		referer = "loginForm.jsp";
	}
	response.sendRedirect(referer);
%>