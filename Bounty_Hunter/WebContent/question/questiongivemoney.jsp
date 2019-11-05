<%@page import="data.db.QreplyDB"%>
<%@page import="data.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int mnum = Integer.parseInt(request.getParameter("mnum"));
	int bounty = Integer.parseInt(request.getParameter("bounty"));
	int num = Integer.parseInt(request.getParameter("num"));
	
	MemberDB db = new MemberDB();
	db.giveBountyToMnum2(mnum, bounty);
	
	QreplyDB qdb = new QreplyDB();
	qdb.qreplyIsChecked(num);
	
	response.sendRedirect("../main/main.jsp");
%>
</body>
</html>