<%@page import="data.db.SearchAPI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String word = request.getParameter("word");
	String genre = request.getParameter("genre");
	
	SearchAPI api = new SearchAPI();
	if(genre.equals("book")){%>
		<%=api.bookSearch(word) %>
		
	<%}else{%>
		<%=api.movieSearch(word) %>
	<%}
%>