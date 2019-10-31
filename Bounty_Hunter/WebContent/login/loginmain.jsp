<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bounty Hunter</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body>
<%
	//세션으로부터 login ok 값을 얻는다
	String loginok=(String)session.getAttribute("loginok");

	//loginok 가 null일경우 loginform
	//yes 일경우 logoutform
	
	if(loginok==null)
	{%>
		<jsp:include page="loginform.jsp"/>
		
	<%}else{%>
	<jsp:include page="logoutform.jsp"/>
		
	<%}

%>
</body>
</html>