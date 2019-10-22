package data.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.ReplyDTO;
import oracle.db.DBConnect;

public class ReplyDB {

	private DBConnect db = new DBConnect();
	
	//댓글 추가.
	public void insertReply(ReplyDTO dto) {
		
		//처음 댓글을 등록하면 bounty는 0이다.
		String sql = "insert into reply values(seq_bounty.nextval,?,?,?,0,sysdate,sysdate)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn=db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getMnum());
			pstmt.setInt(2, dto.getBnum());
			pstmt.setString(3, dto.getContent());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//num을 통해 reply를 찾는 메소드
	public ReplyDTO getReply(int num) {
		
		ReplyDTO dto = new ReplyDTO();
		
		String sql = "select * from reply where num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setBnum(rs.getInt("bnum"));
				dto.setBounty(rs.getInt("bounty"));
				dto.setContent(rs.getString("content"));
				dto.setCreateday(rs.getTimestamp("createday"));
				dto.setMnum(rs.getInt("mnum"));
				dto.setModday(rs.getTimestamp("modday"));
				dto.setNum(rs.getInt("num"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return dto;
		
	}
	
	//댓글 업데이트
	public void updateReply(ReplyDTO dto) {
		
		String sql = "update reply set content=?,bounty=?,modday=sysdate";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn=db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getBounty());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//댓글 삭제
	public void deleteReply(int num) {
		
		String sql = "delete from reply where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn=db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
		
	
}
