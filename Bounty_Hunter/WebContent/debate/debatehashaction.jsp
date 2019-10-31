<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dto.MemberHashDTO"%>
<%@page import="data.db.MemberHashDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Bounty Hunter</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int mnum = Integer.parseInt(request.getParameter("mnum"));
		String hash = request.getParameter("newhash");
		
		MemberHashDB db = new MemberHashDB();
		MemberHashDTO dto = new MemberHashDTO();
		
		//dto에 mnum 값 넣어주기 
		dto.setMnum(mnum);
		
		//해시태그를 ,로 분리 후 MemberHashDB에 입력 
		StringTokenizer st = new StringTokenizer(hash, ",");
		while(st.hasMoreTokens()){
			dto.setHash(st.nextToken());
			db.insertMemberHash(mnum, dto.getHash());
		}
		
		//debatehash.jsp로 돌아가기
		response.sendRedirect("debatehash.jsp");
	%>
</body>
</html>