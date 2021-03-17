package com.team5.lic;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.main.DAO;
import com.team5.main.GetMovie3;

/**
 * Servlet implementation class LIConfirmC
 */
@WebServlet("/LIConfirmC")
public class LIConfirmC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 이게 진짜 로그인하는 컨트롤러
		// 메소드 필요
		try {
		DAO.logIn(request);
		DAO.loginCheck(request);
			GetMovie3.getMovieChart(request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (request.getAttribute("loginResult") != null) {
			request.setAttribute("contentPage", "loginFail.jsp");
		} else {
			request.setAttribute("contentPage", "main.jsp");
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
