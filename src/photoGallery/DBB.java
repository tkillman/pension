 package photoGallery;
 
 import java.sql.*;

 import javax.sql.*; 
import javax.naming.*;
 
 public class DBB {
    
 	private static DBB instance = new DBB();
    
    public static DBB getInstance() {
        return instance;
    }
    
    private DBB() {
    }
    
    private Connection getConnection() throws Exception {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
		String username = "dd";
		String pw = "1234";
		
		
		Connection connection =   DriverManager.getConnection(jdbcUrl, username, pw);
		
		
		
		return connection;
    }
 
  // ����
    public void insertMember(DB member) 
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
       
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("insert into gboard values (?,?,?,?,?,?,?,sysdate)");
            pstmt.setString(1, member.getName());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getEmail());
            pstmt.setString(4, member.getHomepage());
            pstmt.setString(5, member.getTitle());
            pstmt.setString(6, member.getContent());
            pstmt.setString(7, member.getUploadfile());
            pstmt.executeUpdate();
          
            
        } catch(SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    // ����
    // ����
    public int deleteMember(String a,String b){
    	int i=1;
    	return i;
    }
}
