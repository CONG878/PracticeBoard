<%@page import="board.model.NoticeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
NoticeBoardVO nvo = (NoticeBoardVO) request.getAttribute("noticeView");

String loginId = (String) session.getAttribute("loginId");
String search = request.getParameter("search");
String pg = request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
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
</head>
<body>

	<div class="container">
		<header> </header>
		<nav class="navbar">
			<%@ include file="navInclude.jsp"%>
		</nav>
		<main>
			<section>
				<div class="text-center" id="title">
					<h2>공지사항 업데이트</h2>
				</div>
				<article>
					<form method="post" action="">
						<input type="hidden" name="bnum" id="bnum"
							value="<%=nvo.getNum()%>"> <input type="hidden"
							name="writerDate" id="" value="<%=nvo.getWriterDate()%>">
						<input type="hidden" name="search" id="search"
							value="<%=search == null ? "" : search%>"> <input
							type="hidden" name="pg" id="pg" value="<%=pg%>">
						<div class="container">
							<div class="createId_box col-md-10">
								<div class="col-md-2">제목</div>
								<div class="col-md-4">
									<input type="text" name="subject" id="subject"
										class="form-control" value="<%=nvo.getSubject()%>">
								</div>
							</div>
							<div class="createPw_box col-md-10">
								<div class="col-md-2">내용</div>
								<div class="col-md-10">
									<textarea class="form-control" name="content" id="content"
										rows="8"><%=nvo.getContent()%></textarea>
								</div>
							</div>
							<div>
								<%
								if (loginId == null) {
								%>
								추천 기능은
								<button type="button" id="newLogin"
									onclick="location.href='Login'">
									<b class="w3-text-blue">로그인</b>
								</button>
								후 사용 가능합니다.<br /> <i class="fa fa-heart"
									style="font-size: 16px; color: red"></i> <span
									class="rec_count"></span>
								<%
								}
								%>
								<%
								if (loginId != null) {
								%>
								<button type="button" class="w3-button w3-black w3-round"
									id="rec_update" onclick="like_func()">
									<i class="fa fa-heart" style="font-size: 16px; color: red"></i>
									좋아요&nbsp;!<span class="rec_count"></span>
								</button>
								<%
								}
								%>
							</div>
						</div>
						<div class="createBtn_box pull-right">
							<%
							if (loginId.equals(nvo.getWriterId())) {
							%>
							<button type="submit" id="btn_update"
								class="btn btn-success btn_btn">수정하기</button>
							<button type="button" id="btn_del"
								class="btn btn-warning btn_btn" onclick="del_bo_Func()">삭제하기</button>
							<%
							}
							%>
							<button type="button" class="btn btn-default btn_btn"
								onclick="location.href='NoticeBoard?search=<%=search == null ? "" : search%>'">목록으로</button>
						</div>
					</form>
				</article>
			</section>
		</main>
	</div>
</body>
<script>
	function like_func() {
		console.log("눌렸음");
	}

	function updatefrm() {

	}

	function del_bo_Func() {
		var bnum = document.getElementById("bnum").value;
		//console.log("눌림");
		location.href = "DeleteBoard?bnum=" + bnum;

	}
</script>
</html>