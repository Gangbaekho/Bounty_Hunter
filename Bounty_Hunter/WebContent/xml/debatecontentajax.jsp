<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.db.ReplyDB"%>
<%@page import="data.db.BoardDB"%>
<%@page import="data.dto.BoardDTO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int rnum = Integer.parseInt(request.getParameter("rnum"));
	
	BoardDB bdb = new BoardDB();
	ReplyDB rdb = new ReplyDB();
	
	
	
%>