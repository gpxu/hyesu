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
		// 1. 변수 준비
		String driverClass = "org.sqlite.JDBC";
		String url = "jdbc:sqlite:sample.db";
		String user = "";
		String password = "";
		// 2. 드라이버 로딩 
		Class.forName(driverClass);
		// 3. 연결
		Connection conn = DriverManager.getConnection(url, user, password);
		out.println("연결 성공 : " + conn);
		// 4. 사용
		
		
		// 5. 닫기
		conn.close();
	%>
</body>
</html>