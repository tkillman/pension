package common;

import java.sql.*;
import javax.sql.*; 
import javax.naming.*;

public class LoginDBbean {
   
   private static LoginDBbean instance = new LoginDBbean();
   
   public static LoginDBbean getInstance() {// static  한 번만 인스턴스 생성(공유)
       return instance;
   }
   
   private LoginDBbean() {}
   
   private Connection getConnection() throws Exception { //컨넥션 풀 객체 사용
	   Class.forName("oracle.jdbc.driver.OracleDriver");
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
		String username = "dd";
		String pw = "1234";
		
		
		Connection connection =   DriverManager.getConnection(jdbcUrl, username, pw);
		
		
		
		return connection;
   }

   // id와 passwd를 받아 db에 동일한 id와 passwd가 있는
   // 파악하고 1,0,-1을 리턴
	public int userCheck(String id, String passwd) throws Exception {
		Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs= null;
        String dbpasswd="";
		int x=-1;
       
		try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement("select passwd from MEMBER where mno=0 and id=?");
           pstmt.setString(1, id);
           rs= pstmt.executeQuery();

			if(rs.next()){
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd))
					x= 1; //인증 성공
				else
					x= 0; //비밀번호 틀림
			}else
				x= -1;//해당 아이디 없음
			
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
		return x;
	}

}