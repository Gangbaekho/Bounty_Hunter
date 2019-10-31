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
    </script>
  </head>
  <%
  	//Session에서 나의 id를 가져오기
  	String myid = (String)session.getAttribute("myid");
  	System.out.println(myid);
  	
  	MemberDB db = new MemberDB();
  	
  	//나의 id를 통해서 나의 mnum을 알아내기.
  	int mnum = db.getNumByMyid(myid);
  	System.out.println(mnum);
  	
  
  %>
  <body>
  	<div class="cover-gray"></div>
    <div class="super">
      <h2 class="logo"><a href="../main/main.jsp">Bounty Hunter</a></h2>
      <form action="questionaction.jsp" method="post" id="frm">
        <table class="formtable">
          <tr>
            <th style="width:200px;">Title</th>
            <td style="width:600px;">
              <input id="title" name="title" style="width:450px;" type="text" />
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
              />
            </td>
          </tr>
        </table>
        
        <!-- this is hidden type! -->      
        <input type="hidden" name="mnum" value="<%=mnum %>">

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
    <div class="cowboy-cover">
    </div>
  </body>
</html>
