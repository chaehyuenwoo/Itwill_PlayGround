<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="<%=cp%>/test2/mem.action" method="post">

이름 : ${info.name }<br/>
주민번호 : ${info.ssn }<br/>
아이디 : ${info.id }<br/>
패스워드 : ${info.pwd }<br/>
구분 : ${info.type }<br/>

<input type="submit" name="_target1" value="이전입력"/>
<input type="submit" name="_finish" value="회원가입"/>
<input type="submit" name="_cancel" value="가입취소"/>
</form>


</body>
</html>