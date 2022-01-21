<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="board.model.NoticeBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String session_id = (String) session.getAttribute("loginId");
String t_search = request.getParameter("t_search");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합검색</title>
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

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 내부  -->
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
					<div class="Board_outer">
						<div class="title_outer">
							<h2>
								<a href="NoticeBoard">통합검색</a>
							</h2>
						</div>
						<div class="section_body">
							<ul class="section_list">
								<%
								Date nowDate = new Date();
								SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
								simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");

								ArrayList<NoticeBoardVO> nAl = (ArrayList) request.getAttribute("totalList");
								Iterator<NoticeBoardVO> it = nAl.iterator();

								while (it.hasNext()) {
									NoticeBoardVO nvo = it.next();
								%>

								<li class="item">
									<h4>
										<a class="name"
											href="NoticeView?bnum=<%=nvo.getNum()%>&t_search=<%="".equals(t_search) || t_search == null ? "" : t_search%>"><%=nvo.getSubject()%></a>
									</h4>
									<p class="caption"><%=nvo.getContent()%></p>
									<div class="item_info">
										<a class="board">ㅇㅇ게시판</a>
										<p class="date"><%=simpleDateFormat.format(nvo.getWriterDate())%></p>
									</div>
								</li>

								<%
								}
								%>
								<li class="more"><a>게시판 더 보기</a> ></li>
							</ul>
						</div>
					</div>
				</article>
			</section>
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
<script>
	/* function t_searchFrm(){
		var t_search = document.getElementById("t_search").value;
		console.log(t_search);
		if(t_search == ''){
			//alert("검색어를 입력해 주세요");
			return false;
		}
		return true;
	} */
</script>
</html>