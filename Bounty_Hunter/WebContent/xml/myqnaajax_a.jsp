<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.QreplyDTO"%>
<%@page import="data.db.QreplyDB"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.db.MemberDB"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	QreplyDB db = new QreplyDB();
	MemberDB mdb = new MemberDB();
	
	//세션에서 myid 읽어온 후 myid에 해당하는 mnum, name 가져오기 
	String myid = (String)session.getAttribute("myid");
    int mnum = mdb.getNumByMyid(myid);
    String name = mdb.getName(myid);
    
    //a_start 읽어오기 
    int a_start = Integer.parseInt(request.getParameter("a_start"));
    
    //mnum과 q_start에 해당하는 질문 가져오기 
   	List <QreplyDTO> list = db.getList(mnum, a_start);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<list>
	<%
		for(QreplyDTO dto: list){%>
			<myqna>
				<num><%= dto.getNum() %></num>
				<name><%= name %></name>
				<myid><%= myid %></myid>
				<content><%= dto.getContent() %></content>
				<checked><%= dto.getChecked() %></checked>
				<modday><%= sdf.format(dto.getModday()) %></modday>
				<listsize><%= list.size() %></listsize>
			</myqna>
		<%}
	%>
</list>