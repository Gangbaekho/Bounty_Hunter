package data.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.MemberHashDTO;
import oracle.db.DBConnect;

public class MemberHashDB {
	private DBConnect db = new DBConnect();
	
	//해당 회원의 전체 # 가져오기
	public List<MemberHashDTO> getMemberHash(int mnum){
		List<MemberHashDTO> list = new Vector<>();
		String sql = "select * from memberhash where mnum=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberHashDTO dto = new MemberHashDTO();
				dto.setMnum(rs.getInt("mnum"));
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
	public void insertMemberHash(int mnum, String hash) {
		String sql = "insert into memberhash values (?, ?)";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
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
	public void deleteMemberHash(int mnum, String hash) {
		String sql = "delete from memberhash where mnum=? and hash=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
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
	public void updateMemberHash(int mnum, String hash) {
		String sql = "update memberhash set hash=? where mnum=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hash);
			pstmt.setInt(2, mnum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
}












