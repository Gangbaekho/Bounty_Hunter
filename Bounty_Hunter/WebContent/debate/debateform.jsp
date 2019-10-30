<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="../css/debateform.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
      rel="stylesheet"
    />
    <title>Document</title>
  </head>
  <body>
    <div class="super">
      <h2 class="logo"><a href="#">Bounty Hunter</a></h2>
      <form action="" method="post" id="frm">
        <table class="formtable">
          <tr>
            <th style="width:200px;">Subject</th>
            <td style="width:600px;">
              <input style="width:450px;" type="text" />
            </td>
          </tr>
          <tr>
            <th style="width:200px;">Upload</th>
            <td style="width:600px;">
              <input style="width:450px;" type="text" />
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
