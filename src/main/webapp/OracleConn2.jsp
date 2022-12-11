<%@page import="kr.human.jdbc.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
		// 변수 준비
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		
		try{
			// 객체 생성
			String path = application.getRealPath("./db.properties");
			conn = JDBCUtil.getConnection(path,"oracle"); // 연결 객체 어디
			conn.setAutoCommit(false);
			//-----------------------------------------------------------
			// 명령 실행 - 상단과 하단은 동일하고 이 부분만 변경해서 사용
			stmt = conn.createStatement(); // 명령 객체 얻기
			rs = stmt.executeQuery("select SYSDATE from dual"); // 결과 객체 받기
			if(rs.next()){ // 시작 포인터를 첫번째 결과 값으로 이동한다.
				String date = rs.getString(1);
				out.println("DB 서버 시간 : " + date + "<br>");
			}
			//-----------------------------------------------------------
			conn.commit(); // 명령 적용!!!
		}catch(SQLException e){
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		} finally{
			JDBCUtil.close(rs);
			JDBCUtil.close(stmt);
			JDBCUtil.close(conn);
		}
	%>
</body>
</html>