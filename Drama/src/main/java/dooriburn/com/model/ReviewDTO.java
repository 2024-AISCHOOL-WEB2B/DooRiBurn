package dooriburn.com.model;

import java.lang.reflect.Array;
import java.util.ArrayList;

import dooriburn.com.controller.EmailCheckService;

public class ReviewDTO {

	private String email;
	private Double F_num;
	private int rating;
	private String content;
	private String[] mood;
	
	public ReviewDTO(String email, Double f_num, int rating, String content, String[] mood) {
		super();
		this.email = email;
		F_num = f_num;
		this.rating = rating;
		this.content = content;
		this.mood = mood;
		
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Double getF_num() {
		return F_num;
	}

	public void setF_num(Double f_num) {
		F_num = f_num;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String[] getMood() {
		return mood;
	}

	public void setMood(String[] mood) {
		this.mood = mood;
	}
	
	
	
	
}
