package com.team5.main;
import java.math.BigDecimal;
import java.util.Date;
public class Review {
	private BigDecimal r_no;
	private Date r_date;
	private String r_title;
	private String r_userid;
	private String r_username;
	private String r_review;
	private BigDecimal r_star;
	public Review() {
		// TODO Auto-generated constructor stub
	}
	public Review(BigDecimal r_no, Date r_date, String r_title, String r_userid, String r_username, String r_review,
			BigDecimal r_star) {
		super();
		this.r_no = r_no;
		this.r_date = r_date;
		this.r_title = r_title;
		this.r_userid = r_userid;
		this.r_username = r_username;
		this.r_review = r_review;
		this.r_star = r_star;
	}
	public BigDecimal getR_no() {
		return r_no;
	}
	public void setR_no(BigDecimal r_no) {
		this.r_no = r_no;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_userid() {
		return r_userid;
	}
	public void setR_userid(String r_userid) {
		this.r_userid = r_userid;
	}
	public String getR_username() {
		return r_username;
	}
	public void setR_username(String r_username) {
		this.r_username = r_username;
	}
	public String getR_review() {
		return r_review;
	}
	public void setR_review(String r_review) {
		this.r_review = r_review;
	}
	public BigDecimal getR_star() {
		return r_star;
	}
	public void setR_star(BigDecimal r_star) {
		this.r_star = r_star;
	}
 
}