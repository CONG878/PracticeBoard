<%@page import="board.model.NoticeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
NoticeBoardVO nvo = (NoticeBoardVO) request.getAttribute("noticeList");
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
					<h2>공지사항 등록</h2>
				</div>
				<article>
					<form method="post" action="" onsubmit="return frmChk()">
						<input type="hidden" name="loginId" id="" value="">
						<div class="container">
							<div class="createId_box col-md-10">
								<div class="col-md-2">제목</div>
								<div class="col-md-4">
									<input type="text" name="subject" id="subject"
										placeholder="게시글 제목을 입력해주세요" class="form-control">
								</div>
							</div>
							<div class="createPw_box col-md-10">
								<div class="col-md-2">내용</div>
								<div class="col-md-10">
									<textarea class="form-control" name="content" id="content"
										cols="" rows="8"></textarea>
								</div>
							</div>
						</div>
						<div class="createBtn_box col-md-12">
							<button type="button" id="btn_btn"
								class="btn btn-default pull-right" onclick="history.back(-1)">홈으로</button>
							<button type="submit" id="btn_btn"
								class="btn btn-success pull-right">글 등록</button>
							<button type="reset" id="btn_btn"
								class="btn btn-warning  pull-right">취소</button>
						</div>
					</form>
				</article>
			</section>
		</main>
	</div>
</body>

<script>
	function frmChk() {
		let subject = document.getElementById("subject").value;
		let content = document.getElementById("content").value;

		if (subject.length == 0) {
			alert("제목을 입력해주세요.");
			document.getElementById("subject").focus();
			return false;
		} else if (content.length == 0) {
			alert("내용을 입력해주세요.");
			document.getElementById("content").focus();
			return false;
		} else
			return true;
	}
</script>
</html>