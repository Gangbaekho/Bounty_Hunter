<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.MemberDTO"%>
<%@page import="data.db.MemberDB"%>
<%@page import="data.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.BoardDB"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDB db = new BoardDB();
	MemberDB mdb = new MemberDB();
	String title = request.getParameter("title");
	List<BoardDTO> list = db.searchByTitle(title);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<list>
	<%for(BoardDTO dto: list){%>
		<board>
			<num><%= dto.getNum() %></num>
			<%
				int mnum = dto.getMnum();
				MemberDTO mdto = mdb.getMember(mnum);
				String myid = mdto.getMyid();
				String name = mdto.getName();
			%>
			<name><%= name %></name>
			<myid><%= myid %></myid>
			<title><%= dto.getTitle() %></title>
			<content><%= dto.getContent() %></content>
			<count><%= dto.getCount() %></count>
			<bounty><%= dto.getBounty() %></bounty>
			<modday><%= sdf.format(dto.getModday()) %></modday>
			<image><%= dto.getImage() %></image>
		</board>
	<%}%>
	</list>