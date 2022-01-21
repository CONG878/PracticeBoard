package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.NoticeBoardDAO;
import board.model.NoticeBoardVO;

/**
 * Servlet implementation class NoticeUpdate
 */
@WebServlet("/NoticeUpdate")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeUpdate() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		NoticeBoardVO nvo = new NoticeBoardDAO().read(bnum);
		request.setAttribute("noticeView", nvo);

		RequestDispatcher dispatcher = request.getRequestDispatcher("noticeUpdate.jsp");
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
		String pg = request.getParameter("pg");
		String search = request.getParameter("search");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		// int like = Integer.parseInt(request.getParameter("like"));
		// String writerDate = request.getParameter("writerDate");

		NoticeBoardVO nvo = new NoticeBoardVO();
		nvo.setNum(bnum);
		nvo.setSubject(subject);
		nvo.setContent(content);
		// nvo.setLike(like);
		// nvo.setWriterDate(Timestamp.valueOf(writerDate)); // String을 Date로 바꿔주는 것

		new NoticeBoardDAO().update(nvo);

		response.sendRedirect("NoticeView?bnum=" + bnum + "&search=" + search + "&page=" + pg);
	}

}
