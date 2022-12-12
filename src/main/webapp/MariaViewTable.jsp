<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	Connection conn = null; // 연결 객체 변수 준비
	Statement stmt = null; // 명령 객체 변수
	ResultSet rs = null; // 결과 객체 변수
	try{
		conn = JDBCUtil.getConnection(application.getRealPath("./db.properties"), "maria"); // 연결얻기
		conn.setAutoCommit(false); // 자동커밋 취소
		//---------------------------------------------------------------------------
		// 이 부분만 변경한다.
		out.println("연결 성공 : " + conn + "<br>");
		String sql = "show tables"; // 실행할 SQL 명령어
		
		stmt = conn.createStatement(); // 명령 객체 얻기
		// 결과가 여러행이면 executeQuery로 실행하고 ResultSet으로 받는다. --- 주로 select 명령
		// 결과가 정수 1개이면 executeUpdate로 실행하고 int로 받는다. -- 주로 insult, update, delete ...
		rs = stmt.executeQuery(sql); //  명령을 실행해서 결과 얻기
		// rs.next() : 결과의 다음행으로 이동해라. 있으면 이동하고 참 리턴, 없으면 거짓을 리턴
		if(rs.next()){
			out.println("테이블 목록<br>");
			do{ // 위에서 이미 next 했으니까 한번은 실행해야함
				out.println(rs.getString(1) + "<br>"); // 첫번째 컬럼의 내용을 문자열로 읽어라
			}while(rs.next());
		}else {
			out.println("결과가 없습니다.<br>");
		}
		
		//---------------------------------------------------------------------------
		conn.commit(); // 모든 명령이 에러가 없으면 DB에 적용한다
	}catch(SQLException e){ 
		JDBCUtil.rollback(conn); // 에러 발생시 모든 SQL명령을 취소한다.
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs); // 닫기
		JDBCUtil.close(stmt); // 닫기
		JDBCUtil.close(conn); // 닫기
	}
	
%>

</body>
</html>