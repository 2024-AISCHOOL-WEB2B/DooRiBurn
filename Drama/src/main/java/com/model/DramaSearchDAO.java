package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DramaSearchDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private void getConnection() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String Userid = "Insa5_SpringB_hacksim_1";
			String Userpw = "aishcool1";
			String url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			
			conn = DriverManager.getConnection(url, Userid, Userpw);
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 연결 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("db연결 실패");
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
	
public ArrayList<DramaSearchDTO> film_detail(String index) {
		
		ArrayList<DramaSearchDTO> detail_list = new ArrayList<DramaSearchDTO>();
		
		try {
			getConnection();

			String sql = "SELECT * FROM TB_FILM_LOCATION WHERE F_NUM = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1,index);

			rs = psmt.executeQuery();

			while(rs.next()) {
				double f_num = rs.getDouble("F_NUM");
				String drama =  rs.getString("DRAMA");
				String f_addr = rs.getString("F_ADDR");
				double lat = rs.getDouble("LAT");
				double lon = rs.getDouble("LON");
				String f_name = rs.getString("F_NAME");
				String f_tel = rs.getString("F_TEL");
				String f_time = rs.getString("F_TIME");
				String scene = rs.getString("SCENE");

				DramaSearchDTO dto = new DramaSearchDTO(f_num,drama, f_addr, lat, lon, f_name, f_tel, f_time, scene);
				
				detail_list.add(dto);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("권한 확인 실패");

		} finally {
			close();
		}
		return detail_list;
	}
	
}
