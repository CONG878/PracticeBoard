<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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
<link rel="stylesheet" href="css/mainStyle.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<div class="container">
		<header> </header>
		<main>
			<section>
				<article>
					<div class="log_p_model">
						<div class="text-center">
							<a class="" href="MainPage"><img src="img/daum_logo.png"
								class="logo"></a>
						</div>
						<!-- 로그인 양식 -->
						<div class="container">
							<!-- 하나의 영역 생성 -->
							<div class="jumbotron_o">
								<!-- 영역 크기 -->
								<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
								<div class="jumbotron">
									<form method="post" action="LoginProc"
										onsubmit="return frmChk()">
										<h4 id="timezone">2021년12월 07일 09:00</h4>
										<div class="form-group">
											<input type="text" class="form-control" id="loginId"
												name="loginId" placeholder="아이디를 입력하세요" maxlength="16">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="loginPw"
												name="loginPw" placeholder="비밀번호를 입력하세요" maxlength="255">
										</div>
										<input type="submit" class="btn btn-primary form-control"
											value="로그인">
										<div class="col-md-4" id="sub_area2">
											<label><input type="checkbox" id="idSave"
												onclick="fnIdSave()">아이디저장</label>
										</div>
										<div class="row col-md-6">
											<div id="sub_area2">
												<a href="findId.jsp">아이디찾기</a> <a href="findPw.jsp">비밀번호찾기</a>
											</div>
										</div>
										<div class="col-md-2" id="sub_area2">
											<a href="MemberCreate">회원가입</a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</article>
			</section>
		</main>
		<footer> </footer>
	</div>
</body>
<script>
	function frmChk(){
		let loginId = document.getElementById("loginId").value;
		let loginPw = document.getElementById("loginPw").value;
		//내가 쓰는 아이디가 aaa라서 그냥 3자 해둠
		if(loginId.length < 3 || loginId.length > 16){
			//alert("아이디는 3자 이상 16자 이하로 적으셔야합니다.");
			Swal.fire({
                icon: 'warning',
                title: '아이디는 3자 이상 16자 이하로 적으셔야합니다.',
            });
			return false;
		} else if(loginPw.length == 0){
			//alert("비밀번호를 입력해주세요.");
			Swal.fire({
                icon: 'warning',
                title: '비밀번호를 입력해주세요.',
            });
			return false;
		}
		
		if(document.getElementById("idSave").checked){
			setCookie("log_c", loginId, 1); // 1일 동안 쿠키 보관
		} else {
			deleteCookie("log_c");
		}
		deleteCookie("VIEWCOOKIE");
		return true;
	}
	
	function fnIdSave(){
		if(document.getElementById("idSave").checked == true){
			//alert("공공장소에서는 누르지 마세요");
			Swal.fire({
                    title: '공공장소에서는 보안이 안될 수 있습니다.',
                    text: "아이디 저장을 하시겠습니까?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '저장',
                    cancelButtonText: '취소'
            })/* .then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                            '아이디를 저장했습니다.',
                        )
                    }
            }) */
		}
	}
	
	

	window.onload = function(){
		//저장된 쿠키를 가져와서 ID 칸에 입력, 없으면 공백 처리
		var log_c = getCookie("log_c");
		var loginId = document.getElementById("loginId").value = log_c;
		
		if(loginId != ""){
			document.getElementById("idSave").checked = true;
			document.getElementById("loginPw").focus();
		} else{
			document.getElementById("loginId").focus();
		}
	}
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}

	
	
	

	var i = 0;
	function nowDisplay(){
<%LocalDateTime serverTime = LocalDateTime.now();%>
		var now = new Date(<%=serverTime.getYear()%>,<%=serverTime.getMonthValue()%>-1,<%=serverTime.getDayOfMonth()%>,<%=serverTime.getHour()%>,<%=serverTime.getMinute()%>,<%=serverTime.getSecond()%>);
		now.setSeconds(<%=serverTime.getSecond()%>+(i++));
		var year = now.getFullYear();
		var month = ((now.getMonth()+1<10)?"0":"")+(now.getMonth()+1);
		var date = ((now.getDate()<10)?"0":"")+now.getDate();
		var hh = ((now.getHours()<10)?"0":"")+now.getHours();
		var mm = ((now.getMinutes()<10)?"0":"")+now.getMinutes();
		var ss = ((now.getSeconds()<10)?"0":"")+now.getSeconds();
		document.getElementById("timezone").innerHTML = year+"년 "+month+"월 "+date+"일 "+hh+":"+mm+":"+ss;

		<%-- console.log("nowDisplay"+"<%=serverTime %>"); --%>
		setTimeout(nowDisplay, 1000);
	}
	
	
</script>

</html>