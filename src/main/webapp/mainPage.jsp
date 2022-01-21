<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.model.NoticeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String session_id = (String) session.getAttribute("loginId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
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

<!-- 내부  -->
<link rel="stylesheet" href="css/mainStyle.css" />

<!-- swiper CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<div class="container" style="width: 1200px;">
		<header>
			<nav class="nav_container">
				<%@ include file="navInclude.jsp"%>
			</nav>
		</header>
		<main class="main_container">
			<div class="sec_login">
				<div class="col-md-9">
					<!-- Slider main container -->
					<div class="swiper-container">
						<!-- 보여지는 영역 -->
						<div class="swiper-wrapper">
							<!-- <div class="swiper-slide">내용</div> 를 추가하면된다 -->
							<div class="swiper-slide">
								<img src="img/event.jpg">
							</div>
							<div class="swiper-slide">
								<img src="img/event2.jpg">
							</div>
							<div class="swiper-slide">
								<img src="img/event3.jpg">
							</div>
							<div class="swiper-slide">
								<img src="img/event4.jpg">
							</div>
							<div class="swiper-slide">
								<img src="img/event5.jpg">
							</div>
							<div class="swiper-slide">
								<img src="img/event6.jpg">
							</div>
						</div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
						<div class="swiper-pagination"></div>
						<div class="swiper-scrollbar"></div>
					</div>
				</div>
				<%
				if (session_id == null) {
				%>
				<!-- 로그인 전 화면 -->
				<div id="account" class="col-md-3">
					<p class="login_msg">로그인 해주세요.</p>
					<div>
						<label style="width: 100%;"><a href="Login" id="loginBox">로그인</a></label>
					</div>
					<div id="sub_area" class="pull-left">
						<a href="findId.jsp">아이디찾기</a> <a href="findPw.jsp">비밀번호찾기</a>
					</div>
					<div id="sub_area2" class="pull-right">
						<a href="MemberCreate">회원가입</a>
					</div>
				</div>
				<%
				}
				%>
				<%
				if (session_id != null) {
				%>
				<!-- 로그인 후 화면 -->
				<div id="account" class="col-md-3">
					<p class="login_msg">
						환영합니다.<%=session_id%>님
					</p>
					<div>
						<label style="width: 100%; color:"><a href="LogOut"
							id="loginBox">로그아웃</a></label>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="mainModules">
				<div class="outer">
					<div class="modulesBox col-md-5">
						<div class="board_title_outer">
							<p class="board_title pull-left">공지사항</p>
							<a href="NoticeBoard" class="a_title pull-right">더 보기+</a><br>
							<br>
						</div>
						<div class="board_top">
							<%
							ArrayList<NoticeBoardVO> nAl = (ArrayList) request.getAttribute("notice_b_list");
							Iterator<NoticeBoardVO> it = nAl.iterator();

							while (it.hasNext()) {
								NoticeBoardVO nvo = it.next();
							%>
							<ul>
								<li class="bo_list"><a
									href="NoticeView?bnum=<%=nvo.getNum()%>"><%=nvo.getSubject()%></a>
									<span style="color: red;"><%=nvo.getReplyCount() == 0 ? "" : "(" + nvo.getReplyCount() + ")"%></span>
								</li>
								<li class="bo_sb_list"><span class="pull-right"
									style="width: 30px; margin: 5px 10px 5px 0; color: red;">TOP</span>
								</li>
							</ul>
							<%
							}
							%>
						</div>
						<div class="board_new">
							<%
							ArrayList<NoticeBoardVO> nAl2 = (ArrayList) request.getAttribute("notice_New_bo_list");
							Iterator<NoticeBoardVO> it2 = nAl2.iterator();

							while (it2.hasNext()) {
								NoticeBoardVO nvo2 = it2.next();
							%>
							<ul>
								<li class="bo_list"><a
									href="NoticeView?bnum=<%=nvo2.getNum()%>"><%=nvo2.getSubject()%></a>
									<span style="color: red;"><%=nvo2.getReplyCount() == 0 ? "" : "(" + nvo2.getReplyCount() + ")"%></span>
								</li>
								<li class="bo_sb_list"><span class="pull-right"
									style="width: 30px; margin: 5px 10px 5px 0; color: green;">NEW</span>
								</li>
							</ul>

							<%
							}
							%>
						</div>
					</div>
					<div class="modulesBox col-md-5">
						<div class="board_title_outer">
							<p class="board_title pull-left">회원전용 게시판</p>
							<a href="" class="a_title pull-right">더 보기+</a><br>
							<br>
						</div>
						<div class="board_top">
							<ul>
								<li class="bo_list"><a></a> <span style="color: red;"></span>
								</li>
								<li class="bo_sb_list"><span class="pull-right"
									style="width: 30px; margin: 5px 10px 5px 0; color: red;">TOP</span>
								</li>
							</ul>
						</div>
						<div>
							<ul>
								<li class="bo_list"><a></a> <span style="color: red;"></span>
								</li>
								<li class="bo_sb_list"><span class="pull-right"
									style="width: 30px; margin: 5px 10px 5px 0; color: green;">NEW</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="outer">
					<div class="modulesBox col-md-5">
						<div class="board_title_outer">
							<p class="board_title pull-left">자유게시판</p>
							<a href="FreeBoard" class="a_title pull-right">더 보기+</a><br>
							<br>
						</div>
						<div class="board_top">
							<ul>
								<li class="bo_list"><a></a> <span style="color: red;"></span>
								</li>
								<li class="bo_sb_list"><span class="pull-right"
									style="width: 30px; margin: 5px 10px 5px 0; color: red;">TOP</span>
								</li>
							</ul>
						</div>
						<div>
							<ul>
								<li class="bo_list"><a></a> <span style="color: red;"></span>
								</li>
								<li class="bo_sb_list"><span class="pull-right"
									style="width: 30px; margin: 5px 10px 5px 0; color: green;">NEW</span>
								</li>
							</ul>
						</div>
					</div>
					<div class="modulesBox col-md-5">
						<div class="board_title_outer">
							<p class="board_title pull-left">최신뉴스</p>
							<a href="" class="a_title pull-right">더 보기+</a><br>
							<br>
						</div>
						<div class="board_top">
							<ul>
								<li class="bo_list"><a></a> <span style="color: red;"></span>
								</li>
								<li class="bo_sb_list"><span class="pull-right"
									style="width: 30px; margin: 5px 10px 5px 0; color: red;">TOP</span>
								</li>
							</ul>
						</div>
						<div>
							<ul>
								<li class="bo_list"><a></a> <span style="color: red;"></span>
								</li>
								<li class="bo_sb_list"><span class="pull-right"
									style="width: 30px; margin: 5px 10px 5px 0; color: green;">NEW</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</main>
		<footer>
			<div class="footer_container">
				<div class="footA">Dagoole</div>
				<div class="footB">Copyright © Dagoole's All Rights Reserved.
				</div>
			</div>
		</footer>
	</div>
</body>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
	// swiper 옵션 스크립트 시작
	new Swiper('.swiper-container', {
		loop : true,
		autoplay : {
			delay : 3000,
		},

		// 스크롤바 설정하기
		scrollbar : {
			el : '.swiper-scrollbar',
			draggable : true,
		},

		pagination : { // 페이징 설정
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션 설정
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
	//swiper 옵션 스크립트 끝
</script>


</html>