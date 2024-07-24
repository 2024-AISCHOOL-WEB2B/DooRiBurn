package com.model;

public class DramaSearchDTO {
	
	private int search_type;
	 

	// 촬영지 번호 
    private Double f_num;

    // 드라마 
    private String drama;

    // 주소 
    private String f_addr;

    // 위도 
    private Double lat;

    // 경도 
    private Double lon;

    // 장소이름 
    private String f_name;

    // 드라마씬 
    private String scene;

    // 전화번호 
    private String f_tel;

    // 영업시간 
    private String f_time;

    public Double getFNum() {
        return f_num;
    }

    public void setFNum(Double fNum) {
        this.f_num = f_num;
    }

    public String getDrama() {
        return drama;
    }

    public void setDrama(String drama) {
        this.drama = drama;
    }

    public String getFAddr() {
        return f_addr;
    }

    public void setFAddr(String fAddr) {
        this.f_addr = f_addr;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLon() {
        return lon;
    }

    public void setLon(Double lon) {
        this.lon = lon;
    }

    public String getFName() {
        return f_name;
    }
    
    public int getSearch_type() {
		return search_type;
	}

	public void setSearch_type(int search_type) {
		this.search_type = search_type;
	}
    
    public void setFName(String fName) {
        this.f_name = f_name;
    }

    public String getScene() {
        return scene;
    }

    public void setScene(String scene) {
        this.scene = scene;
    }

    public String getFTel() {
        return f_tel;
    }

    public void setFTel(String fTel) {
        this.f_tel = f_tel;
    }

    public String getFTime() {
        return f_time;
    }

    public void setFTime(String fTime) {
        this.f_time = f_time;
    }
}