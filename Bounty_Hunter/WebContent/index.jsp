<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Caveat|Lobster&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="css/index.css" />
    <title>Document</title>
    <script>
    $(function(){
    	$(".stamp").click(function(){
    		//alert("test");
    		$("#frm").submit();//action으로 넘어감
    	});
    	
    });
    </script>
  </head>
  <body>
    <div class="scroll"></div>
    <div class="cover-gray"></div>
    <div class="forfonts">
      <h1 class="logo">Bounty Hunter</h1>
      <div class="loginform">
        <div class="inputbox">
          <form action="login/loginaction.jsp" method="post" id="frm">
            ID: &nbsp;&nbsp;<input type="text" name="myid" / autofocus required><br />
            PW: &nbsp;&nbsp;<input type="password" name="pass" required />
          </form>
        </div>
        <div class="stamp">
          <div class="logintext">
            Login
          </div>
        </div>
      </div>
      <div class="joinform" onclick="location.href='member/memberform.jsp'">
        <div class="jointext">
          Join us
        </div>
      </div>
    </div>
  </body>
</html>
