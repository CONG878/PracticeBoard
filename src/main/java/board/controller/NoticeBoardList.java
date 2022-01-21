package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.NoticeBoardDAO;
import board.model.NoticeBoardVO;

/**
 * Servlet implementation class NoticeBoard
 */
@WebServlet("/NoticeBoard")
public class NoticeBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeBoardList() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("search");

		int pg = 1; // 현재페이지
		int ppn = 5; // 페이지에 보여줄 갯수

		String pgN = request.getParameter("page");
		try {
			pg = Integer.parseInt(pgN);
		} catch (Exception e) {
			pg = 1;
		}

		int totalRows = new NoticeBoardDAO().conting();
		int count = new NoticeBoardDAO().conting();
		int lastPage = ((totalRows - 1) / ppn) + 1;

		totalRows = totalRows - ((pg - 1) * ppn);
		request.setAttribute("pg", pg);
		request.setAttribute("ppn", ppn);
		request.setAttribute("count", count);
		request.setAttribute("totalRows", totalRows);
		request.setAttribute("lastPage", lastPage);
		// String url = null;
		// System.out.println(search);
		if ("".equals(search) || search == null) {
			ArrayList<NoticeBoardVO> nal = new NoticeBoardDAO().All_read(pg, ppn);
			request.setAttribute("noticeList", nal);
			// url = "noticeBoardList.jsp";
		} else {
			ArrayList<NoticeBoardVO> nal = new NoticeBoardDAO().search(search);
			request.setAttribute("noticeList", nal);
			// url = "noticeBoardList.jsp?bnum="+bnum+"&search="+search;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("noticeBoardList.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// response.sendRedirect("NoticeBoard?search="+search);
	}

}
