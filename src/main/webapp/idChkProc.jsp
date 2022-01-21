<%@page import="java.sql.ResultSet"%><%@page
	import="java.sql.PreparedStatement"%><%@page
	import="java.sql.DriverManager"%><%@page import="java.sql.Connection"%><%@ page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String method = request.getMethod();
if (!"POST".equalsIgnoreCase(method)) {
	response.sendRedirect("https://ecrm.cyber.go.kr/");
} else {

	String id = request.getParameter("id");
	String url = "jdbc:mysql://localhost:3306/startdb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";

	StringBuffer sql = new StringBuffer();
	sql.append(" SELECT * FROM member WHERE id = ? ");

	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = DriverManager.getConnection(url, "root", "smart");
	PreparedStatement stmt = conn.prepareStatement(sql.toString());

	stmt.setString(1, id);

	ResultSet rs = stmt.executeQuery();

	if (rs.next()) {
		out.print("Y"); //아이디가 DB에 이미 있다. 중복 O
	} else {
		out.print("N"); //아이디 생성이 가능하다. 중복 X
	}

	conn.close();
	stmt.close();
	rs.close();

}
%>