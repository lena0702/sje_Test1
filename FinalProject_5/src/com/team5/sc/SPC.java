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
 * Servlet implementation class SPC
 */
@WebServlet("/SPC")
public class SPC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DAO.logIn(request);
		DAO.loginCheck(request);
		
		int p = Integer.parseInt(request.getParameter("p"));
		DAO.moviesPaging(p, request, GetMovie.getMovie(request));
		
		request.setAttribute("contentPage", "searchResult.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
