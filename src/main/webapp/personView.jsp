<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.human.jdbc.JDBCUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//한글 깨짐 처리
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null; // 변수 준비
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = JDBCUtil.getConnection(application.getRealPath("./db.properties"),"oracle"); // 연결얻기
		conn.setAutoCommit(false); // 자동커밋을 취소한다.
		//-------------------------------------------------------------------------
		// 이부분만 변경된다.
		if(request.getMethod().equals("POST")){
			// 데이터 받기
			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String gender = request.getParameter("gender");
			String sql = "insert into person values (person_idx_seq.nextval,?,?,?)"; // 미완성 명령
			pstmt = conn.prepareStatement(sql); // 미완성 명령 객체
			pstmt.setString(1, name);
			pstmt.setInt(2, Integer.parseInt(age));
			pstmt.setString(3, gender);
			// ?자리를 값을 변경해서 명령어를 완성한다.
			int n = pstmt.executeUpdate();		
			System.out.println(n + "개 저장 완료!!!!");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="?" method="post">
		<fieldset>
			<legend>저장 폼</legend>
			이름 : <input type="text" name="name" id="name" placeholder="이름" required="required"/> <br />	
			나이 : <input type="number" name="age" min="1" max="150" value="20"/>	<br />
			성별 : 
			<label>	<input type="radio" name="gender" value="M" /> 남자 </label>
			<label>	<input type="radio" name="gender" value="F" checked="checked"/> 여자 </label> <br />
			<input type="submit" value="저장하기" />
			<input type="reset" value="다시쓰기" />
		</fieldset>
	</form>
<%
	String sql = "select * from person order by idx desc";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	out.println("<hr>Person 테이블의 내용<hr>");
	if(rs.next()){
		do{
			out.println(rs.getInt("idx") + ". ");
			out.println(rs.getString("name") + "(");
			out.println(rs.getInt("age") + "세, ");
			out.println(rs.getString("gender") + ")<br>");
		}while(rs.next());
	}else{
		out.println("데이터가 없습니다.<br>");
	}
%>	
</body>
</html>
<%
conn.commit(); // 모든 명령이 에러가 없으면 DB에 적용한다
	}catch(SQLException e){ 
		JDBCUtil.rollback(conn); // 에러 발생시 모든 SQL명령을 취소한다.
		e.printStackTrace();
	}finally{
		JDBCUtil.close(pstmt); // 닫기
		JDBCUtil.close(stmt); // 닫기
		JDBCUtil.close(conn); // 닫기
	}

%>