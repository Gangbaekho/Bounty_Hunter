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
	int bnum = Integer.parseInt(request.getParameter("writer"));
	int top1Num = Integer.parseInt(request.getParameter("top1"));
	int bounty = Integer.parseInt(request.getParameter("bounty"));
	
	MemberDB mdb = new MemberDB();
	
	int writerMnum = mdb.getMnumByBnum(bnum);
	
	mdb.giveBountyToMnum(writerMnum, bounty);
	mdb.giveBountyToMnum(top1Num, bounty);
	
	response.sendRedirect("../main/main.jsp");
	
%>
</body>
</html>