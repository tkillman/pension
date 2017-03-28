package clientmember;

import java.sql.*;
import javax.sql.*;
import java.util.*;
import javax.naming.*;

public class LogonDBBean{
	private static LogonDBBean instance = new LogonDBBean(); //������ü

	public static LogonDBBean getInstance(){
		return instance;
	}

	private LogonDBBean(){} //������

	// Ŀ�ؼ�Ǯ �̿� 
	private static Connection getConnection() throws Exception{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
		String username = "dd";
		String pw = "1234";
		
		
		Connection connection =   DriverManager.getConnection(jdbcUrl, username, pw);
		
		
		
		return connection;
	}

	// ȸ������-DB �Է�
	public void insertMember(LogonDataBean member) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = getConnection();

			pstmt = conn.prepareStatement("insert into MEMBER values(member_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1,member.getId());
			pstmt.setString(2,member.getPasswd());
			pstmt.setString(3,member.getName());
			pstmt.setString(4,member.getJumin1());
			pstmt.setString(5,member.getJumin2());
			pstmt.setString(6,member.getEmail());
			pstmt.setString(7,member.getRecv_yn());
			pstmt.setString(8,member.getPhone1());
			pstmt.setString(9,member.getPhone2());
			pstmt.setString(10,member.getPhone3());
			pstmt.setString(11,member.getCell1());
			pstmt.setString(12,member.getCell2());
			pstmt.setString(13,member.getCell3());
			pstmt.setString(14,member.getZip());
			pstmt.setString(15,member.getAddr1());
			pstmt.setString(16,member.getAddr2());
			pstmt.setTimestamp(17,member.getReg_date());
			pstmt.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
	}// insertMember ��

	// ����� Ȯ��
	public int userCheck(String id,String passwd) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x= -1;
		
		try{
			conn = getConnection();

			pstmt = conn.prepareStatement("select passwd from MEMBER where id=?");
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();

			if(rs.next()){
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					x=1;
				}else{
					x=0;
				}
			}else{
				x=-1;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
		return x;
	}//userCheck �� 

	// ���̵� �ߺ� Ȯ��
	public int confirmId(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd="";
		int x = -1;

		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select id from MEMBER where id=?");
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();

			if(rs.next())
				x=1;
			else
				x=-1;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
		return x;
		}//confirmId ��

	// �̸��� �ߺ� Ȯ��
	public int confirmEmail(String email) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd="";
		int x = -1;

		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select email from MEMBER where email=?");
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();

