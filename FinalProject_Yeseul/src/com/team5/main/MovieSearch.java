package com.team5.main;

import java.math.BigDecimal;

public class MovieSearch {
	private String m_title;
	private String m_actor;
	private String m_subtitle;
	private String m_pubdate;
	private String m_director;
	private String m_image;
	private BigDecimal m_rating;

	public MovieSearch() {
		// TODO Auto-generated constructor stub
	}

	public MovieSearch(String m_title, String m_actor, String m_subtitle, String m_pubdate, String m_director,
			String m_image, BigDecimal m_rating) {
		super();
		this.m_title = m_title;
		this.m_actor = m_actor;
		this.m_subtitle = m_subtitle;
		this.m_pubdate = m_pubdate;
		this.m_director = m_director;
		this.m_image = m_image;
		this.m_rating = m_rating;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getM_actor() {
		return m_actor;
	}

	public void setM_actor(String m_actor) {
		this.m_actor = m_actor;
	}

	public String getM_subtitle() {
		return m_subtitle;
	}

	public void setM_subtitle(String m_subtitle) {
		this.m_subtitle = m_subtitle;
	}

	public String getM_pubdate() {
		return m_pubdate;
	}

	public void setM_pubdate(String m_pubdate) {
		this.m_pubdate = m_pubdate;
	}

	public String getM_director() {
		return m_director;
	}

	public void setM_director(String m_director) {
		this.m_director = m_director;
	}

	public String getM_image() {
		return m_image;
	}

	public void setM_image(String m_image) {
		this.m_image = m_image;
	}

	public BigDecimal getM_rating() {
		return m_rating;
	}

	public void setM_rating(BigDecimal m_rating) {
		this.m_rating = m_rating;
	}


}