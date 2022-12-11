<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="result1.jsp" method="post">
		이름 : <input type="text" name="name" required="required" placeholder="이름입력"/>
		<br />
		비번 : <input type="password" name="password" required="required" placeholder="비밀번호입력"/>
		<br />
		성별 : 
		<label> <input type="radio" name="gender" checked="checked" value="1"/> 남자 </label>
		<label> <input type="radio" name="gender" value="2"/> 여자 </label> 
		<br />
		취미 : 
		<label> <input type="checkbox" name="hobby" value="0"/>잠자기</label>
		<label> <input type="checkbox" name="hobby" value="1"/>술마시기</label>
		<label> <input type="checkbox" name="hobby" value="2"/>노래하기</label>
		<label> <input type="checkbox" name="hobby" value="3"/>춤추기</label>
		<br />
		가입인사 : <br />
		<textarea rows="5" cols="50" name="comment"></textarea>
		<br />
		연령대 : 
		<select name="age">
			<option value="1">10대</option>
			<option value="2">20대</option>
			<option value="3">30대</option>
			<option value="4">40대</option>
		</select>
		<br />
		<input type="submit" value="전송"/>
	</form>
</body>
</html>