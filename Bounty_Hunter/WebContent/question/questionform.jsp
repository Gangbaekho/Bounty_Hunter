<%@page import="data.dto.MemberDTO"%>
<%@page import="data.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="../css/questionform.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
      rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="../css/jquery.tag-editor.css" />
    <script src="../js/jquery.tag-editor.js"></script>
    <script src="../js/jquery.caret.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Lobster|Nanum+Myeongjo&display=swap"
      rel="stylesheet"
    />
    <title>Bounty Hunter</title>
    <%
	  	//Session에서 나의 id를 가져오기
	  	String myid = (String)session.getAttribute("myid");
	  	System.out.println(myid);
	  	
	  	MemberDB db = new MemberDB();
	  	
	  	//나의 id를 통해서 나의 mnum을 알아내기.
	  	int mnum = db.getNumByMyid(myid);
	  	System.out.println(mnum);
	  	
	  	MemberDTO dto = db.getMember(mnum);
	 	int bounty = dto.getBounty();
	  %>
    <script>
      $(function() {
        $("#hashtag").tagEditor({
          placeholder: "해시태그를 입력하세요"
        });

        $(".mybutton").click(function() {
          var hashtag = $("#hashtag");
          var mytags = hashtag.tagEditor("getTags")[0].tags;
          hashtag.attr("value", mytags);
        });
      });
      
      function check(f){
    	  var inputBounty = parseInt($("#inputExpense").val());
    	  var mybounty = parseInt($("#mybounty").text());
    	  
    	  if(inputBounty>mybounty){
    		  alert("hunter님이 보유하고 있는 금액을 초과하였습니다. \n확인 후 현상금을 입력 해 주세요.");
    		  return false; // 액션으로 넘어가지 않도록 함 
    	  } 
    	  
    	  if(inputBounty<500){
    		  alert("현상금 최소금액($500) 이상의 값을 입력 해 주세요.");
    		  return false;
    	  }
    	  
    	  if(isNaN(inputBounty)){
    		  alert("숫자를 입력 해 주세요.");
    		  return false;
    	  }
      }
    </script>
  </head>
  <body>
  	<div class="cover-gray"></div>
    <div class="super">
      <h2 class="logo"><a href="../main/main.jsp">Bounty Hunter</a></h2>
      <form action="questionaction.jsp" method="post" id="frm" onsubmit="return check(this)">
        <table class="formtable">
          <tr>
            <th style="width:200px;">Title</th>
            <td style="width:600px;">
              <input id="title" name="title" style="width:450px;"
              			 type="text" required />
            </td>
          </tr>
          <tr>
          	<th style="width:200px;">Expense</th>
          	<td>
          		<input type="text" id="inputExpense" style="width:450px;" name="expense"
          				   placeholder="How much will you pay? (Minimum $500)" required>
          		<span id="totalBounty">
          			$<span id="mybounty"><%= bounty %></span><br>
          		</span>
          		<img src="../image/usd1.png" alt="$" id="usdimg">
          	</td>
          </tr>
          <tr>
            <th style="width:200px;">Content</th>
            <td style="width:600px;">
              <textarea
                style="width:450px;"
                name="content"
                id=""
                cols="30"
                rows="10"
                required
              ></textarea>
            </td>
          </tr>
          <tr>
            <th style="width:200px;">#</th>
            <td style="width:600px;">
              <input
                id="hashtag"
                name="hash"
                style="width:450px;"
                type="text"
                value=""
                required
              />
            </td>
          </tr>
        </table>
        
        <!-- this is hidden type! -->      
        <input type="hidden" name="mnum" value="<%=mnum %>">
        <input type="hidden" name="myid" value="<%=myid %>">
        <div
          class="submitform"
          style="width:800px;margin:0 auto;text-align: center;padding-left:50px;"
        >
          <input
            type="submit"
            value="Submit"
            style="height:50px;border-radius:10px; background:#8862b2;
            border:none; font-family: 'Lobster';font-size: 30px ;cursor: pointer;color:white"
          />&nbsp;&nbsp;&nbsp;
          <button
            type="button"
            style="height:50px;border-radius:10px; background:#8862b2;
            border:none; font-family: 'Lobster';font-size: 30px ;cursor: pointer;color:white;width:96px;"
            onclick="history.back()"
          >
            Back
          </button>
        </div>
        
      </form>
    </div>
    <div class="bulbcover">
    </div>
  </body>
</html>
