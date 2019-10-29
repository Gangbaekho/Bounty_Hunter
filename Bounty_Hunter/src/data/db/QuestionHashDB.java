package data.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.QuestionDTO;
import data.dto.QuestionHashDTO;
import oracle.db.DBConnect;

public class QuestionHashDB {
	private DBConnect db = new DBConnect();
	
	//해당 질문의 전체 # 가져오기
	public List<QuestionHashDTO> getQuestionHash(int qnum){
		List<QuestionHashDTO> list = new Vector<>();
		String sql = "select * from questionhash where qnum=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QuestionHashDTO dto = new QuestionHashDTO();
				dto.setQnum(rs.getInt("qnum"));
				dto.setHash(rs.getString("hash"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//# 입력
	public void insertQuestionHash(int qnum, String hash) {
		String sql = "insert into questionhash values (?, ?)";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnum);
			pstmt.setString(2, hash);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//# 삭제
	public void deleteQuestionHash(int qnum, String hash) {
		String sql = "delete from questionhash where qnum=? and hash=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnum);
			pstmt.setString(2, hash);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//# 업데이트 (아마 필요는 없을 듯)
	public void updateQuestionHash(int qnum, String hash) {
		String sql = "update questionhash set hash=? where qnum=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hash);
			pstmt.setInt(2, qnum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
