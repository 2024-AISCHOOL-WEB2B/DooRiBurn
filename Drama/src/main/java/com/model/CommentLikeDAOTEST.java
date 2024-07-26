package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CommentLikeDAOTEST {

	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	 
//	String b_idx= request.getParameter("b_idx");
//	String userid = (String)session.getAttribute("userid"); 
	
	try{
		conn = Dbconn.getConnection();
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
