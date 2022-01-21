<%-- <%@page import="inven.DAO.NoticeBoardDAO"%>
<%@page import="inven.DAO.LikeDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}%>
<%
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
   String writerId = null;
   if(request.getParameter("loginId") != null) {
	   loginId = request.getParameter("loginId");
   }
   NoticeBoardDAO NoticeBoardDAO = new NoticeBoardDAO();
   LikeDAO likeDAO = new LikeDAO();
   int result = likeDAO.like(loginId, loginId, getClientIP(request));
	   if (result == 1) {
		   result = NoticeBoardDAO.like(loginId);
		   if (result == 1) {
			   PrintWriter script = response.getWriter();
			   script.println("<script>");
			   script.println("alert('추천이 완료되었습니다.');");
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
		   script.println("alert('이미 추천을 누른 글입니다.');");
		   script.println("history.back();");
		   script.println("</script>");
		   script.close();
		   return;
	   }
	  
%> --%>