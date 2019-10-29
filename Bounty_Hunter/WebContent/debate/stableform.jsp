<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Lobster|Nanum+Myeongjo&display=swap"
	rel="stylesheet">
<style>
html, body {
	height: 100%;
}

body {
	height: 100%;
}

body {
	background-color: #5D5D5D;
}

#super {
	width: 1300px;
	margin: auto;
}

#h3 {
	font-family: "Lobster", cursive;
	font-size: 35px;
	color: white;
	text-decoration: none;
	
}

#h1 {
	text-align: center;
	color: white;
	font-size: 100px;
	font-family: Lobster;
	height: 12%;
	font-weight: 100;
}

#h4 {
	font-size: 45%;
	text-shadow: #212121 5px 5px 5px;
	font-family: Lobster;
	font-weight: 100;
}

#hash {
	margin-right: 61%;
	color: white;
}

a {
	color: white;
}

.hashbox {
	width: 70%;
	height: 100px;
	border: medium solid white;
	float: left;
	margin-left: 5%;
	border-style: ridge;
}

#hash_wrapper {
	margin-left: 5%;
	font-family: Nanum Myeongjo
}

.img_wrapper {
	background-image: url(../image/stamp.png);
	background-size: 200px;
	top: -50px;
	width: 200px;
	background-repeat: no-repeat;
	position: relative;
	height: 200px;
	left: 1050px;
	filter: drop-shadow(5px 5px 5px #222)
}

.content {
	position: absolute;
	top: 100px;
	width: 100%;
	left: 100px;
	transform: translate(-50%, -50%);
	font-size: 80px;
	color: white;
	text-align: center;
}

#board_super {
	/*border: 1px solid black;*/
	width: 90%;
	max-height: 100%;
	margin-left: 5%;
}

#board_wrapper1{
	/*border: 1px solid black;*/
	height: 304px;
	
}


#board_wrapper2{
	/*border: 1px solid black;*/
	height: 304px;
	padding-top: 1%;
	
}

#board1 {
	border-color: white;
	width: 380px;
    height: 300px;
	float: left;
	border-style: ridge;
}

#board2 {
	border: medium solid white;
    width: 380px;
    height: 300px;
    margin-left: 6.5px;
    left: 3%;
    float: left;
    border-style: ridge;
}

#board3 {
	border: medium solid white;
    width: 380px;
    height: 300px;
    margin-left: 6.5px;
    float: left;
    border-style: ridge;
}


#board4 {
	border: medium solid white;
    width: 380px;
    height: 300px;
    margin-left: 6.5px;
    float: left;
    border-style: ridge;
}

#board5 {
	border: medium solid white;
    width: 380px;
    height: 300px;
    margin-left: 6.5px;
    float: left;
    border-style: ridge;
}


#board6 {
	border: medium solid white;
    width: 380px;
    height: 300px;
    margin-left: 6.5px;
    float: left;
    border-style: ridge;
}

</style>


</head>
<body>
	<div id="super">
		<h3 id="h3">Bounty Hunter</h3>

		<h1 id="h1">( )'s &nbsp;&nbsp; Stable</h1>
		<br> <br>

		<div id="hash_wrapper">
			<span id="hash">@@님의 해시태그</span> <a>수정</a>
		</div>
		<div class="hashbox">hi</div>

		<div class="img_wrapper">
			<div class="content">
				<h4 id="h4">
					Create new <br> Debate
				</h4>
			</div>
		</div>

		<div style="clear: both"></div>
		<div id="board_super">
			<div id="board_wrapper1">
				<div id="board1">board1</div>
				<div id="board2">board2</div>
				<div id="board3">board3</div>
			</div>
			<div id="board_wrapper2">
				<div id="board1">board4</div>
				<div id="board2">board5</div>
				<div id="board3">board6</div>
			</div>
		</div>
	</div>
</body>
</html>