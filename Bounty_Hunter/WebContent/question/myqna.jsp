<%@page import="data.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.QuestionDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet" href="../css/myqna.css" />
<link
   href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
   rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Document</title>
</head>
<style>
</style>


<body>

   <%!int num = 0;%>



   <%
      String myid = (String) session.getAttribute("myid");

      QuestionDB db = new QuestionDB();
      List<QuestionDTO> list = db.myqna(myid);
      System.out.println(list.size());
   %>

   <div class="myquestion"></div>
   <div class="myanswer"></div>

   <div class="super">
      <div class="question_main">
         <h1 class="subject1">Q&nbsp;&nbsp;</h1>
         <div class="content">
            <section class="block-content t-block-teal l-block-spacing">
               <div class="l-contained">
                  <header class="heading-group">
                     <h2>질문</h2>
                     <p class="subtitle">내가 한 질문을 알아볼까요?</p>
                  </header>
                  <ul class="timeline-list" id="first">
                     <%
                        if (list.size() == 0) {
                           System.out.println("데이터가 존재하지 않는다");

                        }
                        for (QuestionDTO dto : list) {

                           if (num < 3) {
                              num += 1;
                     %>



                     <li>
                        <div class="content">
                        <input type="hidden" value=3 class="count">
                           <h3>
                              <%=dto.getTitle()%><span class="modday"><%=dto.getCreateday()%></span>
                           </h3>
                           <p><%=dto.getContent()%>
                           </p>
                        </div></li>
                     <%
                        }
                        }
                        num = 0;
                     %>
                  </ul>


               </div>
            </section>
         </div>
      </div>
      <div class="answer_main">
         <h1 class="subject2">&nbsp;&nbsp;A</h1>
         <div class="content">
            <section class="block-content t-block-teal2 l-block-spacing">
               <div class="l-contained">
                  <header class="heading-group">
                     <h2>답변</h2>
                     <p class="subtitle">내가 한 답변을 알아볼까요?</p>
                  </header>
                  <ul class="timeline-list timeline-list2" id="second">
                     <li>
                        <div class="content">
                           <h3>
                              A timeline?<span class="modday">오늘의날짜.</span>
                           </h3>
                           <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                           </p>
                        </div>
                     </li>
                     <li>
                        <div class="content">
                           <h3>
                              A timeline?<span class="modday">오늘의날짜.</span>
                           </h3>
                           <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                           </p>
                        </div>
                     </li>
                     <li>
                        <div class="content">
                           <h3>
                              A timeline?<span class="modday">오늘의날짜.</span>
                           </h3>
                           <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                           </p>
                        </div>
                     </li>
                  </ul>
                  <img class="question_left_arrow mybutton"
                     src="../image/arrow2.png" width="50" alt=""/>
                      <img
                     
                     class="question_right_arrow mybutton" src="../image/arrow2.png"
                     
                     width="50" alt="" /> <img class="answer_left_arrow mybutton"
                     src="../image/arrow2.png" width="50" alt="" /> <img
                     class="answer_right_arrow mybutton" src="../image/arrow2.png"
                     width="50" alt=""  />
               </div>
            </section>
         </div>
      </div>
   </div>





   <script>
   $(function(){
      $(".question_left_arrow").css("display","none");
      $(".question_right_arrow").click(function(){
         $(".question_left_arrow").css("display","inline");
            
         var s="";
            
             var count=parseInt($(".count").val());
             var endCount=(count)+3;
             var StartCount=(count+1);
             var increase=0;
      
             if(count<<%=list.size()%>){ 
      <%for (QuestionDTO dto : list) {%>
            
      increase++;
        if(StartCount<=increase&&increase<=endCount){
         
      
   
      
      s+='<li><div class="content"><h3><%=dto.getTitle()%><span class="modday"><%=dto.getCreateday()%></span></h3><p><%=dto.getContent()%></p></div></li>';
         }
      
      
      
      <%}%>
      

        s+=" <input type='hidden'  value='"+endCount+"' class='count'>";
      
      
      
      $("#first").html(s);
         }
             
             if(endCount>=<%=list.size()%>){
                $(".question_right_arrow").css("display","none");
             }
         });
      
      
$(".question_left_arrow").click(function(){
   $(".question_right_arrow").css("display","inline");
         
         var s="";
            
           var count=parseInt($(".count").val());
             
           
             var endCount=(count)-3;
             var StartCount=(count)-5;
             var increase=0;
          
               
            
                
          if(count>3){ 
      <%for (QuestionDTO dto : list) {%>
            
      increase++;
        if(increase>=StartCount&&increase<=endCount){
         
   
          
      
      s+='<li><div class="content"><h3><%=dto.getTitle()%><span class="modday"><%=dto.getCreateday()%></span></h3><p><%=dto.getContent()%></p></div></li>';
         }
      
      
      
      <%}%>
      

        s+=" <input type='hidden'  value='"+endCount+"' class='count'>";
      
      
      
      $("#first").html(s);
          }
      if(endCount==3){
         $(".question_left_arrow").css("display","none");
      }
         
         });
   });
</script>













</body>
</html>
