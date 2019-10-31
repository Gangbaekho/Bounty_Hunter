<%@page import="data.db.MemberHashDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<%
		int mnum = Integer.parseInt(request.getParameter("mnum"));
		String hash = request.getParameter("hash");
		MemberHashDB db = new MemberHashDB();
		db.deleteMemberHash(mnum, hash);
	%>
</body>
</html>