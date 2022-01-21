package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dao.NoticeBoardDAO;
import board.dao.ReplyDAO;
import board.model.NoticeBoardVO;
import board.model.ReplyVO;

/**
 * Servlet implementation class NoticeView
 */
@WebServlet("/NoticeView")
public class NoticeView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeView() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "noticeView.jsp";
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");

		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;

		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("VIEWCOOKIE")) {
					viewCookie = cookies[i];
				}

			}
		}

		// 만약 viewcookie가 없다면
		if (viewCookie == null) {
			// System.out.println("VIEWCOOKIE 없음");
			Cookie newCookie = new Cookie("VIEWCOOKIE", "|" + bnum + "|");
			newCookie.setMaxAge(60 * 60);
			response.addCookie(newCookie);
			new NoticeBoardDAO().readHit(bnum);
		} else {
			// System.out.println("VIEWCOOKIE 있음");
			String value = viewCookie.getValue();
			// System.out.println(value.indexOf("|"+bnum+"|"));
			if (value.indexOf("|" + bnum + "|") < 0) {
				value = value + "|" + bnum + "|";
				viewCookie.setValue(value);
				response.addCookie(viewCookie);
				new NoticeBoardDAO().readHit(bnum);
			}
		}

		try {
			NoticeBoardVO nvo = new NoticeBoardDAO().read(bnum);
			request.setAttribute("noticeView", nvo);

			int count = new ReplyDAO().counting(bnum);
			request.setAttribute("count", count);

			ArrayList<ReplyVO> rvo = new ReplyDAO().read(bnum);
			request.setAttribute("replyView", rvo);
			// new NoticeBoardDAO().readHit(bnum);
		} catch (Exception e) {
			url = "errorPage500.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/hrml; charset=UTF-8");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String search = request.getParameter("search");
		String pg = request.getParameter("pg");

		response.sendRedirect("NoticeUpdate?bnum=" + bnum + "&search=" + search + "&page=" + pg);
	}

}
