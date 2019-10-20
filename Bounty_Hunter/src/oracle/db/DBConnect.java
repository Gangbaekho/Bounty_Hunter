package oracle.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {

	

	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="angel2";
	String pass="a1234";
	
	String t_url="jdbc:oracle:thin:@192.168.0.86:1521:xe";
	String t_user="angel2";
	String t_pass="a1234";
	

	public DBConnect() {
		
		try {
			Class.forName(driver);
			System.out.println("성공했다");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		//db server에 연결 시도
		Connection conn = null;
		try {
		conn=DriverManager.getConnection(url, user, pass);
		//System.out.println("오라클 연결 성공");
		}
		catch(SQLException e) {
			System.out.println("오라클 연결 실패" + e.getMessage());
		}
		return conn;
	}
	
	public Connection getGangsaConnection() {
		//db server에 연결 시도
		Connection conn = null;
		try {
		conn=DriverManager.getConnection(t_url, t_user, t_pass);
		//System.out.println("오라클 연결 성공");
		}
		catch(SQLException e) {
			System.out.println("오라클 연결 실패" + e.getMessage());
		}
		return conn;
	}
	
	public void dbClose(PreparedStatement pstmt, Connection conn) {
		
		try {
			pstmt.close();
			conn.close();
		}catch(SQLException e) {
			
		}
		
	}
	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		
		try {
			rs.close();
			pstmt.close();
			conn.close();
		}catch(SQLException e) {
			
		}
		
	}
	
	public void dbClose(Statement stmt, Connection conn) {
		
		try {
			stmt.close();
			conn.close();
		}catch(SQLException e) {
			
		}
		
	}
	public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
		
		try {
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException e) {
			
		}
		
	}
	
}

