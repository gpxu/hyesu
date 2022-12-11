<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<body>
	<form action="joinOk1.jsp">
		이름 : <input type="text" name="name"/> <br />
		나이 : <input type="number" name="age" max="150" min="1" value="22"/> <br />
		성별 : 
		<label><input type="radio" name="gender" value="true"/> 남자</label> 
		<label><input type="radio" name="gender" value="false"/> 여자</label>
		<br />
		<input type="submit" value="회원가입하기" /> 
	</form>
</body>
</html>