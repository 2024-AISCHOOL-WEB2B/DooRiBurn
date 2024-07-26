package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentLikeDAOTEST {

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
	
	
	
	
	
	
	
//	String b_idx= request.getParameter("b_idx");
//	String userid = (String)session.getAttribute("userid"); 
	
	try{ 
		if(conn != null){
			int b_like=0;
			
			String sql = "select li_idx from tb_like where li_boardidx=? and li_userid=? ";
			psmt= conn.prepareStatement(sql);
			psmt.setString(1,b_idx);
			psmt.setString(2,userid);
			rs= psmt.executeQuery();
			if(rs.next()){
				sql="update tb_board set b_like = b_like-1 where b_idx=?";
				psmt= conn.prepareStatement(sql);
				psmt.setString(1,b_idx);
				psmt.executeUpdate();	
				
				sql="delete from tb_like where li_boardidx=? and li_userid =?;";
				psmt= conn.prepareStatement(sql);
				psmt.setString(1,b_idx);
				psmt.setString(2,userid);
				psmt.executeUpdate();	
				
				
				
			}else{
				sql="update tb_board set b_like = b_like+1 where b_idx=?";
				psmt= conn.prepareStatement(sql);
				psmt.setString(1,b_idx);
				psmt.executeUpdate();
				sql="insert into tb_like(li_userid, li_boardidx) values (?,?)";
				psmt= conn.prepareStatement(sql);
				psmt.setString(1,userid);
				psmt.setString(2,b_idx);
				psmt.executeUpdate();
	
			}
			sql="select b_like from tb_board where b_idx=?";
			psmt= conn.prepareStatement(sql);
			psmt.setString(1,b_idx);
			rs= psmt.executeQuery();
			if(rs.next()){
				b_like = rs.getInt("b_like");
				out.println(b_like);
			}
			if(psmt != null) conn.close();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	
}
