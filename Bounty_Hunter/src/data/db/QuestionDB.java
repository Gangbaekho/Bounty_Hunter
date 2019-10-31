package data.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.BoardDTO;
import data.dto.QuestionByHashDTO;
import data.dto.QuestionDTO;
import oracle.db.DBConnect;

public class QuestionDB {
	private DBConnect db = new DBConnect();

	// 모든 question 가져오기
	public List<QuestionDTO> getAllQuestion() {
		List<QuestionDTO> list = new Vector<>();
		String sql = "select * from question";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setNum(rs.getInt("num"));
				dto.setMnum(rs.getInt("mnum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setChecked(rs.getString("checked"));
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

	// 해당 num에 해당하는 question 가져오기
	public QuestionDTO getQuestion(int num) {
		QuestionDTO dto = new QuestionDTO();
		String sql = "select * from question where num=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setMnum(rs.getInt("mnum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setChecked(rs.getString("checked"));
				dto.setCreateday(rs.getTimestamp("createday"));
				dto.setModday(rs.getTimestamp("modday"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}

	// 새로운 질문 insert
	public void insertQuestion(QuestionDTO dto) {
		String sql = "insert into question values (seq_bounty.nextval, ?, ?, ?, 'n', sysdate, sysdate)";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getMnum());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// 질문 수정
	public void updateQuestion(QuestionDTO dto) {
		String sql = "update question set title=?, content=?, modday=sysdate where num=?";
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

	// 질문 삭제
	public void deleteQuestion(int num) {
		String sql = "delete from question where num=?";
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

	// 해당 해시태그의 검색결과 출력 메소드
	public List<QuestionDTO> searchByQhash(String hash) {
		String sql = "select q.num, q.title, q.checked, q.modday" + " from question q, questionhash qh"
				+ " where q.num = qh.qnum and qh.hash=?" + " order by q.num desc";
		List<QuestionDTO> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hash);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setChecked(rs.getString("checked"));
				dto.setModday(rs.getTimestamp("modday"));
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

	public List<QuestionByHashDTO> getQuestionListByHash(String hash){
		
		List<QuestionByHashDTO> list = new ArrayList<QuestionByHashDTO>();
		
		String sql ="select q.title, q.checked, q.modday, m.name, m.myid, q.num from questionhash h, question q, member m "+
		"where h.hash=? and h.qnum=q.num and q.mnum=m.num";
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hash);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QuestionByHashDTO dto = new QuestionByHashDTO();
				dto.setTitle(rs.getString(1));
				dto.setChecked(rs.getString(2));
				dto.setModday(rs.getTimestamp(3));
				dto.setName(rs.getString(4));
				dto.setMyid(rs.getString(5));
				dto.setQnum(rs.getInt(6));
			
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
}
