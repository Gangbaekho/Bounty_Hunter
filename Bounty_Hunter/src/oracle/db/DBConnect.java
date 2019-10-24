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
			System.out.println("로그인성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("�삤�씪�겢 �뱶�씪�씠踰� �떎�뙣: "+e.getMessage());
		}
	}
	
	//db�뿉�꽌 �굹�삤�뒗嫄� �쟾遺� java.sql�뿉�꽌 import
	public Connection getConnection() {
		//db �꽌踰꾩뿉 �뿰寃� �떆�룄 
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pwd);
			//System.out.println("�삤�씪�겢 �뿰寃� �꽦怨�");
		} catch (SQLException e) {
			System.out.println("getConnection 에러: "+e.getMessage());
		}
		return conn;
	}
		
	public Connection getTeacherConnection() {
		//db �꽌踰꾩뿉 �뿰寃� �떆�룄 
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(t_url, t_user, t_pwd);
			//System.out.println("�삤�씪�겢 �뿰寃� �꽦怨�");
		} catch (SQLException e) {
			System.out.println("�삤�씪�겢 �뿰寃� �떎�뙣: "+e.getMessage());
		}
		return conn;
	}
	
	//�삤踰꾨줈�뵫�쑝濡� 珥� 4媛쒖쓽 close 硫붿냼�뱶 
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