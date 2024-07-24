package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class CommentDAO {

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

	// 댓글 업로드
	public int commentPost(CommentDTO dto) {
		
		int cnt = 0; 
		dbOpen();
		
		try { 
			String sql = "INSERT INTO TB_C_COMMENT VALUES (MSGNUM.NEXTVAL, ?, ?, TO_DATE(TO_CHAR(SYSDATE)), ?, ?, TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, 1))))";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCmt_content());
			psmt.setString(2, dto.getCmt_img());
			psmt.setInt(3, dto.getC_num());
			psmt.setString(4, dto.getEmail());
			
			cnt = psmt.executeUpdate();
			 
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			dbClose();
		} 
		return cnt; 
	} 
	
	
	
	
	// 해당 게시글의 댓글 가져오기 😎  수정!!!!!!!!!!!!!! 
	public ArrayList<CommentDTO> getComment(int cNum) { 
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>(); 
		dbOpen(); 
		try {
			String sql = "SELECT * FROM TB_C_COMMENT WHERE C_NUM = ?";
			psmt = conn.prepareStatement(sql); 
	        psmt.setInt(1, cNum);
	        rs = psmt.executeQuery();
	        
	        while(rs.next()) {
	            int cmtNum = rs.getInt("CMT_NUM");
	            String content = rs.getString("CMT_CONTENT"); 
	            String img = rs.getString("CMT_IMG");
	            Date date = rs.getDate("CMT_DATE");
	            String email = rs.getString("EMAIL"); 
	            String title = rs.getString("CMT_TITLE");  
	            
	            CommentDTO comDto = new CommentDTO(cmtNum, content, img, date, cNum, email, title);
	            list.add(comDto); 
			}  
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			dbClose();
		} 
		return list; 
	}


	
}
