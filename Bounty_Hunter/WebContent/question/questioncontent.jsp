<%@page import="data.dto.QuestionDTO"%>
<%@page import="data.db.QuestionDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/questioncontent.css" />
<link
	href="https://fonts.googleapis.com/css?family=Lobster|Special+Elite&display=swap"
	rel="stylesheet" />
<title>Insert title here</title>
</head>
<%
	int qnum = Integer.parseInt(request.getParameter("qnum"));
	QuestionDB qdb = new QuestionDB();
	QuestionDTO dto = qdb.getQuestion(qnum);
	
%>
<body>
	<div class="super">
		<div class="wanted">
			<p class="wanted_head">Wanted</p>
			<h3 class="dora">DEAD or ALIVE</h3>
			<p>
				<%=dto.getContent() %>
			</p>
		</div>
</body>
</html>