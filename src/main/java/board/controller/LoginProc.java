package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dao.LoginDAO;
import board.model.MemberVO;

/**
 * Servlet implementation class LoginProc
 */
@WebServlet("/LoginProc")
public class LoginProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginProc() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		String url = "";

		HttpSession session = request.getSession();

		MemberVO amo = new MemberVO();
		amo.setLoginId(loginId);
		amo.setLoginPw(loginPw);
		amo = new LoginDAO().loginChk(amo);

		// System.out.println(amo.getLoginId());
		// System.out.println(amo.getLoginRole());

		if ("user".equals(amo.getLoginRole())) {
			session.setAttribute("loginId", amo.getLoginId());
			session.setAttribute("loginPw", amo.getLoginPw());
			session.setAttribute("loginName", amo.getLoginName());
			url = "MainPage";
		} else if ("admin".equals(amo.getLoginRole())) {
			session.setAttribute("loginId", amo.getLoginId());
			session.setAttribute("loginPw", amo.getLoginPw());
			session.setAttribute("loginName", amo.getLoginName());
			url = "AdminPage";
		} else if (amo.getLoginRole() == null) {
			url = "Login";
		}
		// System.out.println(amo.getLoginRole());
		response.sendRedirect(url);

	}

}
