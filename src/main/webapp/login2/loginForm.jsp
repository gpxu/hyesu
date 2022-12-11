<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 쿠키를 읽어서 쿠키에 userid가 저장되어 있다면 
	// 아이디 자리에 userid를 출력해주고
	// 아이디 저장을 체크해 주어야 한다.
	Cookie[] cookies = request.getCookies();
	String userid="";
	boolean hasCookie = false;
	if(cookies!=null && cookies.length>0){ //쿠키가 존재한다면
		for(Cookie c : cookies){
			if(c.getName().equals("userid")){ // userid쿠키가 있다면
				userid = c.getValue(); // 아이디를 쿠키 값으로 만들고
				hasCookie = true;
				break;
			}
		}
	}
	// 현재 로그인중인지 판단한다.
	boolean isLogin = false;
	if (session.getAttribute("userid")!=null){
		isLogin = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- Bootstrap과 Jquery를 사용하겠다. -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style type="text/css">
	table { width: 450px; margin: auto; padding: 10px; border: 1px solid gray; margin-top: 30px;}
	.title{
		text-align: center; padding: 5px; background-color: black; color: white;
		font-size: 18pt; font-weight: bold;
	}
	td { padding: 5px;}
	input[type="text"], input[type="password"] {
		border: 1px solid skyblue; width: 300px;
	}
	input[type="text"]:focus, input[type="password"]:focus {
		background-color: yellow;
	}
	#submitBtn {
		width: 120px; height: 70px; 
	}
	.check {text-align: center;}
</style>	
<script type="text/javascript">
	$(function(){
		$("#loginForm").submit(function() {
			var value = $("#userid").val();
			if(value==null || value.trim().length==0 || value.trim().indexOf(' ')>-1){
				alert('아이디가 없거나 아이디에 공백이 있습니다.');
				$("#userid").val("");
				$("#userid").focus();
				return false;
			}
			var value = $("#password").val();
			if(value==null || value.trim().length==0){
				alert('비밀번호는 반드시 입력해야 합니다.');
				$("#password").val("");
				$("#password").focus();
				return false;
			}
		});
	});
</script>	
</head>
<body>
	<% if(!isLogin){ %> <%-- 로그인 되어 있지 않으면 로그인 폼을 보여주고 --%>
	<form action="loginOk.jsp" method="post" id="loginForm">
		<table>
			<tr>
				<td colspan="2" class="title">로그인</td>
			</tr>
			<tr>
				<td> <input type="text" name="userid" id="userid" placeholder="아이디입력" tabindex="1" required="required" value="<%=userid%>"> </td>
				<td rowspan="2"> <input type="submit" value="로그인" id="submitBtn" tabindex="3"/> </td>
			</tr>
			<tr>
				<td> <input type="password" name="password" id="password" placeholder="비번입력" tabindex="2" required="required"> </td>
			</tr>
			<tr>
				<td colspan="2" class="check"> 
					<label> <input type="checkbox" name="saveid" value="true"  <%=(hasCookie ?" checked='checked' ":"")%>/> 아이디 저장 </label>
				</td>
			</tr>
		</table>
	</form>
	<%}else{ %> <%-- 로그인 되어 있으면 로그아웃 폼을 보여 줘야 한다. --%>
		<table>
			<tr>
				<td colspan="2" class="title">로그아웃</td>
			</tr>
			<tr>
				<td> <%=session.getAttribute("userid") %>님 반갑습니다.</td>
				<td rowspan="2"> <input type="button" value="로그아웃" onclick="location.href='logout.jsp'"/> </td>
			</tr>
			<tr>
				<td> 포인트 : 100점, 등급 : 3단계 </td>
			</tr>
		</table>
	<%} %>
</body>
</html>