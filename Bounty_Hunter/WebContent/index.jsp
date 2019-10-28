<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="css/index.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Caveat|Lobster&display=swap"
      rel="stylesheet"
    />
    <title>Document</title>
    <script>
    $(function(){
    	
    	$("#login").click(function(){
    		
    		$("#frm").submit();
    		
    	});
    	
    });
    </script>
  </head>
  <body>
    <div class="scroll"></div>
    <div class="cover-purple"></div>
    <div class="cover-gray"></div>
    <div class="super">
      <h1 class="logo">
        Bounty Hunter
      </h1>

      <div class="myform">
        <div class="login">
        <form action="login/loginaction.jsp" method="post" id="frm">
          ID: <input class="myinput" type="text" name="myid" autofocus required /> <br />
          PW:
          <input class="myinput" type="password" name="pass"required /><br />
         </form>
          <a class="joinpadding" href="member/memberform.jsp">Join us</a>
        </div>
        <div class="stamp" id="login">Login</div>
        <div class="fake_stamp"></div>
        <div class="fake_stamp2"></div>
      </div>
    </div>
  </body>
</html>
    