<%@page import="data.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bounty Hunter</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<%
		MemberDB db=new MemberDB();
		//세션으로 아이디 얻기
		String myid=(String)session.getAttribute("myid");
		//db로부터 로그인한 사람의 이름얻기
		String name=db.getName(myid);
%>
<body>
	<div style="padding: 5px 5px; border: 1px solid gray; height: 200px;">		
		<img alt="" src="image/kakao1.gif" width="100px" height="100px"
			align="left">
			<b><%=name %>님</b>
			<br><br>
			<button type="button" class="btn btn-default btn-sm"
						onclick="location.href='login/logoutaction.jsp'">
							로그아웃
			</button>
	</div>	
</body>
</html>