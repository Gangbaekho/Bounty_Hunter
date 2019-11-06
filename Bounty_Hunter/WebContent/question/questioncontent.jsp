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
<link href="https://fonts.googleapis.com/css?family=Lobster|Nanum+Myeongjo|Special+Elite&display=swap" rel="stylesheet">
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
			<span style="float:left;font-size:15px;font-weight:bold;padding-top:10px;">작성자 : <%=mdb.getMember(dto.getMnum()).getName() %>(<%=mdb.getMember(dto.getMnum()).getMyid() %>) </span><span style="float:right;font-size:15px;font-weight:bold;padding-top:10px;"><%=dto.getModday() %></span>
			<br><br><br><br>
			<div style="text-align:center;"><img src="../image/qmark.png" width="150"><img src="../image/qmark.png" width="150"><img src="../image/qmark.png" width="150"></div>
			<h1 style="text-align:center;padding-top:30px;"><%=dto.getTitle() %></h1>
			<p><%=dto.getContent() %></p>
			<div style="position:absolute;bottom:50px; width:600px;">
				<div class="money" style="display:flex;align-items:center; justify-content: center; margin:0 auto;">
					<img src="../image/usd2.png" width="60"> 
					<span style="font-size:40px;font-weight:bold;"><%=dto.getBounty() %></span>
				</div>
			</div>
				
			
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
					
						<%
							if(qdto.getChecked().equals("y")){%>
								<span style="float:right"><img src="../image/checked.svg" class="checked" style="width:30px; float:right"></span>
							<%}else{%>
								<span style="float:right"><img src="../image/unchecked.svg" class="checked" style="width:30px;float:right"></span>
							<%}
						%>
					
					<% if(mnum == dto.getMnum())
					{%>
					<form action="questiongivemoney.jsp" method="get" id="frm3">
						<input type="hidden" name="mnum" value="<%=qdto.getMnum() %>">
						<input type="hidden" name="num" value="<%=qdto.getNum() %>">
						<input type="hidden" name="bounty" value="<%=dto.getBounty() %>">
						<input type="hidden" name="qnum" value="<%=qnum%>">
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