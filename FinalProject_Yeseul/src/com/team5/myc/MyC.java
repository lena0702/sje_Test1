package com.team5.myc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.main.DAO;
import com.team5.main.GetMovie;

@WebServlet("/MyC")
public class MyC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		DAO.logIn(request);
		DAO.loginCheck(request);
		if (request.getSession() != null) {			
			GetMovie.getR_Movie(request);
			DAO.reviewsPaging(1, request, DAO.getMyReviews(request));;
			
			request.setAttribute("contentPage", "myPage.jsp");
		} else {
			request.setAttribute("contentPage", "home.jsp");
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

