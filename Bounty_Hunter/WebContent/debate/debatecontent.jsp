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
    <title>Bounty Hunter</title>
    <script>
    	$(function(){
    		
    		$(document).on("click","button.bounty_up",function(){
    			
    			var rnum = $(this).attr("value");
    			var bnum = $(this).attr("bnum");
    			
    			alert("rnum:"+rnum+"bnum:"+bnum);
    			
    			$.ajax({
    				type:"get",
    				url:"../xml/debatecontentajax.jsp",
    				dataType:"xml",
    				data:"rnum="+rnum+"&bnum="+bnum,
    				success:function(data){
    					
    				}
    			});
    			
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
  		
  		//myid로 mnum찾기
  		MemberDB mdb = new MemberDB();
  		String myid = (String)session.getAttribute("myid");
  		int mnum = mdb.getNumByMyid(myid);
  		
  		ReplyDB rdb = new ReplyDB();
  		
  		List<ReplyDTO> list = rdb.getReplyList(bnum);
  		
  		for(int i = 0 ; i < list.size() ; i++){
  			System.out.println(list.get(i).getContent());
  		}
  		
  %>
  <body>
    <div class="wall_background"></div>
    <div class="super">
      <div class="wanted">
        <p class="wanted_head">Wanted</p>        
        <h3 class="dora">DEAD or ALIVE</h3>
        <p>
        <%=dto.getTitle() %><br>
        <%=dto.getContent() %><br>
        <%=dto.getCount() %><br>
        <%=dto.getBounty() %><br>
        <%=dto.getCreateday() %><br>
        <%=dto.getImage() %><br>
        </p>
        <div class="top1_reply">
          안녕하세요
        </div>
        <div class="top2_reply">
          안녕하세요
        </div>
        <div class="top3_reply">
          안녕하세요
        </div>
        <div class="tape"></div>
        <div class="stamp">
          New Coment
        </div>
      </div>
    </div>
    <form action="debatecontentaction.jsp" method="post" id="frm">
    	<input class="myinput" type="text" name="content">
    	<input type="hidden" name="bnum" value="<%=bnum%>">
    	<input type="hidden" name="mnum" value="<%=mnum%>">
    	<input class="mysubmit" type="submit" value="댓글달기">
    </form>
    <div class="replylist">
    	<%
    		for(ReplyDTO rdto : list){%>
    		<p>
    		<%=rdto.getMnum() %><br>
    		<%=rdto.getBounty() %><br>
    		<%=rdto.getContent() %><br>
    		<%=rdto.getModday() %><br>
    		<button class="bounty_up" type="button" value="<%=rdto.getNum()%>" bnum="<%=bnum%>">$100</button>
    		</p>
    		<%}

    	%>
    </div>
  </body>
</html>
