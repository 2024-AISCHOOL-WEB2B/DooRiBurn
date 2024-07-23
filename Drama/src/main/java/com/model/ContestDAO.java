package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ContestDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs; 

	private void dbOpen() {		
		try { 
			Class.forName("oracle.jdbc.driver.OracleDriver");	 
			String db_id = "hr";
			String db_pw = "12345";
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
 
			conn = DriverManager.getConnection(db_url, db_id, db_pw);			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	private void dbClose() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
	}
	

	// 공모전 게시글 업로드
	public int contestPost(ContestDTO dto) {
		
		int cnt = 0; 
		dbOpen();
		
		try { 
			String sql = "INSERT INTO TB_CONTEST VALUES(MSGNUM.NEXTVAL, ?, SYSDATE, ?,? )";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getC_title());
			psmt.setString(2, dto.getC_img());
			psmt.setString(3, dto.getC_content());
			
			cnt = psmt.executeUpdate();
			 
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			dbClose();
		} 
		return cnt; 
	}
	    
	// 공모전 게시판 페이징 
	public ArrayList<ContestDTO> getList(int pageNumber){
		ArrayList<ContestDTO> list = new ArrayList<ContestDTO>();
		ContestDTO post = null;
		
		try { 
			String sql = "SELECT * FROM TB_CONTEST ORDER BY C_NUM DESC 10";
			psmt = conn.prepareStatement(sql); 
			// psmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = psmt.executeQuery();
			while(rs.next()) { 
				int num = rs.getInt("C_NUM");
				String title = rs.getString("C_TITLE");
				String date = rs.getString("C_DATE");
				String img = rs.getString("C_IMG");
				String content = rs.getString("C_CONTENT");
				
				post = new ContestDTO(num, title, date, img, content);
			} 
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			dbClose();
		} 
		return post; 
		}
	
	/*
	 	public ArrayList<MessageDTO> messageSelect(String memberEmail) { 
		ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
		MessageDTO msg = null;
		dbOpen(); 
		try {
			String sql = "SELECT * FROM MESSAGE WHERE EMAIL = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memberEmail);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("NUM");
				String name = rs.getString("NAME");
				String email = rs.getString("EMAIL");
				String contents = rs.getString("CONTENTS");
				String indate = rs.getString("INDATE"); 
				
				msg = new MessageDTO(num, name, email, contents, indate);
				list.add(msg); 
			}  
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			dbClose();
		} 
		return list;  
	 * */

	
	
	// 공모전 게시판 페이징 처리를 위한 함수 (글이 10개 이하인 경우)
	
	
	
}
