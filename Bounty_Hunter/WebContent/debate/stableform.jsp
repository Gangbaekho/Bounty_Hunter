<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap&subset=cyrillic,cyrillic-ext"
	rel="stylesheet">
<style>
body {
	height: 100%;
}

#h1 {
	font-size: 100px;
	margin-left: 450px;
	font-family: Lobster;
}

#h3 {
	margin-left: 650px;
}

#h4 {
	font-size: 18px;
	text-shadow: #212121 5px 5px 5px;
}

#hash {
	margin-right: 950px;
	margin-left: 30px;
}

.hashbox {
	width: 75%;
	height: 100px;
	border: 1px solid black;
	float: left;
	margin-left: 30px;
}

#hash_wrapper{
	margin-left:10px;
}


.img_wrapper {
	background-image: url(../image/stamp.png);
	width: 300px;
	background-size: 120px;
	background-repeat: no-repeat;
	position: absolute;
	height: 130px;
	margin-left: 80%;
}

.content {
	position: absolute;
	top: 48%;
	left: 21%;
	transform: translate(-50%, -50%);
	font-size: 80px;
	color: white;
	z-index: 2;
	text-align: center;
}

.board1{
	border: 1px solid black;
	width: 50px;
	height: 40px;
}
</style>


</head>
<body>
	<h1 id="h1">Bounty Hunter</h1>

	<h3 id="h3">( ) Stable</h3>
	<br>
	<br>

	<div id="hash_wrapper">
		<span id="hash">@@님의 해시태그</span> 
		<a>수정</a>
	</div>
	<div class="hashbox">hi</div>

	<div class="img_wrapper">
		<div class="content">
			<h4 id="h4">
				create new <br> debate
			</h4>
		</div>
	</div>
	
<div style="clear:both"></div>
	<div id="board1">
		앙농
	</div>

</body>
</html>