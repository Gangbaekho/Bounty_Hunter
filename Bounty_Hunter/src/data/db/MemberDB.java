package data.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.MemberDTO;
import oracle.db.DBConnect;

public class MemberDB {

	private DBConnect db = new DBConnect();
	

	public boolean isSearchId(String id)//�쉶�썝媛��엯�븷�븣 id 以묐났泥댄겕
	{
		boolean find=false;//�엳�쓣寃쎌슦 true濡� 蹂�寃�
		String sql="select * from member where myid=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())//�빐�떦 �븘�씠�뵒媛� �엳�쓣寃쎌슦 ture
				find=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return find;
	}	
	
	public void insertMember(MemberDTO dto) {
		
		//泥섏쓬 留뚮뱶�뒗 �쉶�썝�� bounty媛� 0�씠怨� joinday�뒗 sysdate�씠�떎.
		String sql = "insert into member values(seq_bounty.nextval,?,?,?,?,?,?,10000,sysdate)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn=db.getConnection();
		
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

	public boolean isEqualPass(String num, String pass)
{
	boolean b=false;
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select count(*) from member where num=? and pass=?";
	
	conn=db.getConnection();
	
	try {
		pstmt=conn.prepareStatement(sql);
		//諛붿씤�뵫
		pstmt.setString(1, num);
		pstmt.setString(2, pass);
		rs=pstmt.executeQuery();
		
		if(rs.next())
		{
			if(rs.getInt(1)==1)
				b=true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(rs, pstmt, conn);
	}
	return b;
}
	public boolean isLogin(String myid, String pass) 
	{
		boolean b=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="select * from member where myid=? and pass=?";
		ResultSet rs=null;
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, myid);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
		if(rs.next())
		{
			b=true;
		}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return b;
	}
	
	//�븯�굹�쓽 硫ㅻ쾭�쓽 �젙蹂대�� num�쓣 �넻�빐�꽌 �씫�뼱�삤�뒗 硫붿냼�뱶
	public MemberDTO getMember(int num) {
		
		MemberDTO dto = new MemberDTO();
		
		String sql = "select * from member where num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = db.getConnection();
		
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
	
	//MemberDTO瑜� 諛쏆븘�꽌 update�븯�뒗 硫붿냼�뱶
	public void updateMember(MemberDTO dto) {
		
		String sql = "update member set name=?,pass=?,email1=?,email2=?,mobile=?,bounty=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn=db.getConnection();
		
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
	
	public void deleteAllMember() {
		
		String sql = "delete from member";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn=db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//id에 해당하는 이름 반환
	public String getName(String id) 
	{
		String name="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="select name from member where myid=?";
		ResultSet rs=null;
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				name=rs.getString("name");
			}
			
		
		    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    }finally {
			db.dbClose(rs, pstmt, conn);
	     	}
		return name;
	}
	
	public int getNumByMyid(String myid) {
		
		int mnum = 0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="select num from member where myid=?";
		ResultSet rs=null;
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, myid);
			
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				mnum=rs.getInt("num");
			}
			
		
		    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    }finally {
			db.dbClose(rs, pstmt, conn);
	     	}
		return mnum;
		
	}
	
	public int getMnumByBnum(int bnum) {
		
		int mnum = 0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="select mnum from board where num = ?";
		ResultSet rs=null;
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				mnum=rs.getInt("mnum");
			}
			
		
		    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    }finally {
			db.dbClose(rs, pstmt, conn);
	     	}
		
		return mnum;
		
	}

	public int getMnumByRnum(int rnum) {
		
		int mnum = 0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="select mnum from reply where num = ?";
		ResultSet rs=null;
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rnum);
			
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				mnum=rs.getInt("mnum");
			}
			
		
		    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    }finally {
			db.dbClose(rs, pstmt, conn);
	     	}
		
		return mnum;
		
	}
	
	public void giveBountyToMnum(int mnum, int bounty) {
		
		String sql = "update member set bounty = bounty+? where num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn=db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bounty/2);
			pstmt.setInt(2, mnum);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}

	
}
