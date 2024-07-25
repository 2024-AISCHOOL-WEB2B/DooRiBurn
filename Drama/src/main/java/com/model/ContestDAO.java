package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ContestDAO {

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


	// 공모전 게시글 업로드
	public int contestPost(ContestDTO dto) {
		System.out.println(dto.getC_title());
		System.out.println(dto.getC_img());
		System.out.println(dto.getC_content());

		int cnt = 0; 
		dbOpen(); 
		try { 
			String sql = "INSERT INTO TB_CONTEST (c_title, c_create_date, c_img, c_content, c_delete_date) VALUES (?, TO_DATE(TO_CHAR(SYSDATE)), ?, ?, TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, 1))))"; 
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
	 
	// 공모전 게시글 수정  (연결x, 글보는 화면 구성 후 연결 예정)
	// 보고 있는 글 -> C_NUM 가져와서 수정 
	public int contestUpdate(ContestDTO dto) {
		int cnt = 0;
		dbOpen();

		String sql = "UPDATE TB_CONTEST SET C_TITLE = ?, C_IMG = ?, C_CONTENT = ? WHERE C_NUM = ?";
		try {
			psmt = conn.prepareStatement(sql); 
			psmt.setString(1, dto.getC_title());
			psmt.setString(2, dto.getC_img());
			psmt.setString(3, dto.getC_content()); 
			psmt.setInt(4, dto.getC_num()); 
			cnt = psmt.executeUpdate(); 
			
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
		
	}
	
	
	// 공모전 게시글 개별 삭제 
	public int contestDelete(int num) { 
		
		int cnt = 0;
		dbOpen();
		 
		try {
			String sql = "DELETE FROM TB_CONTEST WHERE C_NUM = ?";
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
	 
	
	
	// 공모전 게시판 페이징 위한 List 생성
	public ArrayList<ContestDTO> getBoardList(int startRow, int pageSize){
		ArrayList<ContestDTO> boardList = new ArrayList<>();
	    
		dbOpen();
		try { 
			// 글 re_ref 최신글 위쪽(내림차순), re_seq (오름차순)
			// DB 데이터를 원하는만큼씩 잘라내기 : 
	        String sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, C_NUM, C_TITLE, C_CREATE_DATE, C_IMG, C_CONTENT, C_DELETE_DATE " +
                    "FROM (SELECT * FROM TB_CONTEST ORDER BY C_NUM DESC)) " +
                    "WHERE RNUM BETWEEN ? AND ?";
	        
			psmt = conn.prepareStatement(sql); 
			psmt.setInt(1, startRow); //시작행 (시작 row 인덱스 번호)
			psmt.setInt(2, startRow + pageSize - 1); // 끝행
				
			// 4. sql 실행
			rs = psmt.executeQuery();
			// 5. 데이터처리 ( 글1개의 정보 -> DTO 1개에 담음 -> ArrayList 1칸 )
			while(rs.next()) {
			// 데이터가 있을때마다 글 1개의 정보를 저장하는 객체 생성
				ContestDTO dto = new ContestDTO();
					
				dto.setC_num(rs.getInt("C_NUM")); 
				dto.setC_title(rs.getString("C_TITLE")); 
				dto.setC_create_date(rs.getDate("C_CREATE_DATE")); 
				dto.setC_img(rs.getString("C_IMG")); 
				dto.setC_content(rs.getString("C_CONTENT")); 
				dto.setC_delete_date(rs.getDate("C_DELETE_DATE")); 
					   
				boardList.add(dto);				
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}		
		return boardList;
	}
	
	// 글 보기 
	public ContestDTO getView(int num) {
		dbOpen();
		try { 
			String sql = "SELECT * FROM TB_CONTEST WHERE C_NUM = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				ContestDTO dto = new ContestDTO();
				dto.setC_num(rs.getInt("C_NUM")); 
				dto.setC_title(rs.getString("C_TITLE")); 
				dto.setC_create_date(rs.getDate("C_CREATE_DATE")); 
				dto.setC_img(rs.getString("C_IMG")); 
				dto.setC_content(rs.getString("C_CONTENT")); 
				dto.setC_delete_date(rs.getDate("C_DELETE_DATE")); 
				return dto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return null;
		 
	}
	
	
	
	
	// 게시판 글 개수 카운트
	public int getCount() {
		int cnt = 0; 
		dbOpen(); 
		try { 
			String sql = "SELECT COUNT(*) FROM TB_CONTEST";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}
	
	 

	// 공모전 글 가져오기 !!!😎😎 필수
	public ArrayList<ContestDTO> getContests(ContestDTO dto) { 
		ArrayList<ContestDTO> list = new ArrayList<ContestDTO>();
		ContestDTO dtoTest = null;
		dbOpen(); 
		try {
			String sql = "SELECT * FROM TB_CONTEST";
			psmt = conn.prepareStatement(sql); 
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("C_NUM");
				String title = rs.getString("C_TITLE");
				Date cDate = rs.getDate("C_CREATE_DATE");
				String img = rs.getString("C_IMG");
				String content = rs.getString("C_CONTENT"); 
				Date dDate = rs.getDate("C_DELETE_DATE"); 
				
				dtoTest = new ContestDTO(num, title, cDate, img, content, dDate);
				list.add(dtoTest); 
			}  
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			dbClose();
		} 
		return list; 
	}
	
}