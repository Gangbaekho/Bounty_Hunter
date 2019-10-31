<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.MemberHashDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.MemberHashDB"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberHashDB db = new MemberHashDB();
	int mnum = Integer.parseInt(request.getParameter("mnum"));
	List<MemberHashDTO> list = db.getMemberHash(mnum);
%>
<list>
	<%
		for(MemberHashDTO dto: list){%>
			<memberhash>
				<mnum><%= dto.getMnum() %></mnum>
				<hash><%= dto.getHash() %></hash>
			</memberhash>
		<%}
	%>
</list>