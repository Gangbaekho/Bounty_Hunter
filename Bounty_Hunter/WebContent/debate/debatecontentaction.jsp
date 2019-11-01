<%@page import="data.dto.ReplyDTO"%>
<%@page import="data.db.ReplyDB"%>
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
<%
	request.setCharacterEncoding("utf-8");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	MemberDB mdb = new MemberDB();
	String myid = (String)session.getAttribute("myid");
	int mnum = mdb.getNumByMyid(myid);
	String content = request.getParameter("content");
	
	System.out.println(bnum);
	
	//Reply Insert과정
	
	ReplyDB rdb = new ReplyDB();
	ReplyDTO dto = new ReplyDTO();

	dto.setBnum(bnum);
	dto.setMnum(mnum);
	dto.setContent(content);
	
	rdb.insertReply(dto);
	response.sendRedirect("debatecontent.jsp?bnum="+bnum);
%>
<body>
</body>
</html>