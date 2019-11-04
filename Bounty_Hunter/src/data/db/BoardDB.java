package data.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.BoardDTO;
import oracle.db.DBConnect;

public class BoardDB {
	private DBConnect db = new DBConnect();
	
	//mnum에 해당하는 회원이 작성한 전체 Board 가져오기
	public List<BoardDTO> getAllBoard(int mnum) {
		List<BoardDTO> list = new Vector<>();
		String sql = "select * from board where mnum=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setMnum(rs.getInt("mnum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setBounty(rs.getInt("bounty"));
				dto.setCreateday(rs.getTimestamp("createday"));
				dto.setModday(rs.getTimestamp("modday"));
				dto.setImage(rs.getString("image"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//선택 한 num에 해당하는 하나의 글 가져오기 
	public BoardDTO getBoard(int num) {
		BoardDTO dto = new BoardDTO();
		String sql = "select * from board where num=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setMnum(rs.getInt("mnum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setBounty(rs.getInt("bounty"));
				dto.setCreateday(rs.getTimestamp("createday"));
				dto.setModday(rs.getTimestamp("modday"));
				dto.setImage(rs.getString("image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//Board에 새 글 작성 method
	public void insertBoard(int mnum, BoardDTO dto) {
		String sql = "insert into board values (seq_bounty.nextval, ?, ?, ?, 0, 0, sysdate, sysdate,?)";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4,dto.getImage());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//Board 글 수정 method
	public void updateBoard(BoardDTO dto) {
		String sql = "update board set title=?, content=?, modday=sysdate where num=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//Board 글 삭제 method
	public void deleteBoard(int num) {
		String sql = "delete from board where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getConnection();
		try {
		    pstmt=conn.prepareStatement(sql);
		    //바인딩
		    pstmt.setInt(1, num);
			//실행
		    pstmt.execute();
		} catch (SQLException e) {
		    e.printStackTrace();
		}finally {
		    db.dbClose(pstmt, conn);
		}
	}
	
	public void increaseBounty(int bnum) {
		
		String sql = "update board set bounty=bounty+100 where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getConnection();
		try {
		    pstmt=conn.prepareStatement(sql);
		    //바인딩
		    pstmt.setInt(1, bnum);
			//실행
		    pstmt.execute();
		} catch (SQLException e) {
		    e.printStackTrace();
		}finally {
		    db.dbClose(pstmt, conn);
		}
		
	}
	
	public void increaseCount(int bnum) {
		
		String sql = "update board set count=count+1 where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getConnection();
		try {
		    pstmt=conn.prepareStatement(sql);
		    //바인딩
		    pstmt.setInt(1, bnum);
			//실행
		    pstmt.execute();
		} catch (SQLException e) {
		    e.printStackTrace();
		}finally {
		    db.dbClose(pstmt, conn);
		}
		
	}
	
	//debate 생성 시 bounty 차감 
	public void decreaseBounty(int mnum) {
		String sql = "update member set bounty=bounty-500 where num=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
