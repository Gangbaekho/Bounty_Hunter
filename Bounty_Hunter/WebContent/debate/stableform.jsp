<%@page import="data.db.MemberDB"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.BoardDTO"%>
<%@page import="data.db.BoardDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Lobster|Nanum+Myeongjo&display=swap"
	rel="stylesheet">

<link href='https://fonts.googleapis.com/css?family=Nunito:400,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="../css/reset.css">
<!-- CSS reset -->
<link rel="stylesheet" href="../css/style.css">
<!-- Resource style -->
<link rel="stylesheet" href="../css/stableform.css">
<link rel="stylesheet" href="../css/debateform.css">

<title>Bounty Hunter</title>

</head>
<%
	String myid = (String) session.getAttribute("myid");
	MemberDB db = new MemberDB();

	int mnum = db.getNumByMyid(myid);

	BoardDB bdb = new BoardDB();

	List<BoardDTO> list = bdb.getAllBoard(mnum);
%>

<body class="gummy-transition">
	<main class="cd-main-content">
	<div id="super">
		<h3 id="h3">
			<a href="../main/main.jsp" style="text-decoration: none;">Bounty
				Hunter</a>
		</h3>

		<h1 id="h1">( )'s &nbsp;&nbsp; Stable</h1>
		<br> <br>

		<div id="hash_wrapper">
			<span id="hash">@@님의 해시태그</span> <a href="debatehash.jsp">수정</a>
		</div>
		<div class="hashbox">hi</div>

		<div class="img_wrapper">
			<div class="content">
				<h4 id="h4">
					<a href="#modal-1" class="cd-btn cd-modal-trigger"
						style="padding: 50px;">Create new <br>Debate
					</a>
				</h4>
			</div>

		</div>

		<div style="clear: both"></div>
		<div id="board_super">
			<div id="board_wrapper1">
				<%
					for (BoardDTO dto : list) {

						int i;
						
						for (i = 0; i < list.size(); i++) {
				%>
				<div id="board1"><%=list.get(i)%></div>
			<%
				}
			%>
			<%
				}
			%>
		</div>
	</div>
	</main>
	<!-- .cd-main-content -->

	<div class="cd-modal" id="modal-1">
		<div class="cover-gray"></div>
		<div class="super">
			<h2 class="logo">
				<a href="#">Bounty Hunter</a>
			</h2>
			<form action="debateaction.jsp" method="post" id="frm">
				<table class="formtable">
					<tr>
						<th style="width: 200px;">Subject</th>
						<td style="width: 600px;"><input style="width: 450px;"
							type="text" name="subject" /></td>
					</tr>
					<tr>
						<th style="width: 200px;">Upload</th>
						<td style="width: 600px;"><input style="width: 450px;"
							type="text" name="upload" /></td>
					</tr>
					<tr>
						<th style="width: 200px;">Content</th>
						<td style="width: 600px;"><textarea style="width: 450px;"
								name="content" id="content" cols="30" rows="10"></textarea></td>
					</tr>
				</table>

				<div class="submitform"
					style="width: 800px; margin: 0 auto; text-align: center;">
					<input type="submit" value="Submit"
						style="height: 50px; border-radius: 10px; background: #8862b2; border: none; font-family: 'Lobster'; font-size: 30px; cursor: pointer; color: white" />
				</div>
			</form>
			<button class="mybutton">Search</button>
		</div>
		<a href="#0" class="modal-close">Close</a>
	</div>
	<!-- .cd-modal -->

	<div class="cd-transition-layer" data-frame="25">
		<div class="bg-layer"></div>
	</div>
	<!-- .cd-transition-layer -->

	<script src="js/modernizr.js"></script>
	<!-- Modernizr -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script>
		if (!window.jQuery)
			document.write('<script src="js/jquery-2.2.1-min.js"><\/script>');
	</script>
	<script src="js/main.js"></script>
	<!-- Resource jQuery -->
</body>
</html>