<%@page import="java.sql.SQLException"%>
<%@page import="kr.human.jdbc.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null; // 변수 준비
	try{
		conn = JDBCUtil.getConnection(application.getRealPath("./db.properties")); // 연결얻기
		conn.setAutoCommit(false); // 자동커밋 취소
		//---------------------------------------------------------------------------
		// 이 부분만 변경한다.
		out.println("연결 성공 : " + conn + "<br>");
		//---------------------------------------------------------------------------
		conn.commit(); // 모든 명령이 에러가 없으면 DB에 적용한다
	}catch(SQLException e){ 
		JDBCUtil.rollback(conn); // 에러 발생시 모든 SQL명령을 취소한다.
		e.printStackTrace();
	}finally{
		JDBCUtil.close(conn); // 닫기
	}
	
%>

</body>
</html>