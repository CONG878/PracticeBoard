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
 * Servlet implementation class MainPageController
 */
@WebServlet("/MainPage")
public class MainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainPage() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<NoticeBoardVO> notice_rs = new NoticeBoardDAO().arrayHit();

		request.setAttribute("notice_b_list", notice_rs);

		ArrayList<NoticeBoardVO> notice_rs2 = new NoticeBoardDAO().arrayNew();

		request.setAttribute("notice_New_bo_list", notice_rs2);

		RequestDispatcher dispatcher = request.getRequestDispatcher("mainPage.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
