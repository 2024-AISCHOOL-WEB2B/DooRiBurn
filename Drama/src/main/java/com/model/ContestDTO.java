package com.model;

public class ContestDTO {

	private int c_num;
	private String c_title;
	private String c_date;
	private String c_img;
	private String c_content;
  
	public ContestDTO() { 
	}

	public ContestDTO(int c_num, String c_title, String c_date, String c_img, String c_content) {
		this.c_num = c_num;
		this.c_title = c_title;
		this.c_date = c_date;
		this.c_img = c_img;
		this.c_content = c_content;
	}
	
	
	public ContestDTO(int c_num, String c_title, String c_date) {
		super();
		this.c_num = c_num;
		this.c_title = c_title;
		this.c_date = c_date;
	}


	public ContestDTO(String c_title, String c_img, String c_content) {
		super();
		this.c_title = c_title;
		this.c_img = c_img;
		this.c_content = c_content;
	}

	public int getC_num() {
		return c_num;
	} 
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public String getC_img() {
		return c_img;
	}
	public void setC_img(String c_img) {
		this.c_img = c_img;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	 
	
}
