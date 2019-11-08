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
<link rel="stylesheet" type="text/css" href="../css/memberform.css" />
<link href="https://fonts.googleapis.com/css?family=Lobster|Nanum+Myeongjo|Special+Elite&display=swap" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$("#btnid").click(function(){
			//open ("파일명","윈도우이름","각종속성")
			window.open("idsearch.jsp","w",
					"left=800px,top=100px,height=250px,width=350px");
		});
	
		//이메일 주소 변경시 출력
		$("#selemail").change(function(){
			var mailaddr=$(this).val();
			if(mailaddr=="-"){
				//기존 주소가 있을경우 지우고
				$("#email2").val("");
				//포커스 보내주기
				$("#email2").focus();
			}else{
				//선택한 메일주소 보내기
				$("#email2").val(mailaddr);
			}
			
		});
		
	});
		
	function check(f) {
		//폼 이름으로 접근(아이디로 접근해도됨)
		var p1=f.pass.value;
		var p2=f.pass2.value;
		if(p1!=p2){
			alert("두 비밀번호가 일치하지 않습니다!");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="bgimg">
		<div class="super">
			<div class="logo" onclick="location.href='../index.jsp'"> Bounty Hunter </div>
			<form action="memberaction.jsp" method="post" name="frm" 
				class="form-inline" id="frm"
				onsubmit="return check(this)">
				<table class="table table-bordered jointable" style="width: 500px;">
					<caption><b>Join us</b></caption>
					<tr>
						<th bgcolor="" style="width: 100px;">이름</th>
							<td>
								<input type="text" class="form-control"
										name="name" placeholder="회원명"
										required="required"
										autofocus="autofocus"
										style="width: 150px;">
							</td>
						</tr>
						<tr>
							<th bgcolor="">아이디</th>
								<td>
									<div class="form-group">
									<input type="text" name="myid"
									id="myid"
											required="required"
											readonly="readonly"
											class="form-control"
											style="width: 150px;">
											
											<button type="button" id="btnid"
												class="btn btn-danger btn-sm">입력
											</button>
									</div>		
								</td>
						</tr>
						<tr>
							<th bgcolor="">비밀번호</th>
							<td>
								<input type="password" name="pass"
									class="form-control"
									required="required"
									maxlength="10"
									style="width: 150px;"
									placeholder="password">	
							</td>
						</tr>
						
						<tr>
							<th bgcolor="">비밀번호 확인</th>
							<td>
								<input type="password" name="pass2"
									class="form-control"
									required="required"
									maxlength="10"
									style="width: 150px;"
									placeholder="password">	
							</td>
						</tr>
						
						<tr>
						<th bgcolor="">핸드폰</th>
							<td>
								<input type="text" name="mobile"
										class="form-control"
										required="required"
										placeholder="-없이 숫자로만 입력"
										pattern="[0-9]{11}"
										style="width: 150px;">
							</td>
						</tr>
						<tr>
							<th bgcolor="">이메일</th>
							<td>
								<div class="form-group">
									<input type="text" name="email1"
										style="width: 100px;"
										class="form-control"
										required="required">
										<b>@</b>
									<input type="text" name="email2"
										style="width: 100px;"
										class="form-control"
										required="required"
										id="email2">
										
										<select id="selemail" style="height: 30px;">
											<option value="-">직접입력</option>
											<option value="naver.com">네이버</option>
											<option value="nate.com">네이트</option>
											<option value="daum.net">다음</option>
											<option value="gmail.com">구글</option>
										</select>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button type="submit" class="btn btn-info btn-md">회원가입</button>
							</td>
						</tr>								
				</table>
			</form>
		</div>
	</div>
</body>
</html>