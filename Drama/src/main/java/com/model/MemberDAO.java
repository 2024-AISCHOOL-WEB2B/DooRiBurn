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
   
   public int join(MemberDTO dto) {
      
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

   public int checkEmail(String email) {
      int cnt = 0;
      
      getConnection();
      
      try {
         String sql = "SELECT * FROM TB_MEMBER WHERE EMAIL = ?";
         
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, email);
         
         rs = psmt.executeQuery();
         
         
         if(rs.next() || email.equals("")) {
            System.out.println("맞음");
            cnt = 0;
         }else {
            System.out.println("틀림");
            cnt = 1;
         }
            
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close();
      }
      
      return cnt;
   }

   public MemberDTO login(MemberDTO dto) {

      MemberDTO info = null ;
      
      getConnection();
      
      
      try {
         String sql = "SELECT * FROM TB_MEMBER WHERE EMAIL = ?";
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, dto.getEmail());
         
         rs = psmt.executeQuery();
         
         if(rs.next()) {
            String email = rs.getString("EMAIL");
            String pw = rs.getString("PW");
            String name = rs.getString("NAME");
            String phone = rs.getString("PHONE");
            String addr = rs.getString("ADDR");
            String nick = rs.getString("NICK");
            
            info = new MemberDTO(email, pw, nick, name, phone, addr);
         }
         
      } catch (SQLException e) {
         System.out.println("오라클 오류");
         e.printStackTrace();
      }finally {
         close();
      }
      
      return info;
   }
   
   public String findNickByEmail(String email) { 
	    String nick = null;
	    getConnection();
	    try {
	        String sql = "SELECT NICK FROM TB_MEMBER WHERE EMAIL = ?";
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, email);
	        rs = psmt.executeQuery();

	        if (rs.next()) { 
	            nick = rs.getString("NICK");	            
	        } 
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return nick; 
	}

 
   
}
