package oracle.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hunter";
	String pwd = "a1234";
	
	String t_url = "jdbc:oracle:thin:@192.168.0.86:1521:xe";
	String t_user = "hunter";
	String t_pwd = "a1234";
	
	public DBConnect() {
		try {
			Class.forName(driver);
			System.out.println("오라클 드라이버 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("오라클 드라이버 실패: "+e.getMessage());
		}
	}
	
	//db에서 나오는건 전부 java.sql에서 import
	public Connection getConnection() {
		//db 서버에 연결 시도 
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pwd);
			//System.out.println("오라클 연결 성공");
		} catch (SQLException e) {
			System.out.println("오라클 연결 실패: "+e.getMessage());
		}
		return conn;
	}
		
	public Connection getTeacherConnection() {
		//db 서버에 연결 시도 
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(t_url, t_user, t_pwd);
			//System.out.println("오라클 연결 성공");
		} catch (SQLException e) {
			System.out.println("오라클 연결 실패: "+e.getMessage());
		}
		return conn;
	}
	
	//오버로딩으로 총 4개의 close 메소드 
	public void dbClose(PreparedStatement pstmt, Connection conn) {
		try {
			pstmt.close();
			conn.close();
		} catch(SQLException e) {
			
		}
	}
	
	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch(SQLException e) {
			
		}
	}
	
	public void dbClose(Statement stmt, Connection conn) {
		try {
			stmt.close();
			conn.close();
		} catch(SQLException e) {
			
		}
	}
	
	public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch(SQLException e) {
			
		}
	}
}