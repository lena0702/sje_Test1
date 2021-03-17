package com.team5.myc;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.team5.main.DAO;
import com.team5.main.GetMovie;

@WebServlet("/MPC")
public class MPC extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DAO.logIn(request);
		DAO.loginCheck(request);
		GetMovie.getR_Movie(request);
		
		int p = Integer.parseInt(request.getParameter("p"));
		DAO.reviewsPaging(p, request, DAO.getMyReviews(request));;
		request.setAttribute("contentPage", "myPage.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}