<%@page import="data.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.QuestionDB"%>
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
	rel="stylesheet" />
<title>Bounty Hunter</title>
<%
    	MemberDB db = new MemberDB();   
		QuestionDB qdb = new QuestionDB();
		String myid = (String)session.getAttribute("myid");
		int mnum = db.getNumByMyid(myid);
		List<QuestionDTO> qlist = qdb.getAllQuestionByMnum(mnum);
		List<QuestionDTO> alist = qdb.getQtitleByMnum(mnum);
%>
<script type="text/javascript">
		var q_start=1;
		var a_start=1;
    	$(function(){
    		qlist();
    		alist();
    		
    		//question의 왼쪽 화살표 클릭 
    		$(".question_left_arrow").click(function(){
    			if(q_start>4){
					q_start = q_start-3;
    			} else{
    				q_start = 1;
    			}
        		qlist();
    		});
    		
    		//question의 오른쪽 화살표 클릭 
    		$(".question_right_arrow").click(function(){
    			if(q_start>0 && q_start+3<<%=qlist.size()%>){
					q_start += 3;
    			}
        		qlist();
    		});
    			
    		//answer의 왼쪽 화살표 클릭 
    		$(".answer_left_arrow").click(function(){
    			if(a_start>4){
					a_start = a_start-3;
    			} else{
    				a_start = 1;
    			}
        		alist();
    		});
    		
    		//answer의 오른쪽 화살표 클릭 
    		$(".answer_right_arrow").click(function(){
    			if(a_start>0 && a_start+3<<%=alist.size()%>){
					a_start += 3;
    			}
        		alist();
    		});
    		
    });   

	
	function qlist(){
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
	            $("#q_out").html(str);
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
}
		function alist(){
			$.ajax({
				type: "post",
				url: "../xml/myqnaajax_a.jsp",
				data: {"a_start": a_start},
				dataType: "xml",
				success: function(data){
					str = '<ul class="timeline-list timeline-list2">';
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
		            $("#a_out").html(str);
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
		}
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
							<p class="subtitle">내가 한 질문을 알아볼까요?</p>
						</header>
						<div id="q_out"></div>
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
						<div id="a_out"></div>
						<img class="question_left_arrow mybutton"
							src="../image/arrow2.png" width="50" alt="" /> <img
							class="question_right_arrow mybutton" src="../image/arrow2.png"
							width="50" alt="" /> <img class="answer_left_arrow mybutton"
							src="../image/arrow2.png" width="50" alt="" /> <img
							class="answer_right_arrow mybutton" src="../image/arrow2.png"
							width="50" alt="" />
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>

