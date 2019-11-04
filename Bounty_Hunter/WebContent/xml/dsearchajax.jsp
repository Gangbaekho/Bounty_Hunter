<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.BoardDB"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDB db = new BoardDB();
	String title = request.getParameter("title");
	List<BoardDTO> list = db.searchByTitle(title);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<list>
	<%for(BoardDTO dto: list){%>
		<board>
			<num><%= dto.getNum() %></num>
			<mnum><%= dto.getMnum() %></mnum>
			<title><%= dto.getTitle() %></title>
			<content><%= dto.getContent() %></content>
			<count><%= dto.getCount() %></count>
			<bounty><%= dto.getBounty() %></bounty>
			<modday><%= sdf.format(dto.getModday()) %></modday>
			<image><%= dto.getImage() %></image>
		</board>
	<%}%>
	</list>