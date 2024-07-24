package com.model;

import java.util.Date;

public class CommentDTO {
	
	private int cmt_num;
	private String cmt_content;
	private String cmt_img;
	private Date cmt_date;
	private int c_num;
	private String email;
	private String cmt_title;
	 
	
	public CommentDTO() { 
	}
	
	
	public CommentDTO(String cmt_img, int c_num, String email) { 
		this.cmt_img = cmt_img;
		this.c_num = c_num;
		this.email = email;
	}
 

	public CommentDTO(int cmt_num, String cmt_content, String cmt_img, Date cmt_date, int c_num, String email,
			String cmt_title) {
		super();
		this.cmt_num = cmt_num;
		this.cmt_content = cmt_content;
		this.cmt_img = cmt_img;
		this.cmt_date = cmt_date;
		this.c_num = c_num;
		this.email = email;
		this.cmt_title = cmt_title;
	}
	public int getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(int cmt_num) {
		this.cmt_num = cmt_num;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCmt_img() {
		return cmt_img;
	}
	public void setCmt_img(String cmt_img) {
		this.cmt_img = cmt_img;
	}
	public Date getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(Date cmt_date) {
		this.cmt_date = cmt_date;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCmt_title() {
		return cmt_title;
	}
	public void setCmt_title(String cmt_title) {
		this.cmt_title = cmt_title;
	}
	
	
	
	
	
	
	
	

}
