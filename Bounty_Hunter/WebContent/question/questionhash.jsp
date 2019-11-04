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
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet" />
<title>Bounty Hunter</title>
<script>
      $(function() {
        $(".link").click(function() {
        	
        	$("#questionlist").html("");
        	
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
        		  str+="<ul class='responsive-table'>";
        		  str+=" <li class='table-header'>";
        		  str+="<div class='col col-1' data-label='Job Id'>#Num</div>";
        		  str+="<div class='col col-2' data-label='Job Id'>Answered</div>";
        		  str+="<div class='col col-3' data-label='Job Id'>Title</div>";
        		  str+="<div class='col col-4' data-label='Job Id'>Name(Id)</div>";
        		  str+="<div class='col col-5' data-label='Job Id'>Writeday</div>";
        		  str+="</li>";
        		  $(data).find("question").each(function(){
        
                      var s = $(this);
              
                      str+="<li class='table-row' qnum='"+s.find("qnum").text()+"'>";
                      str+="<div class='col col-1' data-label='Job Id'>"+s.find("qnum").text()+"</div>";
                      if(s.find("checked").text()=="y"){
							str += '<div class="col col-2" data-label="Customer Name"><img src="../image/checked.svg" id="checked"></div>';
						} else{
							str += '<div class="col col-2" data-label="Customer Name"><img src="../image/unchecked.svg" id="checked"></div>'; 
						}
                      str+="<div class='col col-3' data-label='Job Id'>"+s.find("title").text()+"</div>";
                      str+="<div class='col col-4' data-label='Job Id'>"+s.find("name").text()+"("+s.find("myid").text()+")"+"</div>";
                      str+="<div class='col col-5' data-label='Job Id'>"+s.find("modday").text()+"</div>";
                     
                      str+="</li>";
                });
        		  str+="</ul>";
        		  
				$("#questionlist").append(str);
        		  
        	  }
          });
          
        });
        
        $(document).on("click","li.table-row",function(){
        	
        	var go = $(this).attr("qnum");
        	location.href="questioncontent.jsp?qnum="+go;
        	
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
		<div class="logo" onclick="location.href='../main/main.jsp'">Bounty
			Hunter</div>
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

		<div class="questionlist" id="questionlist"></div>
	</div>
</body>
</html>
