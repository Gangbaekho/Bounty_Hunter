<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Bounty Hunter</title>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/main.css" />
    <link href="https://fonts.googleapis.com/css?family=Lobster|Nanum+Myeongjo&display=swap" rel="stylesheet">
</head>
<%
	String myid = (String)session.getAttribute("myid");
%>
<body>
    <div class="scroll"></div>
    <div class="cover-purple"></div>
    <div class="cover-gray"></div>
    <div class="super">
    	<div id="logo">
	        <h1> Bounty Hunter </h1>
	    </div>
	    <div class="wrapper">
	        <div class="demo1">
	            <div class="container">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="navbar1">New <br>Fugitives
	                            <ul class="menu">
	                                <li><a href="../question/questionform.jsp" class="fab fa-facebook"> Ask </a></li>
	                                <li><a href="../question/questionhash.jsp" class="fab fa-google-plus">Q by #</a></li>
	                                <li><a href="../question/myqna.jsp" class="fab fa-twitter">My Q&A</a></li>
	                                <li><a href="../question/questionsearch.jsp" class="fab fa-linkedin">Search</a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="demo2">
	            <div class="container">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="navbar2"><%= myid %>'s<br>Stable
	                            <ul class="menu">
	                                <li><a href="../debate/stableform.jsp" class="fab fa-facebook">My stable</a></li>
	                                <li><a href="../debate/debateform.jsp" class="fab fa-google-plus">Debate</a></li>
	                                <li><a href="../debate/debatehash.jsp" class="fab fa-twitter">Write #</a></li>
	                                <li><a href="../debate/debatesearch.jsp" class="fab fa-linkedin">Search</a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="desc">
	         <h3 class="qnadesc">새로운 질문에 답 해 <br>도망자를 잡아주세요</h3>
	         <h3 class="stabledesc">마구간에서 토론을 통해 <br>현상금을 쟁취 해 보세요</h3>
	     </div>
	     <img src="../image/cowboy.png" class="centerimg">
    </div>
</body>
</html>