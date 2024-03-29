package com.team5.rc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.main.DAO;

/**
 * Servlet implementation class RPC
 */
@WebServlet("/RPC")
public class RPC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO.logIn(request);
		DAO.loginCheck(request);

		int p = Integer.parseInt(request.getParameter("p"));
		DAO.reviewsPaging(p, request, DAO.getAllReviews(request));

		request.setAttribute("contentPage", "review.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
