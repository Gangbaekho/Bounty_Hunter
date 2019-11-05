<%@page import="data.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="../css/myqna.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
      rel="stylesheet"
    />
    <title>Bounty Hunter</title>
    <%
    	MemberDB db = new MemberDB();
    	
    %>
    <script type="text/javascript">
    	$(function(){
    		var q_start=1;
    		$.ajax({
    			type: "post",
    			url: "../xml/myqnaajax_q.jsp",
    			data: {"q_start": q_start},
    			dataType: "xml",
    			success: function(data){
    				str = '<ul class="timeline-list">';
    				$(data).find("myqna").each(function(idx){
    					var s = $(this);
    					str += '<li>';
        				str += '<div class="content">';
    					str += '<h3>'+s.find("title").text()+'<span class="modday">'+s.find("modday").text()+'</span></h3>';
    					str += '<p>';
    					str += s.find("content").text();
    					str += '</p>';
    					str += '</div>';
    					str += '</li>';
    				});      
    	            str += '</ul>';
    	            $("#out").html(str);
    			},
    			statusCode: {
					404: function(){
						alert("해당 url을 찾을 수 없습니다");
					},
					500: function(){
						alert("서버 오류");
					}
				}
    		});
    	});
    </script>
  </head>
  <body>
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
                <p class="subtitle">
                  내가 한 질문을 알아볼까요?
                </p>
              </header>
              <div id="out"></div>
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
                <p class="subtitle">
                  내가 한 답변을 알아볼까요?
                </p>
              </header>
              <ul class="timeline-list timeline-list2">
                <li>
                  <div class="content">
                    <h3>A timeline?<span class="modday">오늘의날짜.</span></h3>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    </p>
                  </div>
                </li>
                <li>
                  <div class="content">
                    <h3>A timeline?<span class="modday">오늘의날짜.</span></h3>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    </p>
                  </div>
                </li>
                <li>
                  <div class="content">
                    <h3>A timeline?<span class="modday">오늘의날짜.</span></h3>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    </p>
                  </div>
                </li>
              </ul>
              <img
                class="question_left_arrow mybutton"
                src="../image/arrow2.png"
                width="50"
                alt=""
              />
              <img
                class="question_right_arrow mybutton"
                src="../image/arrow2.png"
                width="50"
                alt=""
              />
              <img
                class="answer_left_arrow mybutton"
                src="../image/arrow2.png"
                width="50"
                alt=""
              />
              <img
                class="answer_right_arrow mybutton"
                src="../image/arrow2.png"
                width="50"
                alt=""
              />
            </div>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>

