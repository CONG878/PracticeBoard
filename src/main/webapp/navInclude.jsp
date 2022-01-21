<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/navStyle.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<div class="pull-right" style="margin-right: 10px;">
	<p>
		<%
		if (session.getAttribute("loginId") != null) {
		%>
		<a href="LogOut" onclick="del_cookie()">로그아웃</a>
		<%
		} else if (session.getAttribute("loginId") == null) {
		%>
		<a href="Login">로그인</a>
		<%
		}
		%>
	</p>
</div>
<div class="header_container">
	<div class="logo_container">
		<a class="" href="MainPage"><img src="img/main_logo.png"
			class="logo"></a>
	</div>
</div>
<!-- 여기서 부터는 메뉴바 입니다. -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="MainPage"><span
				class="glyphicon glyphicon-home"></span></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">커뮤니티 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="NoticeBoard">공지사항</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="FreeBoard">자유게시판</a></li>
						<li><a href="#">ㅁㅁ게시판</a></li>
						<li><a href="#">ㅂㅂ게시판</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">정보,팁 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="dropdown-item"><a href="#">정보게시판</a></li>
						<li class="dropdown-item"><a href="#">팁게시판</a></li>
						<li class="dropdown-item"><a href="#">공략게시판</a></li>
					</ul></li>
				<li class=""><a href="#">최신뉴스<span class="sr-only">(current)</span></a>
				</li>
				<li class=""><a href="#">문의사항<span class="sr-only">(current)</span></a>
				</li>
			</ul>
			<form method="get" action="BoardTotalSearch"
				class="navbar-form navbar-right" onsubmit="return tSearchFrm()">
				<div class="form-group">
					<input type="text" name="t_search" id="t_search"
						class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>


<!-- 메뉴바 끝 -->
<%-- <%
if("0010".equals(session.getAttribute("loginRole"))) {
%>
		<a href="memberList.jsp" class="navbar-link">회원관리</a>
<%
}
%> --%>
<!-- 값 넘어오는지 확인하려고 확인 -->
<%-- <input type="" name="loginId" id="" value="<%=session.getAttribute("loginId") %>">
	<input type="" name="loginPw" id="" value="<%=session.getAttribute("loginPw") %>">
	<input type="" name="loginName" id="" value="<%=session.getAttribute("loginName") %>"> --%>

<script>
	/* function btn_chk(btn_click){
	 document.getElementById("nav_notice_link").setAttribute('class', '');
	 document.getElementById("nav_free_link").setAttribute('class', '');
	
	 if(btn_click == 'nav_notice_link'){
	 document.getElementById("nav_notice_link").setAttribute('class', 'active');
	 } else if(btn_click == 'nav_free_link'){
	 document.getElementById("nav_free_link").setAttribute('class', 'active');
	 }
	 return true;
	 //console.log("눌림"+notice);
	 } */
</script>

<script>
	function tSearchFrm() {
		var t_search = document.getElementById("t_search").value;
		console.log(t_search);
		if (t_search == "" || t_search == null) {
			alert("검색어를 입력해 주세요");
			return false;
		}
		return true;
	}

	function del_cookie() {
		deleteCookie("VIEWCOOKIE");
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
</script>