			if(rs.next())
				x=1;
			else
				x=-1;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
		return x;
		}//confirmEmail ��

	//�ֹε�Ϲ�ȣ �ߺ� Ȯ��
	public int confirmJumin(String jumin1, String jumin2) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd="";
		int x = -1;

		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select jumin1,jumin2 from MEMBER where jumin1=? and jumin2=?");
			pstmt.setString(1,jumin1);
			pstmt.setString(2,jumin2);
			rs = pstmt.executeQuery();

			if(rs.next())
				x=1;
			else
				x=-1;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
		return x;
		}//confirmJumin ��

	// ���� ������ �� �̿�Ǵ� �޼ҵ�
	public LogonDataBean getMember(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		LogonDataBean member = null;
		

		try{
		   conn = getConnection();
		   pstmt = conn.prepareStatement("select * from MEMBER where id=?");
		   pstmt.setString(1,id);
		   rs = pstmt.executeQuery();
		   if(rs.next()){
		    member = new LogonDataBean();
		    member.setId(rs.getString("id"));
		    member.setPasswd(rs.getString("passwd"));
		    member.setName(rs.getString("name"));
		    member.setJumin1(rs.getString("jumin1"));
		    member.setJumin2(rs.getString("jumin2"));
		    member.setEmail(rs.getString("email"));
		    member.setRecv_yn(rs.getString("recv_yn"));
		    if (String.valueOf(rs.getString("phone1")).equals("n")){
		     member.setPhone1("");
		    }else{
		    member.setPhone1(rs.getString("phone1"));
		    }
		    if (String.valueOf(rs.getString("phone2")).equals("null")){
		     member.setPhone2("");
		    }else{
		    member.setPhone2(rs.getString("phone2"));
		    }
		    if (String.valueOf(rs.getString("phone3")).equals("null")){
		     
		     member.setPhone3("");
		    }else{
		    member.setPhone3(rs.getString("phone3"));
		    }
		    //member.setPhone3(rs.getString("phone3"));
		    member.setCell1(rs.getString("cell1"));
		    member.setCell2(rs.getString("cell2"));
		    member.setCell3(rs.getString("cell3"));
		    member.setZip(rs.getString("zip"));
		    member.setAddr1(rs.getString("addr1"));
		    if (String.valueOf(rs.getString("addr2")).equals("null")){
		     member.setAddr2("");
		    }else{
		    member.setAddr2(rs.getString("addr2"));
		    }
		    //member.setAddr2(String.valueOf(rs.getString("addr2")).equals("null")? "":rs.getString("addr2")); 
		    member.setReg_date(rs.getTimestamp("reg_date"));
		   }
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
		return member;
	}

	// ȸ������ ����
	public void updateMember(LogonDataBean member) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			try{
				conn = getConnection();
				pstmt = conn.prepareStatement("update MEMBER set passwd=?,name=?,email=?,recv_yn=?,phone1=?,phone2=?,phone3=?,cell1=?,cell2=?,cell3=?,zip=?,addr1=?,addr2=? where id=?");
				pstmt.setString(1,member.getPasswd());
				pstmt.setString(2,member.getName());
				pstmt.setString(3,member.getEmail());
				pstmt.setString(4,member.getRecv_yn());
				pstmt.setString(5,member.getPhone1());
				pstmt.setString(6,member.getPhone2());
				pstmt.setString(7,member.getPhone3());
				pstmt.setString(8,member.getCell1());
				pstmt.setString(9,member.getCell2());
				pstmt.setString(10,member.getCell3());
				pstmt.setString(11,member.getZip());
				pstmt.setString(12,member.getAddr1());
				pstmt.setString(13,member.getAddr2());
				pstmt.setString(14,member.getId());
				pstmt.executeUpdate();
/*
				System.out.print("1-"+member.getPasswd()+"\n");
				System.out.print("2-"+member.getName()+"\n");
				System.out.print("3-"+member.getEmail()+"\n");
				System.out.print("4-"+member.getRecv_yn()+"\n");
				System.out.print("5-"+member.getPhone1()+"\n");
				System.out.print("6-"+member.getPhone2()+"\n");
				System.out.print("7-"+member.getPhone3()+"\n");
				System.out.print("8-"+member.getCell1()+"\n");
				System.out.print("9-"+member.getCell2()+"\n");
				System.out.print("10-"+member.getCell3()+"\n");
				System.out.print("11-"+member.getZip()+"\n");
				System.out.print("12-"+member.getAddr1()+"\n");
				System.out.print("13-"+member.getAddr2()+"\n");
				System.out.print("14-"+member.getId()+"\n");
*/
			}catch(Exception ex){
				ex.printStackTrace();
			}finally{
				if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
				if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
	}//updateMember ��

	// ȸ��Ż��
	public int deleteMember(String id,String passwd) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x= -1;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from MEMBER where id = ?");
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();

			if(rs.next()){
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from MEMBER where id=?");
					pstmt.setString(1,id);
					pstmt.executeUpdate();
					x=1; //ȸ��Ż��
				}else{
					x=0; //��й�ȣ Ʋ��
				}
			}
		}catch(Exception ex){
				ex.printStackTrace();
			}finally{
				if(rs != null) try{rs.close();} catch(SQLException ex){}
				if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
				if(conn != null) try{conn.close();} catch(SQLException ex){}
			}
			return x;
	}// deleteMember ��

	// �����ȣ �˻� �޼ҵ�
	public static Vector zipcodeRead(String dong) throws Exception{
		Connection conn  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector zipList = new Vector();

		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from zipcode where dong like '"+dong+"%'");
			rs = pstmt.executeQuery();
			while(rs.next()){
				ZipcodeBean zipcode = new ZipcodeBean();
				zipcode.setZipcode(rs.getString("zipcode"));
				zipcode.setSido(rs.getString("sido"));
				zipcode.setGugun(rs.getString("gugun"));
				zipcode.setDong(rs.getString("dong"));
				zipcode.setRi(rs.getString("ri")==null?"":rs.getString("ri"));
				zipList.add(zipcode);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
		return zipList;
	}

}//class LogonDBBean ��


