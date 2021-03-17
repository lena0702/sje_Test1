package com.team5.main;

import java.math.BigDecimal;
import java.util.Date;

public class MovieUser {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_gender;
	private Date u_birth;
	private BigDecimal u_fav;

	public MovieUser() {
		// TODO Auto-generated constructor stub
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public Date getU_birth() {
		return u_birth;
	}

	public void setU_birth(Date u_birth) {
		this.u_birth = u_birth;
	}

	public BigDecimal getU_fav() {
		return u_fav;
	}

	public void setU_fav(BigDecimal u_fav) {
		this.u_fav = u_fav;
	}

	public MovieUser(String u_id, String u_pw, String u_name, String u_gender, Date u_birth, BigDecimal u_fav) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_gender = u_gender;
		this.u_birth = u_birth;
		this.u_fav = u_fav;
	}

}
