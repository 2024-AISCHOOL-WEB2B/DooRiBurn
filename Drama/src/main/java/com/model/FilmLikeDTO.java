package com.model;

import java.util.Date;

public class FilmLikeDTO {

	private int likeNum; // PK
	private String email;
	private int filmNum;
	private Date likeDate;

	public FilmLikeDTO() {
	}

	public FilmLikeDTO(String email, int filmNum) {
		this.email = email;
		this.filmNum = filmNum;
	}

	public FilmLikeDTO(int likeNum, String email, int filmNum, Date likeDate) {
		this.likeNum = likeNum;
		this.email = email;
		this.filmNum = filmNum;
		this.likeDate = likeDate;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getFilmNum() {
		return filmNum;
	}

	public void setFilmNum(int filmNum) {
		this.filmNum = filmNum;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}
}
