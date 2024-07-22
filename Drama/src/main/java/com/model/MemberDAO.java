package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private void getConnection() {
		
		
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String id = "Insa5_SpringB_hacksim_1";
			String pw = "aishcool1";
			String url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			
			conn = DriverManager.getConnection(url, id, pw);
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 찾기 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("연결실패");
			e.printStackTrace();
		}
	}
		
	private void close() {
			
			try {
		         if(rs != null)
		            rs.close();
		         if(psmt != null)
		            psmt.close();
		         if(conn != null)
		            conn.close();
			      } catch (SQLException e) {
			         e.printStackTrace();
			      }
				
			}
	
	public int Join(MemberDTO dto) {
		
		int cnt = 0;
		
		getConnection();
		
		
		try {
			
			String sql = "INSERT INTO TB_MEMBER VALUES(?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getPhone());
			psmt.setString(5, dto.getAddr());
			psmt.setString(6, dto.getNick());
			
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("연결 실패");
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		
		return cnt;
	}

}
