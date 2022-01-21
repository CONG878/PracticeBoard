<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="board.model.NoticeBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String session_id = (String) session.getAttribute("loginId");
String search = request.getParameter("search");

int pg = (int) request.getAttribute("pg");
int ppn = (int) request.getAttribute("ppn");
int count = (int) request.getAttribute("count");
int lastPage = (int) request.getAttribute("lastPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
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
						<div class="section_body">
							<div class="title_outer">
								<h2>
									<a href="NoticeBoard">공지사항</a>
								</h2>
							</div>
							<div class="search_outer">
								<div class="col-sm-6 col-sm-offset-3">
									<form method="get" class="form-inline" action=""
										onsubmit="return searchFrm()">
										<div class="searchBar form-group">
											<input class="form-control" type="text" name="search"
												id="search"
												value="<%=("".equals(search) || search == null) ? "" : search%>">
										</div>
										<button type="submit" class="btn btn-default">검색</button>
									</form>
								</div>
							</div>
							<div class="table_outer">
								<table class="table">
									<thead>
										<tr>
											<th style="width: 60px;">순번</th>
											<th style="width: 600px;">제목</th>
											<th style="width: 150px;">작성자</th>
											<th style="width: 200px;">작성일</th>
											<th style="width: 60px;">조회수</th>
											<th style="width: 60px;">추천수</th>
										</tr>
									</thead>
									<tbody>
										<%
										Date nowDate = new Date();
										SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
										simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
										int totalRows = (int) request.getAttribute("totalRows");

										ArrayList<NoticeBoardVO> nAl = (ArrayList) request.getAttribute("noticeList");
										Iterator<NoticeBoardVO> it = nAl.iterator();

										while (it.hasNext()) {
											NoticeBoardVO nvo = it.next();
										%>

										<tr>
											<td><%=totalRows--%></td>
											<td class="subject_text"><a
												href="NoticeView?bnum=<%=nvo.getNum()%>&search=<%="".equals(search) || search == null ? "" : search%>&page=<%=pg%>"><%=nvo.getSubject()%></a>
												<span style="color: red;"><%=nvo.getReplyCount() == 0 ? "" : "(" + nvo.getReplyCount() + ")"%></span>
											</td>
											<td><%=nvo.getWriterId()%></td>
											<td><%=simpleDateFormat.format(nvo.getWriterDate())%></td>
											<td><%=nvo.getHit()%></td>
											<td></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
							<div class="pull-right" style="clear: both; margin: 10px;">
								<%
								if (session_id == null) {
								%>
								글쓰기는
								<button type="button" onclick="location.href='Login'">
									<b class="w3-text-blue">로그인</b>
								</button>
								후 사용 가능합니다.<br /> <span class="rec_count"></span>
								<%
								}
								%>
								<%
								if (session_id != null) {
								%>
								<button type="button" class="btn btn-primary"
									onclick="location.href='NoticeCreate'">
									글 쓰기 <span class="rec_count"></span>
								</button>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</article>
			</section>
			<section>
				<article>
					<nav class="paging_outer">
						<div class="paging_box">
							<ul class="pagination text-justify">
								<%
								if (count > 0) {
								%>
								<li class=""><a href="?page=1">첫 페이지</a></li>
								<%
								if (pg != 1) {
								%>
								<li class=""><a href="?page=<%=pg - 1%>">Previous</a></li>
								<%
								}
								for (int i = Math.max(1, Math.min(pg - 2, lastPage - 4)); i <= Math.min(lastPage, Math.max(pg + 2, 5)); i++) {
								if (i != pg) {
								%>
								<li class="page-item"><a href="?page=<%=i%>"><%=i%></a></li>
								<%
								} else {
								%>
								<li class="page-item active"><a href="?page=<%=i%>"><%=i%></a></li>
								<%
								}
								}
								if (pg != lastPage) {
								%>
								<li class=""><a href="?page=<%=pg + 1%>">Next</a></li>
								<%
								}
								%>
								<li class=""><a href="?page=<%=lastPage%>">마지막 페이지</a></li>
								<%
								}
								%>

								<%-- 페이징의 간소화를 보이기 위해 원본을 남김
								<%
								if (count > 0) {
									int pageCount = count / ppn + (count % ppn == 0 ? 0 : 1);

									int pageBlock = 5;

									int startPage = ((pg - 1) / pageBlock) * pageBlock + 1;
									int endPage = startPage + pageBlock - 1;

									// 총 페이지의 수가 
									if (endPage > pageCount) {
										endPage = pageCount;
									}

									if (startPage > pageBlock) {
								%>
								<li><a
									href="?page=<%=startPage - 5%>&search=<%=(search == null) ? "" : search%>">
										&laquo; </a></li>
								<%
								}
								%>

								<%
								if (pg == 1) {
								%>
								<li class="disabled"><a>&lt;</a></li>
								<%
								} else {
								%>
								<li><a
									href="?page=<%=pg - 1%>&search=<%=(search == null) ? "" : search%>">&lt;</a></li>
								<%
								}
								%>

								<%
								for (int i = startPage; i <= endPage; i++) {
									if (i == pg) {
								%>
								<li class="active"><a href="#"><%=i%></a></li>
								<%
								} else {
								%>
								<li><a
									href="?page=<%=i%>&search=<%=(search == null) ? "" : search%>"><%=i%></a></li>
								<%
								}
								}

								if (lastPage == pg) {
								%>
								<li class="disabled"><a href="">&gt;</a></li>
								<%
								} else {
								%>
								<li><a
									href="?page=<%=pg + 1%>&search=<%=(search == null) ? "" : search%>">&gt;</a></li>
								<%
								}
								if (endPage < pageCount) {
								%>
								<li><a
									href="?page=<%=startPage + 5%>&search=<%=(search == null) ? "" : search%>">
										&raquo; </a></li>
								<%
								}
								}
								%>
								--%>
							</ul>
						</div>
					</nav>
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
	function searchFrm() {
		var search = document.getElementById("search").value;
		console.log(search);
		if (search == '') {
			alert("검색어를 입력해 주세요");
			return false;
		}
		return true;
	}
</script>
</html>