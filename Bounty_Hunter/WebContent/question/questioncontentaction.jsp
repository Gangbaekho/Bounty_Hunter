<%@page import="data.db.QreplyDB"%>
<%@page import="data.dto.QreplyDTO"%>
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
	request.setCharacterEncoding("utf-8");
	int mnum = Integer.parseInt(request.getParameter("mnum"));
	int qnum = Integer.parseInt(request.getParameter("qnum"));
	String content = request.getParameter("content");
	
	QreplyDTO dto = new QreplyDTO();
	dto.setMnum(mnum);
	dto.setQnum(qnum);
	dto.setContent(content);
	
	QreplyDB db = new QreplyDB();
	db.insertQreply(dto);
	
	response.sendRedirect("questioncontent.jsp?qnum="+qnum);
%>
</body>
</html>