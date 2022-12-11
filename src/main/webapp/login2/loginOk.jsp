<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// GET방식의 요청을 거부한다. POST방식만 처리하자!!!
	if(!request.getMethod().equals("POST")){
		response.sendRedirect("main1.jsp");
		return;
	}

	// 로그인 처리를 하고 메인화면이나 이전 화면으로 돌아가면 된다.
	// 데이터 3개를 받자
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String saveid = request.getParameter("saveid");
	
	// 원래는 DB에 저장된 데이터를 조회하여 로그인을 해야 하지만 우리는 아직 없다!!!
	// 아이디와 비번이 같으면 로그인 된것으로 간주하자!!!
	if(userid!=null && userid.equals(password)){
		session.setAttribute("userid", userid); // 세션에 아이디 저장
		// saveid가 true라면 아이디를 쿠키로 저장해주자!!
		if(saveid!=null && saveid.equals("true")){
			Cookie cookie = new Cookie("userid", userid);
			cookie.setMaxAge(60*60*24*7); // 일주일간 보관
			response.addCookie(cookie);
		}else{
			Cookie cookie = new Cookie("userid", "");
			cookie.setMaxAge(0); 
			response.addCookie(cookie);
		}
	}else{
		// 비번이 일치하지 않다면
		out.println("<script>");
		out.println("alert('입력 정보가 올바르지 않습니다.')");
		out.println("</script>");
	}
	// 어디를 통해서 이곳으로 왔는지를 알아낸다
	String referer = request.getHeader("referer");
	if(referer==null || referer.trim().length()==0){ // 이전주소가 없다면
		referer = "main1.jsp";
	}
	// response.sendRedirect(referer); // 자바스크립트와 같이 쓰면 자바스크립트 작동안함!!
	out.println("<script>");
	out.println("location.href='" + referer + "'");
	out.println("</script>");
%>