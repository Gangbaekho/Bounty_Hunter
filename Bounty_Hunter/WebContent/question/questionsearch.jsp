<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/questionsearch.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/questionsearch.css" />
</head>
<body>
	<div class="cover-gray"></div>
	<div class="super">
		<div class="logo" onclick="location.href='../main/main.jsp'">Bounty Hunter</div>
		<div class="searchbar">
			<div class="hashcontainer">
				<input type="text" id="qsearch" name="qsearch" class="form-control" required autofocus>
				<div class="hashtag"></div>
			</div>
			<img src="../image/mglass.png" alt="magnifying glass" id="mglass" onclick="location.href='#'">
		</div>
	</div>
</body>
</html>