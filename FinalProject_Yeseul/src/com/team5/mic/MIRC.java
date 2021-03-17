package com.team5.mic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.main.DAO;

/**
 * Servlet implementation class MIC
 */
@WebServlet("/MIRC")
public class MIRC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DAO.logIn(request);
		DAO.loginCheck(request);
		
		int p = Integer.parseInt(request.getParameter("p"));
		DAO.reviewsPaging(p, request, DAO.reviewPage(request));
		
		request.setAttribute("movieReviewWrite", "movieInfoWrite.jsp");
		request.setAttribute("movieInfoReviews", "movieInfoReviews.jsp");
		request.setAttribute("contentPage", "movieInfo.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
