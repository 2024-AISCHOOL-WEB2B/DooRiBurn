package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class CommentLikeDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private void dbOpen() {		
		try { 
			Class.forName("oracle.jdbc.driver.OracleDriver");	  
			String db_id = "Insa5_SpringB_hacksim_1";
			String db_pw = "aishcool1";
			String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
 
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
	
	// 댓글 좋아요 저장
	public int commentLike(CommentLikeDTO dto) {		
		int cnt = 0; 
		dbOpen();
		 
		try { 
			
			String sql = "INSERT INTO TB_COMMENT_LIKE (cmt_like, email, cmt_num, cmt_like_date) VALUES (?, ?, TO_DATE(TO_CHAR(SYSDATE)))"; 
			psmt = conn.prepareStatement(sql); 
			psmt.setString(1, dto.getEmail());
			psmt.setInt(2, dto.getCmt_num()); 
			
			cnt = psmt.executeUpdate();
			 
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			dbClose();
		} 
		return cnt; 
	} 
	
	
	// 댓글 좋아요 취소   cmt_like
	public int commentLikeDel(int num) { 		
		int cnt = 0;
		dbOpen();
		 
		try {
			String sql = "DELETE FROM TB_COMMENT_LIKE WHERE CMT_LIKE = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			dbClose();
		} 
		return cnt;
	}
	
	// 댓글 좋아요 리스트  cmt_like 
 
	 
	
	
	
}
