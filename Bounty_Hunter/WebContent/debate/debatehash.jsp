<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="../css/debatehash.css" />
<link href="https://fonts.googleapis.com/css?family=Lobster|Nanum+Myeongjo&display=swap" rel="stylesheet">
<!-- 해시태그용 link  -->
   <link rel="stylesheet" href="../css/jquery.tag-editor2.css" />
    <script src="../js/jquery.tag-editor.js"></script>
    <script src="../js/jquery.caret.min.js"></script>
<!-- 이미지 슬라이더용 link -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha'
	rel='stylesheet' type='text/css'>
	<script type="text/javascript">
    $(function() {
        $("#hasharea1").tagEditor({
          placeholder: "해시태그를 입력하세요"
        });

        $("#btnsubmit").click(function() {
          var hashtag = $("#hasharea1");
          var mytags = hashtag.tagEditor("getTags")[0].tags;
          hashtag.attr("value", mytags);
        });
      });
	</script>
</head>
<%
	String myid = (String)session.getAttribute("myid");
%>
<body>
	<div class="cover-gray"></div>
	<div class="super">
		<div class="logo" onclick="location.href='../main/main.jsp'">Bounty Hunter</div>
		<div class="left-info">
			<!-- 이미지 슬라이더 -->
			<div id="wrapper ">
				<div id="slider-wrap">
					<ul id="slider">
						<li data-color="#1abc9c"><img src="../image/typing1.JPG"
							class="slideimg"></li>

						<li data-color="#3498db"><img src="../image/typing2.JPG"
							class="slideimg"></li>

						<li data-color="#9b59b6"><img src="../image/typing3.JPG"
							class="slideimg"></li>

						<li data-color="#34495e"><img src="../image/typing4.JPG"
							class="slideimg"></li>

						<li data-color="#e74c3c"><img src="../image/typing5.JPG"
							class="slideimg"></li>
						<li data-color="#e74c3c"><img src="../image/typing6.JPG"
							class="slideimg"></li>
					</ul>

					<!--controls-->
					<div class="btns" id="next">
						<i class="fa fa-arrow-right"></i>
					</div>
					<div class="btns" id="previous">
						<i class="fa fa-arrow-left"></i>
					</div>
					<div id="counter"></div>

					<div id="pagination-wrap">
						<ul>
						</ul>
					</div>
					<!--controls-->

				</div>

			</div>
			<h1 class="title-info">Type in <br> what you like</h1>
			<div class="colorbox"></div>
		</div>
		<div class="right-input">
			<div class="desc">
				<h3> <%= myid %>님의 해시태그 </h3>
			</div>
			<div class="yborder1">
				<textarea id="userhash"></textarea>
			</div>
			<div class="desc">
				<h3>관심 분야의 해시태그를 입력 해 주세요</h3>
			</div>
			<div class="yborder2">
				<textarea id="hasharea1"></textarea>
				<button type="submit" id="btnsubmit">Submit</button>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../js/debatehash.js"></script>
</body>
</html>