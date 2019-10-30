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
    <title>Document</title>
    <script>
      $(function() {
        $("#hashtag").tagEditor({
          delimiter: ", " /* space and comma */,
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
  <body>
    <div class="super">
      <h2 class="logo"><a href="#">Bounty Hunter</a></h2>
      <form action="" method="post" id="frm">
        <table class="formtable">
          <tr>
            <th style="width:200px;">Title</th>
            <td style="width:600px;">
              <input id="title" style="width:450px;" type="text" />
            </td>
          </tr>
          <tr>
            <th style="width:200px;">Content</th>
            <td style="width:600px;">
              <textarea
                style="width:450px;"
                name=""
                id=""
                cols="30"
                rows="10"
              ></textarea>
            </td>
          </tr>
          <tr>
            <th style="width:200px;">#</th>
            <td style="width:600px;">
              <input id="hashtag" style="width:450px;" type="text" value="" />
            </td>
          </tr>
        </table>

        <div
          class="submitform"
          style="width:800px;margin:0 auto;text-align: center;"
        >
          <input
            type="submit"
            value="Submit"
            style="height:50px;border-radius:10px; background:#8862b2;
            border:none; font-family: 'Lobster';font-size: 30px ;cursor: pointer;color:white"
          />
        </div>
      </form>
      <button class="mybutton">Search</button>
    </div>
  </body>
</html>
