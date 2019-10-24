<%@page import="data.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 검색</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

          
<script type="text/javascript">
$(function() {
	$("#btnuse").click(function() {
			var myid=$(this).attr("myid");
			
			//부모폼의 아이디로 보낸다
		$(opener.myid).val(myid);
		
			
			//현재창 닫기
			window.close();
	});	
	
});
</script>
</head>
<body>
<%
	//한글엔코딩
	request.setCharacterEncoding("utf-8");
	
	String key=request.getParameter("key");
	if(key==null)
	{
		//폼
	%>
	<form action="idsearch.jsp" method="post" class="form-inline">
		<table class="table table-bordered">
			<caption><b>아이디검색</b></caption>
			<tr>
				<td align="left">
					아이디를 입력해주세요<br>
					<div class="form-group">
						<input type="text" name="id"
							
								style="width: 100px;"
								required="required"
								autofocus="autofocus"
								class="form-control">
						<input type="hidden" name="key" value="yes">
						<button type="submit"
							    class="btn btn-danger btn-sm">중복체크
						</button>		
					</div>
				</td>
			</tr>			
		</table>	
	</form>	
	<%}else{
		//액션
		
		//1. id 읽기
		String id=request.getParameter("id");
		//2.db 선언
		MemberDB db=new MemberDB();
		
		//3. 아이디가 있는지 없는지메소드 호출
	    	boolean find=db.isSearchId(id);
		
		//4. true면 'id 해당아이디는 존재합니다'
		//   false면 'id 해당아이디는 사용할수있습니다'
		if(find)
		{%>
			<img alt="" src="../image/c3.png" width="100" align="left">
			
			<b><%=id %>아이디는 이미 존재하는 아이디 입니다</b>
			<br><br>
			<button type="button" class="btn btn-sm btn-danger"
						onclick="location.href='idsearch.jsp'">다시입력
			</button>
		<% }else{%>
			<img alt="" src="../image/c8.png" width="100" align="left">
			
			<b><%=id %>아이디는 사용가능한 아이디 입니다</b>
			<br><br>
			<button type="button" class="btn btn-sm btn-info" id="btnuse"
						myid="<%=id%>">사용하기
			</button>
		<%}
	}
%>
</body>
</html>