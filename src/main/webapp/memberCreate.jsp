<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<link rel="stylesheet" href="css/mainStyle.css" />
</head>
<body>

	<div class="container">
		<header>
			<nav class="nav_container">
				<%@ include file="navInclude.jsp"%>
			</nav>
		</header>
		<main class="main_container">
			<section>
				<article>
					<div class="title_outer">
						<h2>회원등록</h2>
					</div>
					<form method="post" action="">
						<input type="hidden" name="isIdChk" id="isIdChk" value="N">
						<div class="container">
							<div class="createId_box col-md-10">
								<div class="col-md-2 inner">아이디</div>
								<%-- <%=request.getAttribute("msg") %> --%>
								<div class="col-md-4">
									<input type="text" name="loginId" id="loginId"
										class="form-control" required="required" onchange="idChange()">
								</div>
								<div id="msg"></div>
								<div class="col-md-3">
									<button type="button" onclick="idChk()"
										class="form-control btn btn-default">아이디 중복체크</button>
								</div>
							</div>
							<div class="createPw_box col-md-10">
								<div class="col-md-2 inner">비밀번호</div>
								<div class="col-md-4">
									<input class="form-control">
								</div>
							</div>
							<div class="createName_box col-md-10">
								<div class="col-md-2 inner">이름</div>
								<div class="col-md-4">
									<input class="form-control">
								</div>
							</div>
							<div class="createN_Name_box col-md-10">
								<div class="col-md-2 inner">닉네임</div>
								<div class="col-md-4">
									<input class="form-control">
								</div>
							</div>
							<div class="createAddr_box col-md-10">
								<div class="col-md-2 inner">주소</div>
								<div class="col-md-2 inner">우편번호</div>
								<div class="col-md-2">
									<input class="form-control">
								</div>
								<div class="col-md-1">
									<button type="button" class="form-control">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</div>
								<div class="col-md-4">
									<input class="form-control">
								</div>
							</div>
							<div class="createAddr_sub_box col-md-10">
								<div class="col-md-2 inner">상세주소</div>
								<div class="col-md-4">
									<input class="form-control">
								</div>
							</div>
							<div class="createTel_box col-md-10">
								<div class="col-md-2 inner">전화번호</div>
								<div class="col-md-4">
									<input class="form-control">
								</div>
							</div>
							<div class="createEmail_box col-md-10">
								<div class="col-md-2 inner">이메일</div>
								<div class="col-md-4">
									<input type="text" id="str_email01" name="str_email01"
										class="form-control">
								</div>
								<span class="col-md-1 inner">@</span>
								<div class="col-md-2">
									<input type="text" id="str_email02" name="str_email02"
										class="form-control" disabled value="naver.com">
								</div>
								<div class="col-md-2">
									<select name="selectEmail" id="selectEmail"
										class="form-control">
										<option value="1">직접입력</option>
										<option value="naver.com" selected>naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="kb.co.kr">kb.co.kr</option>
									</select>
								</div>
							</div>
						</div>
						<button type="button" class="btn btn-default pull-right"
							id="btn_btn" onclick="location.href='MainPage'">홈으로</button>
						<button type="submit" class="btn btn-success pull-right"
							id="btn_btn">회원가입</button>
					</form>
				</article>
			</section>
		</main>
	</div>
</body>

<script>
	function frmChk(){
		let isIdChk = document.getElementById("isIdChk").value;
		if(isIdChk == 'N'){
			alert("아이디 중복체크를 하세요");
			return false;
		}
		return true;
	}

	function idChange(){
		//console.log("id값 변경댐");
		document.getElementById("isIdChk").value = "N";
	}
	
</script>
<script type="text/javascript">
	function idChk(){
		let loginId = document.getElementById("loginId").value;
		if(loginId.length < 6 || loginId.length > 16){
			alert("아이디는 6자 이상 16자 이하로 적으셔야합니다.");
		} else {
		
			$.ajax({
	            type : 'post',
	            url : 'IdChk',
	            data : {loginId : loginId},
	            success : function(msg){
	            	var msg = msg.msg;
                   	//alert(msg.msg);
	            	if(msg == 'N'){
	            		document.getElementById("msg").innerHTML = "사용가능한 아이디입니다.";
	            		document.getElementById("isIdChk").value = "Y"; // 사용가능하기 때문에 아이디를 사용하면 중복이 될 예정이라 Y 값으로 바꿔줌
	            		//document.getElementById("id").readOnly = "readOnly";
	            	} else {
	            		document.getElementById("msg").innerHTML = "사용 중인 아이디입니다.";
	            		document.getElementById("isIdChk").value = "N"; // 중복된 아이디가 있기 때문에 다시 쓰라고 디폴트 값인 N 임
	            	}
	            }
	        });
		}	
		//console.log("아이디 중복 체크"+id.length);
	}
	
	$('#selectEmail').change(function(){ 
		$("#selectEmail option:selected").each(function () { 
			if($(this).val()== '1'){ //직접입력일 경우
				$("#str_email02").val(''); //값 초기화
				$("#str_email02").val(''); //값 초기화
				$("#str_email02").attr("disabled",false); //비활성화 
			} else { //직접입력이 아닐경우 
				$("#str_email02").val($(this).text()); //선택값 입력 
				$("#str_email02").attr("disabled",true); //비활성화 
			} 
		}); 
	});

</script>
</html>