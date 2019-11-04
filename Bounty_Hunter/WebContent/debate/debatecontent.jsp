<%@page import="data.dto.ReplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.ReplyDB"%>
<%@page import="data.db.MemberDB"%>
<%@page import="data.dto.BoardDTO"%>
<%@page import="data.db.BoardDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="../css/debatecontent.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Lobster|Special+Elite&display=swap"
      rel="stylesheet"
    />
    <script src="../js/numberAnimate.js"></script>
    <title>Bounty Hunter</title>
    <script>
    	$(function(){
    		
    		
    		$(document).on("click","img.imagebutton",function(){
    			
    			var s = $(this);
    			
    			var rnum = $(this).attr("value");
    			var bnum = $(this).attr("bnum");
    			
    			$.ajax({
    				type:"get",
    				url:"../xml/debatecontentajax.jsp",
    				dataType:"xml",
    				data:"rnum="+rnum+"&bnum="+bnum,
    				success:function(data){
    					s.parent().find("b").html($(data).find("rBounty").text());
    					$(".boardbounty").find("b").html($(data).find("bBounty").text());
    			
    				}
    			});
    			
    		});
    		
    		$("#end").click(function(){
    			
    			$("#frm1").submit();
    			
    		});
    		
    	});
    </script>
  </head>
  <%
  		//bnum찾기
  		request.setCharacterEncoding("utf-8");
  		int bnum = Integer.parseInt(request.getParameter("bnum"));
  		BoardDB db = new BoardDB();
  		
  		BoardDTO dto = db.getBoard(bnum);
  		
  		db.increaseCount(bnum);
  		
  		//myid로 mnum찾기
  		MemberDB mdb = new MemberDB();
  		String myid = (String)session.getAttribute("myid");
  		int mnum = mdb.getNumByMyid(myid);
  		
  		ReplyDB rdb = new ReplyDB();
  		
  		List<ReplyDTO> list = rdb.getReplyList(bnum);
  		
 		List<ReplyDTO> top3List = rdb.getTop3ReplyList(bnum);
  		
  %>
  <body>
    <div class="wall_background"></div>
    <div class="super">
      <div class="wanted">
        <p class="wanted_head">Wanted</p>        
        <h3 class="dora">DEAD or ALIVE</h3>
<%--         <p class="bboard">
        <%=dto.getTitle() %><br>
        <%=dto.getContent() %><br>
        <%=dto.getCount() %><br>
        <%=dto.getCreateday() %><br>
        <%=dto.getImage() %><br>
        <span class="boardbounty"><img width="50" src="../image/usd2.png"><b><%=dto.getBounty() %></b></span><br>
        </p> --%>
        <div class="boardcontent">
        	<span class="content-span">조회수:<%=dto.getCount() %> 날짜:<%=dto.getCreateday() %></span><br>
        	<div class="centeralign">
				<img class="myimage" src="<%=dto.getImage() %>"><img class="myimage" src="<%=dto.getImage() %>"><img class="myimage" src="<%=dto.getImage() %>">
        	</div>
        	<h2><%=dto.getTitle() %></h2>
        	<p><%=dto.getContent() %></p><br>
        	<div class="centeralign">
        	<span class="boardbounty"><img class="imagebutton2" src="../image/usd2.png"><b><%=dto.getBounty() %></b></span>
        	</div>
        </div>
        <div class="top1_reply topreply">
		<% if(list.size() >=3){
			%>
			<h4><%=mdb.getMember(top3List.get(2).getMnum()).getName() %>(<%=mdb.getMember(top3List.get(2).getMnum()).getName() %>)<br>
    		<%=top3List.get(2).getModday() %></h4>
    		
    		<%=top3List.get(2).getContent() %><br>
	
    		<span class="mybounty"><img class="imagebutton" width="50" src="../image/usd2.png" value="<%=top3List.get(2).getNum() %>" bnum=<%=bnum %> ><b style="font-size:40px; line-height:50px;"><%=top3List.get(2).getBounty() %></b></span><br>
			<%}
			%>
		
        	
    		
        </div>
        <div class="top2_reply topreply">
  			<%if(list.size()>=2){%>
  				<h4><%=mdb.getMember(top3List.get(1).getMnum()).getName() %>(<%=mdb.getMember(top3List.get(1).getMnum()).getName() %>)<br>
  	    		<%=top3List.get(1).getModday() %></h4>
  	    		
  	    		<%=top3List.get(1).getContent() %><br>
  		
  	    		<span class="mybounty"><img class="imagebutton" width="50" src="../image/usd2.png" value="<%=top3List.get(1).getNum()%>" bnum="<%=bnum%>"><b style="font-size:40px; line-height:50px;"><%=top3List.get(1).getBounty() %></b></span><br>
  			<%}
  			%>
        </div>
        <div class="top3_reply topreply">
       		<%
       		if(list.size()>=1){%>
       			<h4><%=mdb.getMember(top3List.get(0).getMnum()).getName() %>(<%=mdb.getMember(top3List.get(0).getMnum()).getName() %>)<br>
    		<%=top3List.get(0).getModday() %></h4>
    		
    		<%=top3List.get(0).getContent() %><br>
	
    		<span class="mybounty"><img class="imagebutton" width="50" src="../image/usd2.png" value="<%=top3List.get(0).getNum()%>" bnum="<%=bnum%>"><b style="font-size:40px; line-height:50px;"><%=top3List.get(0).getBounty() %></b></span><br>
       		<%}
       		%>
        </div>
        <div class="tape"></div>
		<div class="stamp" id="end">종료하기</div>
      </div>
    </div>

	<div class="list-type3">
		<ol>
			<li style="heigth:300px;">
				 <a>
			 		<form action="debatecontentaction.jsp" method="post" id="frm">
    					<textarea class="mytextarea" type="text" name="content"></textarea>
    					<input type="hidden" name="bnum" value="<%=bnum%>">
    					<input type="hidden" name="mnum" value="<%=mnum%>">
    					<input class="mysubmit" type="submit" value="댓글달기">
   					 </form>
   			 	</a>
			</li>
		<%for(ReplyDTO rdto : list){%>
			<li>
				<a class="mylist">
					<p class="modday"><%=rdto.getModday() %></p> 
					<h4><%=mdb.getMember(rdto.getMnum()).getName() %>(<%=mdb.getMember(rdto.getMnum()).getMyid() %>)</h4> 
					<p class="mycontent"><%=rdto.getContent() %></p>
					
					<span class="mybounty" style="float:right;"><img class="imagebutton" width="50" src="../image/usd2.png" value="<%=rdto.getNum()%>" bnum="<%=bnum%>">
						<b style="font-size:20px; line-height:20px;"><%=rdto.getBounty() %></b>
					</span>
				</a>
			</li>
		<%}
			%>
		
		</ol>
	</div>
    <form action="debategivemoneyaction.jsp" method="get" id="frm1">
    	<input type="hidden" name="writer" value="<%=bnum %>">    	
    	<input type="hidden" name="top1" value="<%=list.size()>=1?top3List.get(0).getMnum():null %>">    	
    	<input type="hidden" name="bounty" value="<%=dto.getBounty() %>">    	
    </form>
  </body>
</html>
