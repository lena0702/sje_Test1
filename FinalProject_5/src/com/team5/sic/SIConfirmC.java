package com.team5.sic;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.main.DAO;


@WebServlet("/SIConfirmC")
public class SIConfirmC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SIConfirmC() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 진짜 회원가입하는 컨트롤러
		DAO.regUser(request);
		request.setAttribute("contentPage", "signInConfirm.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
