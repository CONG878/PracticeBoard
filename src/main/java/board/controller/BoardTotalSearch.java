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
 * Servlet implementation class BoardTotalSearch
 */
@WebServlet("/BoardTotalSearch")
public class BoardTotalSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardTotalSearch() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String t_search = request.getParameter("t_search");
		// System.out.println(t_search);
		/*
		 * if("".equals(t_search) || t_search == null) { ArrayList<NoticeBoardVO> nal =
		 * new NoticeBoardDAO().read(); request.setAttribute("totalList", nal); //url =
		 * "noticeBoardList.jsp"; }
		 */

		ArrayList<NoticeBoardVO> nal = new NoticeBoardDAO().t_search(t_search);
		request.setAttribute("totalList", nal);
		// url = "noticeBoardList.jsp?bnum="+bnum+"&search="+search;

		RequestDispatcher dispatcher = request.getRequestDispatcher("boardTotalSearch.jsp?t_search=" + t_search);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
