<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			
			var genre = $("#sel").val();
			var word = $("#word").val();
			
			$.ajax({
				type:"get",
				url:"../xml/api.jsp",
				dataType:"json",
				data:"genre="+genre+"&word="+word,
				success:function(data){
					for(var i = 0 ; i < data.items.length ;i++){
						
							$("#out").append("<img class='click' width='150' src='"+data.items[i].image+"'>");
						}
					}
			});
			
		});
		
	});
</script>
</head>
<body>
<input type="text" id="word"><br>
<button type="button" id="btn1">Search</button>
<select id="sel">
	<option value="book">도서</option>
	<option value="movie">영화</option>
	<option value="image">이미지</option>
</select>
<div id="out">
</div>
</body>
</html>