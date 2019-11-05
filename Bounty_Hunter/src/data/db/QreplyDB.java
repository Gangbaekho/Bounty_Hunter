package data.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.QreplyDTO;
import data.dto.QreplyDTO;
import oracle.db.DBConnect;

public class QreplyDB {
	
	private DBConnect db = new DBConnect();
	
	//질문에 대한 모든 답변 가져오기
	public List<QreplyDTO> getAllQreply(){
		List<QreplyDTO> list = new Vector<>();
		String sql = "select * from qreply";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QreplyDTO dto = new QreplyDTO();
				dto.setNum(rs.getInt("num"));
				dto.setMnum(rs.getInt("mnum"));
				dto.setMnum(rs.getInt("qnum"));
				dto.setChecked(rs.getString("checked"));
				dto.setContent(rs.getString("content"));
				dto.setCreateday(rs.getTimestamp("createday"));
				dto.setModday(rs.getTimestamp("modday"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//답변 insert
	public void insertQreply(QreplyDTO dto) {
		String sql = "insert into qreply values (seq_bounty.nextval, ?, ?, 'n', ?, sysdate, sysdate)";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getMnum());
			pstmt.setInt(2, dto.getQnum());
			pstmt.setString(3, dto.getContent());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//답변 수정 (update)
	public void updateQreply(QreplyDTO dto) {
		String sql = "update qreply set content=?, modday=sysdate where num=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNum());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//답변 삭제 (delete)
	public void deleteQreply(int num) {
		String sql = "delete from qreply where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setInt(1, num);
			// 실행
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//답변 채택시 checked column 'y'로 변경
	public void qreplyIsChecked(int num) {
		String sql = "update qreply set checked='y' where num=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public List<QreplyDTO> getQreplyListByQnum(int qnum){
		
		List<QreplyDTO> list = new Vector<>();
		String sql = "select * from qreply where qnum = ? order by num desc";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QreplyDTO dto = new QreplyDTO();
				dto.setNum(rs.getInt("num"));
				dto.setMnum(rs.getInt("mnum"));
				dto.setQnum(rs.getInt("qnum"));
				dto.setChecked(rs.getString("checked"));
				dto.setContent(rs.getString("content"));
				dto.setCreateday(rs.getTimestamp("createday"));
				dto.setModday(rs.getTimestamp("modday"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
}
