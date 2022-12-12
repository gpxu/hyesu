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
	Connection conn = null; // 변수 준비
	Statement stmt = null;
	ResultSet rs = null;
	try{
		conn = JDBCUtil.getConnection(application.getRealPath("./db.properties"), "maria"); // 연결얻기
		conn.setAutoCommit(false); // 자동커밋 취소
		//---------------------------------------------------------------------------
		// 이 부분만 변경한다.
		// out.println("연결 성공 : " + conn + "<br>");
		String sql = "select * from person order by idx desc";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		out.println("Person 테이블의 내용<hr>");
		if(rs.next()){
			do{ 
		// 필드명을 알면 필드명을 쓰고 모르면 순서 쓰면 됨 (필드명 써주는게 명확하고 좋음)
				out.println(rs.getInt("idx") + ". ");
				out.println(rs.getString("name") + "(");
				out.println(rs.getInt("age") + "세, ");
				out.println(rs.getString("gender") + ")<br>");
			}while(rs.next());
		}else{
			out.println("데이터가 없습니다");
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
<button onclick="location.href='mariaInsertForm.jsp'">저장하기</button>
</body>
</html>