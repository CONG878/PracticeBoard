package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dao.NoticeBoardDAO;
import board.model.NoticeBoardVO;

/**
 * Servlet implementation class NoticeCreate
 */
@WebServlet("/NoticeCreate")
public class NoticeCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeCreate() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("noticeCreate.jsp");
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
		HttpSession session = request.getSession();
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String writerId = (String) session.getAttribute("loginId");
		String writerName = (String) session.getAttribute("loginName");
		String ip = request.getRemoteAddr();
		// System.out.println("writerName: "+writerName);
		NoticeBoardVO nvo = new NoticeBoardVO();
		nvo.setSubject(subject);
		nvo.setContent(content);
		nvo.setWriterId(writerId);
		nvo.setWriterName(writerName);
		nvo.setIp(ip);

		new NoticeBoardDAO().create(nvo);
		// System.out.println("nvo: "+nvo.getWriterName());

		response.sendRedirect("NoticeBoard");
	}

}
