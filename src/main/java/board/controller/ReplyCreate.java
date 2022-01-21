package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dao.ReplyDAO;
import board.model.ReplyVO;

/**
 * Servlet implementation class ReplyCreate
 */
@WebServlet("/ReplyCreate")
public class ReplyCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReplyCreate() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/hrml; charset=UTF-8");
		HttpSession session = request.getSession();
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pg = request.getParameter("pg");
		String search = request.getParameter("search");
		String comment = request.getParameter("comment");
		String writerId = (String) session.getAttribute("loginId");
		String writerName = (String) session.getAttribute("loginName");

		ReplyVO rvo = new ReplyVO();
		rvo.setRefNum(bnum);
		rvo.setComment(comment);
		rvo.setWriterId(writerId);
		rvo.setWriterName(writerName);

		new ReplyDAO().create(rvo);
		new ReplyDAO().bo_update(bnum);
		response.sendRedirect("NoticeView?bnum=" + bnum + "&search=" + search + "&page=" + pg);
	}

}
