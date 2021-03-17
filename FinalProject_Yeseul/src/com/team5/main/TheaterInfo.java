package com.team5.main;

public class TheaterInfo {

	private String t_movieNm;
	private String t_openDt;
	private String t_audiAcc;
	private String t_rank;
	
	public TheaterInfo() {
		// TODO Auto-generated constructor stub
	}

	public TheaterInfo(String t_movieNm, String t_openDt, String t_audiAcc, String t_rank) {
		super();
		this.t_movieNm = t_movieNm;
		this.t_openDt = t_openDt;
		this.t_audiAcc = t_audiAcc;
		this.t_rank = t_rank;
	}

	public String getT_movieNm() {
		return t_movieNm;
	}

	public void setT_movieNm(String t_movieNm) {
		this.t_movieNm = t_movieNm;
	}

	public String getT_openDt() {
		return t_openDt;
	}

	public void setT_openDt(String t_openDt) {
		this.t_openDt = t_openDt;
	}

	public String getT_audiAcc() {
		return t_audiAcc;
	}

	public void setT_audiAcc(String t_audiAcc) {
		this.t_audiAcc = t_audiAcc;
	}

	public String getT_rank() {
		return t_rank;
	}

	public void setT_rank(String t_rank) {
		this.t_rank = t_rank;
	}
	
	
}
