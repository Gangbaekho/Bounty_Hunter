package data.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.MemberDTO;
import oracle.db.DBConnect;

public class MemberDB {

	private DBConnect db = new DBConnect();
	
	//새로운 회원을 추가하는 메소드
	public void insertMember(MemberDTO dto) {
		
		//처음 만드는 회원은 bounty가 0이고 joinday는 sysdate이다.
		String sql = "insert into member values(seq_bounty.nextval,?,?,?,?,?,?,0,sysdate)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getMyid());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getEmail1());
			pstmt.setString(5, dto.getEmail2());
			pstmt.setString(6, dto.getMobile());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//하나의 멤버의 정보를 num을 통해서 읽어오는 메소드
	public MemberDTO getMember(int num) {
		
		MemberDTO dto = new MemberDTO();
		
		String sql = "select * from member where num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setBounty(rs.getInt("bounty"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setMobile(rs.getString("mobile"));
				dto.setMyid(rs.getString("myid"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				dto.setPass(rs.getString("pass"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
		
	}
	
	//MemberDTO를 받아서 update하는 메소드
	public void updateMember(MemberDTO dto) {
		
		String sql = "update member set name=?,pass=?,email1=?,email2=?,mobile=?,bounty=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getEmail1());
			pstmt.setString(4, dto.getEmail2());
			pstmt.setString(5, dto.getMobile());
			pstmt.setInt(6, dto.getBounty());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public void deleteMember(int num) {
		
		String sql = "delete from member where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
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
