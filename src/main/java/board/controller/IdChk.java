package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.LoginDAO;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class IdChk
 */
@WebServlet("/IdChk")
public class IdChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IdChk() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		String method = request.getMethod();
		if (!"POST".equalsIgnoreCase(method)) {
			response.sendRedirect("https://ecrm.cyber.go.kr/");
		} else {
			String loginId = request.getParameter("loginId");
			LoginDAO loginDAO = new LoginDAO();
			msg = loginDAO.idchk(loginId);

			// System.out.println(msg);
			// System.out.println(loginId);
		}
		JSONObject obj = new JSONObject();

		// String str = "World";

		// obj.put("str", str);

		obj.put("msg", msg);

		response.setContentType("application/x-json; charset=utf-8");
		// request.setAttribute("msg", obj);
		response.getWriter().print(obj); // 전송이 되는 부분

		/*
		 * request.setAttribute("msg", msg);
		 * response.sendRedirect("MemberCreate?msg="+msg); System.out.println(msg);
		 */
	}

}
