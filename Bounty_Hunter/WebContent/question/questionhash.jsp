<%@page import="data.db.MemberDB"%>
<%@page import="data.dto.MemberHashDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.MemberHashDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="../css/questionhash.css" />
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <title>Document</title>
    <script>
      $(function() {
        $(".link").click(function() {
          var hash = $(this)
            .children("span")
            .html().substring(1);
          
          $.ajax({
        	  type:"get",
        	  url:"../xml/questionhashajax.jsp",
        	  dataType:"xml",
        	  data:"hash="+hash,
        	  success: function(data){
        		  
        		  var str="";
        		  str+="<table class='table table-hover'>";
        		  str+="<tr><th>#Num</th><th>Checked</th><th>Title</th><th>modify date</th><th>Name(ID)</th></tr>"
        		  $(data).find("question").each(function(){
        
                      var s = $(this);
              
                      str+="<tr>";
                      str+="<td>"+s.find("qnum").text()+"</td>";
                      str+="<td>"+s.find("checked").text()+"</td>";
                      str+="<td>"+s.find("title").text()+"</td>";
                      str+="<td>"+s.find("modday").text()+"</td>";
                      str+="<td>"+s.find("name").text()+"("+s.find("myid").text()+")"+"</td>";
                      str+="</tr>";
                });
        		  str+="</table>";
        		  
				$("#questionlist").append(str);
        		  
        	  }
          });
          
        });
      });
    </script>
  </head>
  <%
  	MemberHashDB db = new MemberHashDB();
  	MemberDB mdb = new MemberDB();
  	String myid = (String)session.getAttribute("myid");
  	int mnum = mdb.getNumByMyid(myid);
  	
  	List<MemberHashDTO> list = db.getMemberHash(mnum);
  	int listSize = list.size();
  	int divide = listSize/3;
  	int mod = listSize%3;
  	if(mod != 0)
  		divide++;
  	
  %>
  <body>
    <div class="super">
    
    <%
    	for(int i = 0 ; i <= divide-1 ; i++){%>
    		<div class="hashbox">
    		<%
    		for(int j = i*3 ; j <= (i*3+2 >= listSize ? listSize-1 :i*3+2) ; j++ ){
    			%>
    			<div class="mydivdiv">
    			<a href="#" class="link"><span>#<%=list.get(j).getHash() %></span></a>
    			</div>
    		<%}%>
    		</div>
    		<%
    	}
    %>
  		
      <div class="questionlist" id="questionlist">
        <h1 style="text-align: center;">Question List</h1>
      </div>
    </div>
  </body>
</html>
    