package dooriburn.com.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		int n_index = Integer.parseInt(index);
		try {
			getConnection();

			String sql = "SELECT * FROM TB_FILM_LOCATION WHERE F_NUM = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1,n_index);

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
				String f_img = rs.getString("F_IMG");
	
				DramaSearchDTO dto = new DramaSearchDTO(f_num, drama, f_addr, lat, lon, f_name, f_tel, f_time, scene, f_img);
				
				detail_list.add(dto);
				System.out.println(detail_list.get(0).getDrama()); 
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("권한 확인 실패");

		} finally {
			close();
		}
		return detail_list;
	}
	




	// 찜 목록 조회
	public List<DramaSearchDTO> getLikes(String email) {
		List<DramaSearchDTO> likes = new ArrayList<>();
		getConnection();
	
		try { 
			
	        String sql = "SELECT DISTINCT li.F_LIKE_NUM, li.F_NUM, li.F_LIKE_DATE, l.DRAMA, l.F_NAME " +
                    "FROM TB_FILM_LOCATION l " +
                    "JOIN TB_FILM_LIKE li ON l.F_NUM = li.F_NUM " +
                    "WHERE li.EMAIL = ?";
	        
	        
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
	
			rs = psmt.executeQuery();
	
			while (rs.next()) {
				Double f_num = rs.getDouble("F_NUM");
				String drama = rs.getString("DRAMA");
				String f_name = rs.getString("F_NAME");
			
	
				DramaSearchDTO like = new DramaSearchDTO(f_num, drama, null, null, null, f_name, null, null, null, null);
				likes.add(like);
			}
	
		} catch (SQLException e) {
			System.out.println("찜 목록 조회 오류: " + e.getMessage());
		} finally {
			close();
		}
		return likes;
	}
	
	
// 페이지네이션
	public int getTotalCount(String s_option, String search) {
	    int totalCount = 0;
	    getConnection();
	    try {
	        String sql = "SELECT COUNT(*) FROM TB_FILM_LOCATION WHERE 1=1";
	        if (s_option != null && !s_option.isEmpty()) {
	            if (s_option.equals("0")) {
	                sql += " AND DRAMA LIKE ?";
	            } else if (s_option.equals("1")) {
	                sql += " AND F_NAME LIKE ?";
	            }
	        }
	        psmt = conn.prepareStatement(sql);
	        if (s_option != null && !s_option.isEmpty()) {
	            psmt.setString(1, "%" + search + "%");
	        }
	        rs = psmt.executeQuery();
	        if (rs.next()) {
	            totalCount = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return totalCount;
	}

	
	// 페이지네이션을 적용한 검색 결과를 가져오는 메서드
	public List<DramaSearchDTO> getSearchResults(String s_option, String search, int pageNumber, int pageSize) {
	    List<DramaSearchDTO> results = new ArrayList<>();
	    int startRow = (pageNumber - 1) * pageSize + 1;
	    int endRow = pageNumber * pageSize;
	    
	    try {
	        getConnection();
	        String sql = "SELECT * FROM ( " +
	                     "  SELECT a.*, ROWNUM rnum FROM ( " +
	                     "    SELECT * FROM TB_FILM_LOCATION WHERE 1=1";
	        if (s_option != null && !s_option.isEmpty()) {
	            if (s_option.equals("0")) {
	                sql += " AND DRAMA LIKE ?";
	            } else if (s_option.equals("1")) {
	                sql += " AND F_NAME LIKE ?";
	            }
	        }
	        sql += "    ORDER BY F_NUM ASC " +
	               "  ) a WHERE ROWNUM <= ? " +
	               ") WHERE rnum >= ?";
	        
	        psmt = conn.prepareStatement(sql);
	        int paramIndex = 1;
	        if (s_option != null && !s_option.isEmpty()) {
	            psmt.setString(paramIndex++, "%" + search + "%");
	        }
	        psmt.setInt(paramIndex++, endRow);
	        psmt.setInt(paramIndex, startRow);
	        rs = psmt.executeQuery();
	        while (rs.next()) {
	            DramaSearchDTO dto = new DramaSearchDTO(
	                rs.getDouble("F_NUM"),  // int로 변경
	                rs.getString("DRAMA"),
	                rs.getString("F_ADDR"),
	                rs.getDouble("LAT"),
	                rs.getDouble("LON"),
	                rs.getString("F_NAME"),
	                rs.getString("F_TEL"),
	                rs.getString("F_TIME"),
	                rs.getString("SCENE"),
	                rs.getString("F_IMG")
	            );
	            results.add(dto);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return results;
	}

}
 
