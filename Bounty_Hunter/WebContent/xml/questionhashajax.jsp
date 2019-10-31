<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.QuestionByHashDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.QuestionDB"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hash = request.getParameter("hash");
	QuestionDB db = new QuestionDB();
	List<QuestionByHashDTO> list = db.getQuestionListByHash(hash);
%>

<list>
	<%
		for(QuestionByHashDTO dto : list){%>
			<question>
				<title><%=dto.getTitle() %></title>
				<checked><%=dto.getChecked() %></checked>
				<modday><%=dto.getModday() %></modday>
				<name><%=dto.getName() %></name>
				<myid><%=dto.getMyid() %></myid>
				<qnum><%=dto.getQnum() %></qnum>
			</question>
		<%}
	%>
</list>
