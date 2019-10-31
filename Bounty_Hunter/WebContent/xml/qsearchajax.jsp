<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.QuestionDB"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QuestionDB db = new QuestionDB();
	String hash = request.getParameter("hash");
	List<QuestionDTO> list = db.searchByQhash(hash);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<list>
	<%for(QuestionDTO dto: list){%>
		<question>
			<num><%= dto.getNum() %></num>
			<title><%= dto.getTitle() %></title>
			<checked><%= dto.getChecked() %></checked>
			<modday><%= sdf.format(dto.getModday()) %></modday>
		</question>
	<%}%>
	</list>