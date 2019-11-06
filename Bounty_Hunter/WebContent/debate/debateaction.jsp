<%@page import="data.dto.BoardDTO"%>
<%@page import="data.db.BoardDB"%>
<%@page import="data.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<%
	request.setCharacterEncoding("utf-8");

	MemberDB db = new MemberDB();
	String myid = (String)session.getAttribute("myid");
	int mnum = db.getNumByMyid(myid);
	
	BoardDB bdb = new BoardDB();
	BoardDTO bdto = new BoardDTO();
	
 	
	
	String subject=request.getParameter("subject");
	String upload=request.getParameter("upload");
	String content=request.getParameter("content");

	if(db.getMember(mnum).getBounty()-500<0){%>
		
		<script>
			alert("보유하고 있는 돈이 $500 미만입니다.\n 현상금을 더 모아주세요.");
			history.back();
		</script>
		
	<%}else{
	
	bdto.setContent(content);
	bdto.setTitle(subject);
	bdto.setImage(upload);
	
	bdb.insertBoard(mnum, bdto);
	bdb.decreaseBounty(mnum);
	
	response.sendRedirect("stableform.jsp");
	}
%>
<body>

</body>
</html>