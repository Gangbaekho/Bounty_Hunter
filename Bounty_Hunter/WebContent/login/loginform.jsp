<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bounty Hunter</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- 글꼴등록 -->
<link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Tangerine">
<link rel="stylesheet"
          href="http://fonts.googleapis.com/css?family=Lobster">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" type="text/css" href="../css/loginform.css" />
<script type="text/javascript">
$(function(){
	$("#mylogin").click(function(){
		//alert("test");
		$("#frm").submit();//action으로 넘어감
	});
});


</script>

</head>
<%
	//세션값 얻기
	String idsave=(String)session.getAttribute("idsave");
	String myid=(String)session.getAttribute("myid");
%>
<body>
<form action="login/loginaction.jsp" method="post" id="frm">

   	<%
   	if(idsave==null || idsave.equals("no")){%>
   		<input type="checkbox" name="idsave">ID저장
   	<%}else{%>
   		<input type="checkbox" name="idsave"
   		  checked="checked">ID저장
   	<%}
   	%>

   <table class="table table-bordered"
    style="width: 220px;">
   	 <tr>
   	 	<td style="width: 140px;">
   	 	 <%
   	if(idsave==null || idsave.equals("no")){%>
   		<input type="text" name="myid"
   		class="form-control"
   		required="required"
   		placeholder="아이디">
   	<%}else{%>
   		<input type="text" name="myid"
   		class="form-control"
   		required="required"
   		placeholder="아이디"
   		value="<%=myid%>">
   	<%}
   	%>
   	 	</td>
   	 	<td rowspan="2" align="center" 
   	 	class="active" id="mylogin" style="background: #f8d348 ">
   	 	로그인
   	 	</td>
   	 </tr> 
   	 <tr>
   	 	<td>
   	 		<input type="password" name="pass"
   	 		required="required"
   	 		class="form-control"
   	 		placeholder="비밀번호">
   	 	</td>
   	 </tr>
   </table>	
   <span style="margin-left: 10px; border: 1px solid gray;" >
   <a href="member/memberform.jsp">
   회원가입</a></span>
</div>
</form>
<script src="script.js"></script>
</body>
</html>
