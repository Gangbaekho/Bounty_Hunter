<%@page import="data.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.db.QuestionDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bounty Hunter</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/questionsearch.js"></script>
<link rel="stylesheet" type="text/css" href="../css/questionsearch.css" />
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet" />
<script type="text/javascript">
		$(function(){
			
			//text 창에서 엔터 클릭 시 search 되도록 하기 
			$("#qsearch").keyup(function(e) {
				if(e.keyCode==13){
					var hash = $(this).val();
					/* alert(hash); */
					$.ajax({
						type: "get",
						url: "../xml/qsearchajax.jsp",
						dataType: "xml",
						data: {"hash": hash},
						success: function(data){
							var str = '<div class="container">';
					        str += '<ul class="responsive-table">';
					        str += '<li class="table-header">';
					        str += '<div class="col col-1">Num</div>';
					        str += '<div class="col col-2">Answered</div>';
					        str += '<div class="col col-3" style="text-align: left; padding-left: 30px;">Title</div>';
					        str += '<div class="col col-4" style="text-align: right; padding-right: 30px;">Write day</div>';

							$(data).find("question").each(function(idx){
								var s = $(this);
								str += '</li>';
						       	str += "<li class='table-row' qnum='"+s.find("num").text()+"'>";
						        str += '<div class="col col-1" data-label="Job Id">'+(idx+1)+'</div>';
								if(s.find("checked").text()=="y"){
									str += '<div class="col col-2" data-label="Customer Name"><img src="../image/checked.svg" id="checked"></div>';
								} else{
									str += '<div class="col col-2" data-label="Customer Name"><img src="../image/unchecked.svg" id="checked"></div>'; 
								}
								str += '<div class="col col-3" data-label="Amount" style="text-align: left; padding-left: 25px;">'+s.find("title").text()+'</div>';
						       	str += '<div class="col col-4" data-label="Payment Status" style="text-align: right; padding-right: 25px;">'+s.find("modday").text()+'</div>';
						        str += ' </li>';
							});
							 str += '</ul>';
						     str += '</div>';
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
				}
			});
			
			//돋보기 이미지 클릭시 search
			$("#mglass").click(function(){
				var hash = $(this).prev().find("#qsearch").val();
				/* alert(hash); */
				$.ajax({
					type: "get",
					url: "../xml/qsearchajax.jsp",
					dataType: "xml",
					data: {"hash": hash},
					success: function(data){
						var str = '<div class="container">';
				        str += '<ul class="responsive-table">';
				        str += '<li class="table-header">';
				        str += '<div class="col col-1">Num</div>';
				        str += '<div class="col col-2">Answered</div>';
				        str += '<div class="col col-3" style="text-align: left; padding-left: 30px;">Title</div>';
				        str += '<div class="col col-4" style="text-align: right; padding-right: 30px;">Write day</div>';

						$(data).find("question").each(function(idx){
							var s = $(this);
							str += '</li>';
					       	str += "<li class='table-row'>";
					       	console.log(s.find("num").text());
					        str += '<div class="col col-1" data-label="Job Id">'+(idx+1)+'</div>';
							if(s.find("checked").text()=="y"){
								str += '<div class="col col-2" data-label="Customer Name"><img src="../image/checked.svg" id="checked"></div>';
							} else{
								str += '<div class="col col-2" data-label="Customer Name"><img src="../image/unchecked.svg" id="checked"></div>'; 
							}
							str += '<div class="col col-3" data-label="Amount" style="text-align: left; padding-left: 25px;">'+s.find("title").text()+'</div>';
					       	str += '<div class="col col-4" data-label="Payment Status" style="text-align: right; padding-right: 25px;">'+s.find("modday").text()+'</div>';
					        str += ' </li>';
						});
						 str += '</ul>';
					     str += '</div>';
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
			
	        $(document).on("click","li.table-row",function(){
	        	
	        	var go = $(this).attr("qnum");
	        	console.log(go);
	        	location.href="questioncontent.jsp?qnum="+go;
	        	
	        });
		});
	</script>
</head>
<%
	String hash = request.getParameter("hash");
	QuestionDB db = new QuestionDB();
	List<QuestionDTO> list = db.searchByQhash(hash);
%>
<body>
	<div class="bgimg">
		<div class="super">
			<div class="logo" onclick="location.href='../main/main.jsp'">Bounty Hunter</div>
			<div class="searchbar">
				<div class="hashcontainer">
					<input type="text" id="qsearch" name="qsearch" required autofocus>
					<div class="hashtag"></div>
				</div>
			<img src="../image/mglass.png" alt="magnifying glass" id="mglass"
				onclick="location.href='#'">
			<div id="out"></div>
		</div>
	</div>
	</div>
</body>
</html>