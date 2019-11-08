<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/debateupload_search.css" />
<link	href="https://fonts.googleapis.com/css?family=Lobster|Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
img{
cursor:pointer;
margin:10px;
}
</style>
<title>Insert title here</title>
<script>
	$(function(){
		
		$(document).on("click","img.click",function(){
			
			var src = $(this).attr("src");
			$(opener.upload).val(src);
			$(opener.content).focus();
			window.close();
			
			
		});
		
		$("#btn1").click(function(){
			$("#out").empty();
			
			var genre = $("#sel").val();
			var word = $("#word").val();
			
			$.ajax({
				type:"get",
				url:"../xml/api.jsp",
				dataType:"json",
				data:"genre="+genre+"&word="+word,
				success:function(data){
					if(genre =="book"){
					for(var i = 0 ; i < data.items.length ;i++){
						var realImage = "";
						var cutIndex = data.items[i].image.indexOf("type=m1&");
						var realImage = data.items[i].image.substring(0,cutIndex)
						
						$("#out").append("<img class='click' width='150' src='"+realImage+"'>");
							//$("#out").append("<img class='click' width='150' src='"+data.items[i].image+"'>");
						}
					
					}else{
						for(var i = 0 ; i < data.items.length ;i++){
								$("#out").append("<img class='click' width='150' src='"+data.items[i].image+"'>");
							}
					}
					
				}
			});
			
		});
		
	});
</script>
</head>
<body>
	<div class="bgimg">
		<div class="location">
			<div class="super">
				<div class="align-item">
					<select id="sel" class="form-control">
						<option value="book">도서</option>
						<option value="movie">영화</option>
						<option value="image">이미지</option>
					</select>
					<input type="text" id="word" class="form-control" autofocus required><br>
					<button type="button" id="btn1">Search</button>
				</div>
				<div id="out"></div>
			</div>
		</div>
	</div>
</body>
</html>