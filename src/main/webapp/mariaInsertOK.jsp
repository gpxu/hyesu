<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.human.jdbc.JDBCUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	// GET전송이면 폼으로 보낸다.
	if(!request.getMethod().equals("POST")){
		response.sendRedirect("mariaInsertForm.jsp");
		return;
	}
	// 데이터 받기
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	
	Connection conn = null; // 변수 준비
	Statement stmt = null;
	PreparedStatement pstmt = null; // insert,update 할때는 PreparedStatement가 좋음
	try{
		conn = JDBCUtil.getConnection(application.getRealPath("./db.properties"), "maria"); // 연결얻기
		conn.setAutoCommit(false); // 자동커밋 취소
		//---------------------------------------------------------------------------
		// 이 부분만 변경한다.
		// out.println("연결 성공 : " + conn + "<br>");
		/*
		String sql = "insert into person (name, age , gender) values ('" +name+"',"+age+",'"+gender+"')";
		stmt = conn.createStatement();
		int n = stmt.executeUpdate(sql);
		System.out.println(n + "개 저장 완료");
		*/
		String sql = "insert into person (name, age, gender) values (?,?,?)"; // 미완성 명령
		pstmt = conn.prepareStatement(sql); // 미완성 명령 객체
		pstmt.setString(1, name);
		pstmt.setInt(2, Integer.parseInt(age));
		pstmt.setString(3, gender);
		// ? 자리를 값으로 변경해서 명령어를 완성한다.
		int n = pstmt.executeUpdate();
		//---------------------------------------------------------------------------
		conn.commit(); // 모든 명령이 에러가 없으면 DB에 적용한다
	}catch(SQLException e){ 
		JDBCUtil.rollback(conn); // 에러 발생시 모든 SQL명령을 취소한다.
		e.printStackTrace();
	}finally{
		JDBCUtil.close(pstmt); // 닫기
		JDBCUtil.close(stmt); // 닫기
		JDBCUtil.close(conn); // 닫기
	}
	response.sendRedirect("MariaViewPerson.jsp");
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