package com.team5.main;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

public class DAO {

	public static void regUser(HttpServletRequest request) {
		// TODO Auto-generated method stub
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			SqlSession ss = DBManager.connect();
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			StringToDate st = new StringToDate();
			Date birth = st.transformDate(request.getParameter("birth"));
			BigDecimal fav = new BigDecimal(request.getParameter("fav"));
			MovieUser mu = new MovieUser(id, pw, name, gender, birth, fav);
			if (ss.insert("team5.regUser", mu) == 1) {
				System.out.println("등록성공");
			}
			request.setAttribute("mu", mu);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static List<MovieUser> getUserInfo(HttpServletRequest request) {
		// 유저정보 가져오기
		try {
			SqlSession ss = DBManager.connect();

			MovieUser u = new MovieUser();

			List<MovieUser> allusers = ss.selectList("team5.getUserInfo", u);
			request.setAttribute("allusers", allusers);
			return allusers;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static void logIn(HttpServletRequest request) {
		try {

			SqlSession ss = DBManager.connect();
			request.setCharacterEncoding("UTF-8");

			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			if (id != null && pw != null) {
				LoginUser lu = new LoginUser(id, pw);

				List<MovieUser> MovieUser = ss.selectList("team5.loginCheck", lu);

				if (MovieUser.isEmpty()) {
					System.out.println("fail");
					request.setAttribute("loginResult", "fail");
				} else {
					System.out.println("login");
					System.out.println(MovieUser.get(0).getU_name());
					HttpSession hs = request.getSession();
					hs.setAttribute("accountInfo", MovieUser.get(0));

					hs.setMaxInactiveInterval(300);
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void loginCheck(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		MovieUser mu = (MovieUser) hs.getAttribute("accountInfo");

		if (mu != null) {
			hs.setAttribute("loginOX", "O");
		} else {
			hs.setAttribute("loginOX", "X");
		}
	}

	public static void logout(HttpServletRequest request) {
		request.getSession().setAttribute("accountInfo", null);

	}

	public static void getMyStar(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		MovieUser mu = (MovieUser) hs.getAttribute("accountInfo");
		if (mu != null) {
			System.out.println(mu.getU_id());
			try {
				SqlSession ss = DBManager.connect();
				String title = request.getParameter("movietitle");

				Star s = new Star(title, mu.getU_id());

				List<Review> reviews = ss.selectList("team5.getMyStar", s);

				double myStarSum = 0;
				double myStarAvg = 0.00;
				if (!reviews.isEmpty()) {
					myStarAvg = myStarSum / reviews.size();
					for (int i = 0; i < reviews.size(); i++) {
						myStarSum = +reviews.get(i).getR_star().doubleValue();
					}
					myStarAvg = myStarSum / reviews.size();
				}

				request.setAttribute("myStar", myStarAvg);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static List<Review> reviewPage(HttpServletRequest request) {
		// 모든 리뷰 정보 아님
		// 그 제목인 영화의 리뷰가 나옴!
		try {
			SqlSession ss = DBManager.connect();

			String title = request.getParameter("title");
			Review r = new Review();

			r.setR_title(title);

			List<Review> reviews = ss.selectList("team5.getReview", r);
			for (Review rr : reviews) {
				rr.setR_review(rr.getR_review().replace("<br>", "\r\n"));
			}
			request.setAttribute("reviews", reviews);
			return reviews;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static List<Review> getAllReviews(HttpServletRequest request) {
		// 이게 모든 리뷰 정보 가져오는 메소드
		try {
			SqlSession ss = DBManager.connect();

			Review r = new Review();

			List<Review> allReviews = ss.selectList("team5.getAllReviews", r);
			for (Review rr : allReviews) {
				rr.setR_review(rr.getR_review().replace("<br>", "\r\n"));
			}
			request.setAttribute("allReviews", allReviews);
			request.setAttribute("reviewsNum", allReviews.size() + 1);
			return allReviews;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static List<Review> getMyReviews(HttpServletRequest request) {
		// 내가 쓴 모든 영화에 대한 모든 리뷰들 받아오는 메소드
		HttpSession hs = request.getSession();
		MovieUser mu = (MovieUser) hs.getAttribute("accountInfo");
		if (mu != null) {
			System.out.println(mu.getU_id());
			try {
				SqlSession ss = DBManager.connect();
				Review r = new Review();
				r.setR_userid(mu.getU_id());

				List<Review> reviews = ss.selectList("team5.getMyReview", r);
				request.setAttribute("myReview", reviews);
				return reviews;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public static void getAvgStar(HttpServletRequest request) {
		// 그 영화에 준 모든 유저들의 평균 별점
		try {
			SqlSession ss = DBManager.connect();

			Review r = new Review();
			r.setR_title(request.getParameter("title"));

			List<Review> avgStar = ss.selectList("team5.getAvgStar", r);
			request.setAttribute("avgStar", avgStar.get(0).getR_star());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void regReview(HttpServletRequest request) {
		try {
			SqlSession ss = DBManager.connect();
			request.setCharacterEncoding("UTF-8");
			String title = request.getParameter("title");
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String review = request.getParameter("review");
			BigDecimal star = new BigDecimal(request.getParameter("star"));
			Review rv = new Review(null, null, title, userid, username, review, star);
			if (ss.insert("team5.regReview", rv) == 1) {
				System.out.println("리뷰 등록 성공");
				request.setAttribute("regReviewResult", "리뷰 등록 성공");
			} else {
				request.setAttribute("regReviewResult", "리뷰 등록 실패");
			}
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void reviewsPaging(int page, HttpServletRequest request, List<Review> reviews) {
		request.setAttribute("curPageNo", page);
		int cnt = 5; // 한 페이지당 보여줄 개수
		int total = reviews.size();// 데이터 총 개수
		int pageCount = (int) Math.ceil((total / (double) cnt)); // 전체 페이지 수
		request.setAttribute("pageCount", pageCount);
		int start = total - (cnt * (page - 1));// n페이지의 시작하는 글 번호
		int end = (page == pageCount) ? -1 : start - (cnt + 1);// n페이지의 끝나는 글 번호
		// 왜 -1? 지금 우리가 하려는 건 한 페이지당 3개를 보여줄 것.
		// 반복문을 돌리는데 3개씩 끊어서 돌리자는 것.
		ArrayList<Review> items = new ArrayList<Review>();
		if (!reviews.isEmpty()) {
			for (int i = start - 1; i > end; i--) {
				items.add(reviews.get(i));
			}
		}
		// i--인 이유는 마지막에 등록한 것부터 보여주기 위함.
		// -1인 이유는 인덱스 0까지 하려고.
		request.setAttribute("reviews", items);
	}

	public static void moviesPaging(int page, HttpServletRequest request, List<MovieSearch> movies) {
		request.setAttribute("curPageNo", page);
		int cnt = 5; // 한 페이지당 보여줄 개수
		int total = movies.size();// 데이터 총 개수
		int pageCount = (int) Math.ceil((total / (double) cnt)); // 전체 페이지 수
		request.setAttribute("pageCount", pageCount);
		int start = total - (cnt * (page - 1));// n페이지의 시작하는 글 번호
		int end = (page == pageCount) ? -1 : start - (cnt + 1);// n페이지의 끝나는 글 번호
		// 왜 -1? 지금 우리가 하려는 건 한 페이지당 3개를 보여줄 것.
		// 반복문을 돌리는데 3개씩 끊어서 돌리자는 것.
		ArrayList<MovieSearch> items = new ArrayList<MovieSearch>();
		if (!movies.isEmpty()) {
			for (int i = start - 1; i > end; i--) {
				items.add(movies.get(i));
			}
		}
		// i--인 이유는 마지막에 등록한 것부터 보여주기 위함.
		// -1인 이유는 인덱스 0까지 하려고.
		request.setAttribute("movies", items);
	}

	public static boolean idCheck(HttpServletRequest request, HttpServletResponse response) {
		try {
			SqlSession ss = DBManager.connect();
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			List<MovieUser> mu = ss.selectList("team5.idCheck", id);
			if (mu.isEmpty()) {
				return true;
			} else {
				request.setAttribute("re", "ID 중복");
				return false;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
