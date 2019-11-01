<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="../css/debateform.css" />
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet" />
<title>Bounty Hunter</title>
<script>
	$(function() {

		$(".mybutton").click(
				function() {
					window.open("debateupload_search.jsp", "w",
							"left=500px,top=100px,width=700px,heigth=700px");
				});
	});
</script>
</head>
<body>
	<div class="cover-gray"></div>
	<div class="debatecover"></div>
	<div class="super">
		<h2 class="logo">
			<a href="../main/main.jsp">Bounty Hunter</a>
		</h2>
		<form action="debateaction.jsp" method="post" id="frm">
			<table class="formtable">
				<tr>
					<th style="width: 200px;">Subject</th>
					<td style="width: 600px;"><input name="subject"
						style="width: 450px;" type="text" /></td>
				</tr>
				<tr>
					<th style="width: 200px;">Upload</th>
					<td style="width: 600px;"><input style="width: 450px;"
						type="text" id="upload" name="upload" placeholder="Please choose the best picture for your debate" required></td>
				</tr>
				<tr>
					<th style="width: 200px;">Content</th>
					<td style="width: 600px;"><textarea style="width: 450px;" placeholder="What would you like to discuss about?"
							name="content" id="content" cols="30" rows="10" ></textarea></td>
				</tr>
			</table>

			<div class="submitform"
				style="width: 800px; margin: 0 auto; text-align: center;">
				<input type="submit" value="Submit"
					style="height: 50px; border-radius: 10px; background: #8862b2; border: none; font-family: 'Lobster'; font-size: 30px; cursor: pointer; color: white; margin-left: 70px;" />
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="Back" onclick="history.back()"
					style="height: 50px; border-radius: 10px; background: #8862b2; border: none; font-family: 'Lobster'; font-size: 30px; cursor: pointer; color: white; width:96px;" />
			</div>
		</form>
		<button class="mybutton">Search</button>
	</div>
</body>
</html>
