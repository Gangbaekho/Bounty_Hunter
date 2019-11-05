<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.db.MemberDB"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.QuestionDTO"%>
<%@page import="data.db.QuestionDB"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	QuestionDB db = new QuestionDB();
	MemberDB mdb = new MemberDB();
	String myid = (String)session.getAttribute("myid");
    int mnum = mdb.getNumByMyid(myid);
    String name = mdb.getName(myid);
    int q_start = Integer.parseInt(request.getParameter("q_start"));
   	List <QuestionDTO> list = db.getList(mnum, q_start);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<list>
	<%
		for(QuestionDTO dto: list){%>
			<myqna>
				<num><%= dto.getNum() %></num>
				<name><%= name %></name>
				<myid><%= myid %></myid>
				<title><%= dto.getTitle() %></title>
				<content><%= dto.getContent() %></content>
				<checked><%= dto.getChecked() %></checked>
				<modday><%= sdf.format(dto.getModday()) %></modday>
				<bounty><%= dto.getBounty() %></bounty>
			</myqna>
		<%}
	%>
</list>