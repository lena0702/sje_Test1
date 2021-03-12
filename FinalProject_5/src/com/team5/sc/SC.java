package com.team5.sc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.main.DAO;
import com.team5.main.GetMovie;

/**
 * Servlet implementation class SC
 */
@WebServlet("/SC")
public class SC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DAO.logIn(request);
		DAO.loginCheck(request);
		DAO.moviesPaging(1, request, GetMovie.getMovie(request));

		request.setAttribute("contentPage", "searchResult.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
