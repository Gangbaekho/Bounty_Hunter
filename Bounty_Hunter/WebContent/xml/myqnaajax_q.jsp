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
	
	//세션에서 myid 읽어온 후 myid에 해당하는 mnum, name 가져오기 
	String myid = (String)session.getAttribute("myid");
    int mnum = mdb.getNumByMyid(myid);
    String name = mdb.getName(myid);
    
    //q_start 읽어오기 
    int q_start = Integer.parseInt(request.getParameter("q_start"));
    
    //mnum과 q_start에 해당하는 질문 가져오기 
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
				<listsize><%= list.size() %></listsize>
				<qnum><%= dto.getNum() %></qnum>
			</myqna>
		<%}
	%>
</list>