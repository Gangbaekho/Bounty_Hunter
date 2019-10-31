<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bounty Hunter</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body>
<%
 		request.setCharacterEncoding("utf-8");
%>
<!-- db 와  dto선언 -->
<jsp:useBean id="db" class="data.db.MemberDB"/>
<jsp:useBean id="dto" class="data.dto.MemberDTO"/>
<!-- dto 에 폼데이타 읽어서 넣어주기 -->
<jsp:setProperty property="*" name="dto"/>

<%
//db에 추가
db.insertMember(dto);
//성공 페이지로 이동
String s="../index.jsp?main=member/membersuccess.jsp";
response.sendRedirect(s);



%>
</body>
</html>