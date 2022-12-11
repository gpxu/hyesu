<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 톰캣 9.x는 post 전송일 경우 한글이 깨진다. 
	// 한글이 깨지지 않으려면 인코딩 타입을 써줘야 한다.
	request.setCharacterEncoding("UTF-8");
	// 요청정보를 받는다.
	String name = request.getParameter("name");
	String password = request.getParameter("password");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청정보 받기</title>
</head>
<body>
	기본 :  <%=name %>(<%=password %>) <br />
	EL 사용 : ${param.name }(${param.password }) <br />
	<hr />
	성별 1 : <%=request.getParameter("gender") %> <br />
	성별 2 : ${param.gender } <br />
	<hr />
	성별 1 : <%=(request.getParameter("gender").equals("1") ? "남자":"여자") %> <br />
	성별 2 : ${param.gender=="1" ? "남자": "여자" } <br />
	<hr />
	<%-- getParameter로 받으면 1개밤 받아진다. --%>
	취미1 : <%=request.getParameter("hobby") %> <br />
	취미2 : ${param.hobby } <br />
	<hr />
	<%-- 폼태그의 name속성이 동일한것이 여러개일 경우는 배열로 받아야 한다. --%>
	<%-- getParameterValues로 받아야 모두 받아진다. --%>
	취미 2 : 
	<%
		String[] h = "잠자기,술마시기,노래하기,연애하기".split(",");
		String[] hobby = request.getParameterValues("hobby");
		if(hobby!=null && hobby.length>0){ // 데이터가 넘어왔다면
			for(String hh : hobby){
				int j = Integer.parseInt(hh);
				out.println(h[j] + " ");
			}
		}
	%>
	<br />
	취미 2 : ${paramValues.hobby[0] } ${paramValues.hobby[1] } ${paramValues.hobby[2] } ${paramValues.hobby[3] }
	<hr />	
	가입인사1 : <%=request.getParameter("comment").replace("\n", "<br>") %> <br />
	가입인사2 : ${param.comment } <br />
	<hr />
	연령대1 : <%=Integer.parseInt(request.getParameter("age"))*10 %>대 <br /> 
	연령대1 : ${param.age*10 }대 <br /> 
</body>
</html>