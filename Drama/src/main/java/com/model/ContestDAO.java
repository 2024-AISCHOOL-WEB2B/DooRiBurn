package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	 
	
	
	// 공모전 게시판 페이징 위한 List 생성
	public List getBoardList(int startRow, int pageSize){
		List boardList = new ArrayList();
	    
		dbOpen();
		try { 
			// 글 re_ref 최신글 위쪽(내림차순), re_seq (오름차순)
			// DB 데이터를 원하는만큼씩 잘라내기 : limit 시작행-1, 페이지크기 
			String sql = "SELECT * FROM TB_CONTEST ORDER BY C_NUM DESC, C_TITLE ASC limit ?,?";
			psmt = conn.prepareStatement(sql);
				
			// ?
			psmt.setInt(1, startRow-1); //시작행-1 (시작 row 인덱스 번호)
			psmt.setInt(2, pageSize); // 페이지크기 (한번에 출력되는 수)
				
			// 4. sql 실행
			rs = psmt.executeQuery();
			// 5. 데이터처리 ( 글1개의 정보 -> DTO 1개에 담음 -> ArrayList 1칸 )
			while(rs.next()) {
			// 데이터가 있을때마다 글 1개의 정보를 저장하는 객체 생성
				ContestDTO dto = new ContestDTO();
					
				dto.setC_num(rs.getInt("C_NUM")); 
				dto.setC_title(rs.getString("C_TITLE")); 
				dto.setC_date(rs.getString("C_DATE")); 
				dto.setC_img(rs.getString("C_IMG")); 
				dto.setC_content(rs.getString("C_CONTENT")); 
					  
				// DTO 객체를 ArrayList 한칸에 저장
				boardList.add(dto);				
			}
			System.out.println("DAO : 글 정보 저장완료 "+boardList.size());
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}		
		return boardList;
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
				cnt = rs.getInt(0); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}
	
	 

	// 공모전 글 가져오기 !!!!!!!!😎😎 필수!!!!!!!!!    //////////////////////	 
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
				String date = rs.getString("C_DATE");
				String img = rs.getString("C_DATE");
				String content = rs.getString("C_CONTENT"); 
				
				dto = new ContestDTO(num, title, date, img, content);
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
