<%@page import="board.dao.NoticeBoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
   String loginId = null;
   if(session.getAttribute("loginId") != null) {
	   loginId = (String) session.getAttribute("loginId");
   }
   if(loginId == null) {
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('로그인을 해주세요.');");
	   script.println("location.href = 'userLogin.jsp'");
	   script.println("</script>");
	   script.close();
	   return;
   }
   
   request.setCharacterEncoding("UTF-8");
   String loginId = null;
   if(request.getParameter("loginId") != null) {
	   loginId = request.getParameter("loginId");
   }
   NoticeBoardDAO NoticeBoardDAO = new NoticeBoardDAO();
   if(loginId.equals(NoticeBoardDAO.getLoginId(loginId))) {
	   int result = new NoticeBoardDAO().delete(loginId);
	   if (result == 1) {
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('삭제가 완료되었습니다');");
		   script.println("location.href = 'index.jsp'");
		   script.println("</script>");
		   script.close();
		   return;
	   } else {
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('데이터베이스 오류가 발생했습니다..');");
		   script.println("history.back();");
		   script.println("</script>");
		   script.close();
		   return;
	   }
   } else {
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('자신이 쓴 글만 삭제 가능합니다.');");
		   script.println("history.back();");
		   script.println("</script>");
		   script.close();
		   return;
	   }
   
   
%> --%>