<%@page import="data.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<%
	//id,pass,idsave 읽기
	 String id=request.getParameter("myid");
  	 String pass=request.getParameter("pass");
  	 
  	 
  	 //checkbox 체크인하면 null값
  	 String idsave=request.getParameter("idsave");
	//db 선언
	MemberDB db=new MemberDB();
	//isLogin 호출
	boolean b=db.isLogin(id, pass);
	
	//true일경우 -세션3가지저장,루트로 이동
	//false일경우-스크립트로 경고후 이전페이지
	if(b)
	{
		//세션저장
		session.setAttribute("loginok", "success");
		session.setAttribute("myid", id);
		//체크하면 yes, 체크 안하면 no
		session.setAttribute("idsave", idsave==null?"no":"yes");
		//세션 유지 시간
		session.setMaxInactiveInterval(60*60*9);
		//메인으로 이동
		response.sendRedirect("../");
	}else
	{%>
		<script type="text/javascript">
				alert("아이디나 비밀번호가 맞지 않습니다");
				history.back();
		</script>

	<%}

%>
</body>
</html>