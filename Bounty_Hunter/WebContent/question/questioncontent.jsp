<%@page import="data.db.MemberDB"%>
<%@page import="data.dto.QreplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.QreplyDB"%>
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
	String myid = (String)session.getAttribute("myid");

	int qnum = Integer.parseInt(request.getParameter("qnum"));
	QuestionDB qdb = new QuestionDB();
	QuestionDTO dto = qdb.getQuestion(qnum);
	
	MemberDB mdb = new MemberDB();
	
	QreplyDB qrdb = new QreplyDB();
	List<QreplyDTO> list = qrdb.getQreplyListByQnum(qnum);
	
	int mnum = mdb.getNumByMyid(myid);
	
%>
<body>
	<div class="super">
		<div class="wanted">
			<p class="wanted_head">Wanted</p>
			<h3 class="dora">DEAD or ALIVE</h3>
			<p>
				체크여부 : <%=dto.getChecked() %><br>
				내용: <%=dto.getContent() %><br>
				현상금 : <%=dto.getBounty() %><br>
				작성자 : <%=dto.getMnum() %><br>
				제목 : <%=dto.getTitle() %><br>
				생성날짜 :<%=dto.getCreateday()%><br>
				수정날짜 :<%=dto.getModday() %>
				
			</p>
		</div>
	<div class="list-type3">
		<ol>
			<li style="heigth:300px;">
				 <a>
			 		<form action="questioncontentaction.jsp" method="post" id="frm">
    					<textarea class="mytextarea" type="text" name="content"></textarea>
    					<input type="hidden" name="qnum" value="<%=qnum%>">
    					<input type="hidden" name="mnum" value="<%=mnum%>">
    					<input class="mysubmit" type="submit" value="댓글달기">
   					 </form>
   			 	</a>
			</li>
		<%for(QreplyDTO qdto : list){%>
			<li>
				<a class="mylist">
					<p class="modday"><%=qdto.getModday() %></p> 
					<h4><%=mdb.getMember(qdto.getMnum()).getName() %><%=qdto.getMnum() %>(<%=mdb.getMember(qdto.getMnum()).getMyid() %>)</h4> 
					<p class="mycontent"><%=qdto.getContent() %></p>
					
					<span class="mybounty" style="float:right;">
						<b style="font-size:20px; line-height:20px;"><%=qdto.getChecked() %></b>
					</span>
					<% if(mnum == dto.getMnum())
					{%>
					<form action="questiongivemoney.jsp" method="get" id="frm3">
						<input type="hidden" name="mnum" value="<%=qdto.getMnum() %>">
						<input type="hidden" name="bounty" value="<%=dto.getBounty() %>">
						<input type="submit" value="채택하기">
					</form>
						
					<%}
						%>

				</a>
			</li>
		<%}
			%>
		
		</ol>
	</div>
</body>
</html>