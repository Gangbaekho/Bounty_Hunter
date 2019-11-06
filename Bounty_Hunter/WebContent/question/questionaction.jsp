<%@page import="data.dto.MemberDTO"%>
<%@page import="data.db.MemberDB"%>
<%@page import="data.db.QuestionHashDB"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dto.QuestionDTO"%>
<%@page import="data.db.QuestionDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bounty Hunter</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		int mnum = Integer.parseInt(request.getParameter("mnum"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String hash = request.getParameter("hash");
		String myid = request.getParameter("myid");
		int bounty = Integer.parseInt(request.getParameter("expense"));

		QuestionDB qdb = new QuestionDB();
		QuestionDTO qdto = new QuestionDTO();
		QuestionHashDB hdb = new QuestionHashDB();
		MemberDB mdb = new MemberDB();
		MemberDTO mdto = mdb.getMember(mnum);
		
		qdto.setMnum(mnum);
		qdto.setTitle(title);
		qdto.setContent(content);
		qdto.setMnum(mnum);
		qdto.setBounty(bounty);
		
		if(qdto.getBounty()-bounty < 0){%>
			<script>
				alert("돈이 부족합니다. 다시 입력해주세요");
				history.back();
			</script>
		<%}else{
	
		//QuestionDB에 저장 
		qdb.insertQuestion(qdto);
		
		//질문자의 bounty 차감
		qdb.decreaseBounty(bounty, mnum);
				
		//hash을 ,로 짤라주기
		int max = hdb.getMaxQuestionNum();
		
		StringTokenizer st = new StringTokenizer(hash, ",");
		while (st.hasMoreTokens()) {
			hdb.insertQuestionHash(max,st.nextToken());
		}
		
		response.sendRedirect("myqna.jsp");
		
		}%>
</body>
</html>