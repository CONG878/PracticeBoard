<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="board.model.ReplyVO"%>
<%@page import="board.model.NoticeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
NoticeBoardVO nvo = (NoticeBoardVO) request.getAttribute("noticeView");

int count = (int) request.getAttribute("count");
String pg = request.getParameter("page");

String loginId = (String) session.getAttribute("loginId");
if (loginId == null) {
	loginId = "";
}
String search = request.getParameter("search");

Date nowDate = new Date();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
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
<link rel="stylesheet" href="css/viewStyle.css" />

</head>
<body>

	<div class="container">
		<header> </header>
		<nav class="navbar">
			<%@ include file="navInclude.jsp"%>
		</nav>
		<main class="main_container">
			<section>
				<article>
					<form method="post" action="">
						<input type="hidden" name="bnum" id="bnum"
							value="<%=nvo.getNum()%>"> <input type="hidden"
							name="writerDate" id=""
							value="<%=simpleDateFormat.format(nvo.getWriterDate())%>">
						<input type="hidden" name="search" id="search"
							value="<%=search == null ? "" : search%>"> <input
							type="hidden" name="pg" id="pg" value="<%=pg%>">
						<div class="view_box">
							<div class="view_header">
								<div class="view_info">
									<div class="view_writer">
										작성자:
										<%=nvo.getWriterId()%></div>
									<div class="view_writerDate">
										작성일:
										<%=simpleDateFormat.format(nvo.getWriterDate())%></div>
									<div class="view_hit">
										조회수:
										<%=nvo.getHit()%></div>
								</div>
							</div>
							<div class="view_main">
								<div class="view_title">
									<h2><%=nvo.getSubject()%></h2>
								</div>
								<hr width="100%" color="blue" size="3">
								<div class="view_content">
									<p><%=nvo.getContent()%></p>
								</div>
							</div>
							<div>
								<%
								if ("".equals(loginId)) {
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
								} else {
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
							<div class="createBtn_box pull-right">
								<%
								if (loginId.equals(nvo.getWriterId())) {
								%>
								<button type="button" id="btn_update"
									class="btn btn-success btn_btn" onclick="update_bo_Func()">수정하기</button>
								<%
								}
								%>
								<button type="button" class="btn btn-default btn_btn"
									onclick="location.href='NoticeBoard?search=<%=search == null ? "" : search%>&page=<%=pg%>'">목록으로</button>
							</div>
						</div>
					</form>
				</article>
			</section>
			<section>
				<article>
					<div class="container-fluid" style="clear: both;">
						<div class="comment_header">
							<p>
								댓글&nbsp;<%=count%></p>
						</div>
						<form id="repFrm" method="post" action="ReplyCreate"
							onsubmit="return reply()">
							<input type="hidden" name="bnum" id="bnum"
								value="<%=request.getParameter("bnum")%>"> <input
								type="hidden" name="search" id="search"
								value="<%=search == null ? "" : search%>"> <input
								type="hidden" name="pg" id="pg" value="<%=pg%>">
							<div class="comment_bar">
								<div class="col-md-11">
									<textarea name="comment" id="comment" class="form-control"></textarea>
								</div>
								<div class="col-md-1">
									<button type="submit" style="height: 54px"
										class="btn btn-default btn-lg">작성</button>
								</div>
							</div>
						</form>
						<div class="comment_outer">
							<div class="comment_box">
								<%
								ArrayList<ReplyVO> nAl = (ArrayList) request.getAttribute("replyView");
								Iterator<ReplyVO> it = nAl.iterator();

								while (it.hasNext()) {
									ReplyVO rvo = it.next();
								%>
								<div class="comment_list">
									<div class="writer_Id"><%=rvo.getWriterId()%></div>
									<div class="writer_Date"><%=simpleDateFormat.format(rvo.getWriterDate())%></div>
								</div>
								<div class="comment_list">
									<div class="comment_common"><%=rvo.getComment()%></div>
								</div>
								<div class="rec_box">
									<div class="rec_btn">
										<button class="btn btn-success" onclick="return recUpChk()">
											<span class="glyphicon glyphicon-thumbs-up"
												aria-hidden="true"></span>
										</button>
										&nbsp;&nbsp;<%=rvo.getGoodHit()%>
									</div>
									<div class="rec_btn">
										<button class="btn btn-danger" onclick="return recDownChk()">
											<span class="glyphicon glyphicon-thumbs-down"
												aria-hidden="true"></span>
										</button>
										&nbsp;&nbsp;<%=rvo.getBadHit()%>
									</div>
								</div>
								<hr width="100%" color="black" size="50">
								<%
								}
								%>

							</div>
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
	function like_func(){
		console.log("눌렸음");
	}
	
	function reply(){
		var comment = document.getElementById("comment").value.length;
		var loginId = "<%=loginId%>";
		if(loginId == ""){
			Swal.fire({
                icon: 'warning',
                title: '로그인 후 사용가능합니다.',
            });
			document.getElementById("repFrm").action = "Login";
			return false;
		} else if(comment == 0){
			Swal.fire({
                icon: 'warning',
                title: '내용을 입력해주세요.',
            });
			return false;
		} else 
		return true;
	}
	
	function recUpChk(){
		console.log("눌림");
		var loginId = "<%=loginId%>";
		if(loginId == ""){
			Swal.fire({
                icon: 'warning',
                title: "로그인 후 사용가능합니다.",
            });
			document.getElementById("repFrm").action = "Login";
			return false;
		} else
		$.ajax({
            type : 'post',
            url : 'IdChk',
            data : {loginId : loginId},
            success : function(msg){
            	
            }
		
		});
	}
	
	function recDownChk(){
		console.log("눌림");
		var loginId = "<%=loginId%>
	";
		if (loginId == "") {
			alert("로그인 후 사용가능합니다");
			document.getElementById("repFrm").action = "Login";
			return false;
		} else
			$.ajax({
				type : 'post',
				url : 'IdChk',
				data : {
					loginId : loginId
				},
				success : function(msg) {

				}

			});
	}

	function update_bo_Func() {
		var bnum = document.getElementById("bnum").value;
		var pg = document.getElementById("pg").value;
		location.href = "NoticeUpdate?bnum=" + bnum + "&page=" + pg;
	}
</script>
</html>