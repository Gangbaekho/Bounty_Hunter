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
html, body{
   height:100%;
}

body{
   background-color: #5D5D5D;
}

#h3 {
   color: white;
   font-family: Lobster;
   text-align: center;
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
   margin-right: 62%;
   color: white;
}

a{
   color: white;
}

.hashbox {
   width: 70%;
   height: 15%;
   border:   medium solid white;
   float: left;
   margin-left: 5%;
   border-style: wave;
   
}

#hash_wrapper{
   margin-left:5%;
}


.img_wrapper {
   background-image: url(../image/stamp.png);
   top:40%;
   width: 30%;
   background-size: 40%;
   background-repeat: no-repeat;
   position: absolute;
   height: 24%;
   margin-left: 80%;
   filter: drop-shadow(5px 5px 5px #222)
}

.content {
   position: absolute;
   top: 50%;
   left: 21%;
   transform: translate(-50%, -50%);
   font-size: 80px;
   color: white;
   z-index: 2;
   text-align: center;
}


#board_wrapper{
   border: 1px solid black;
   width:90%;
   height: 100%;
   margin-top: 5%;
   margin-left: 5%;
   
}

#board1{
   border-color: white;
   border-widht: 3%;
   width: 25%;
   height: 40%;
   float: left;
   border-style: ridge;

   
}

#board2{
   border: medium solid white;
   width: 25%;
   height: 40%;
   float: left;
   margin-left: 3%;
}

</style>


</head>
<body>
   <h3 id="h3">Bounty Hunter</h3>

   <h1 id="h1">( )'s &nbsp;&nbsp; Stable</h1>
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
            Create new <br> Debate
         </h4>
      </div>
   </div>
   
<div style="clear:both"></div>
<div id="board_wrapper">
   <div id="board1">
      board1
   </div>
   <div id="board2">
      board2
   </div>
</div>
</body>
</html>