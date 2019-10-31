<%@page import="data.dto.BoardDTO"%>
<%@page import="data.db.BoardDB"%>
<%@page import="data.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<%
	request.setCharacterEncoding("utf-8");

	MemberDB db = new MemberDB();
	String myid = (String)session.getAttribute("myid");
	int mnum = db.getNumByMyid(myid);
	
	BoardDB bdb = new BoardDB();
	BoardDTO bdto = new BoardDTO();
	
	String subject=request.getParameter("subject");
	String upload=request.getParameter("upload");
	String content=request.getParameter("content");

	
	bdto.setContent(content);
	bdto.setTitle(subject);
	bdto.setImage(upload);
	
	bdb.insertBoard(mnum, bdto);
	
	response.sendRedirect("stableform.jsp");
%>
<body>

</body>
</html>