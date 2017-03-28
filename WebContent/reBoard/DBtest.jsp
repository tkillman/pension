<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*,javax.sql.*, javax.naming.*" %>

<html>
<head><title>DBCP�� ����� ���̺��� ���ڵ带 ȭ�鿡 ǥ���ϴ� ����</title></head>
<body>
  <h3>DBCP�� �����member1 ���̺��� ���ڵ带 ȭ�鿡 ǥ���ϴ� ����</h3>
  <TABLE width="550" border="1">
  <TR>
  	<TD width="100">�����ȣ</TD>
  	<TD width="100">�̸� </TD>
  	<TD width="100">���� </TD>
  </TR>
<%
  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	  Context initCtx = new InitialContext();
	  Context envCtx = (Context) initCtx.lookup("java:comp/env");
	  DataSource ds = (DataSource)envCtx.lookup("jdbc/myoracle");
	  conn = ds.getConnection();
	  
	String sql= "select * from emp";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	while(rs.next()){
      String id= rs.getString("empno");
      String passwd= rs.getString("ename");
      String name= rs.getString("job");
%>
<TR>
  	   <TD width="100"><%=id%></TD>
  	   <TD width="100"><%=passwd%></TD>
  	   <TD width="100"><%=name%></TD>
</TR>

<%  } 
  }catch(Exception e){ 
		e.printStackTrace();
  }finally{
	    if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
  }
%>
</table>
</body>
</html>
