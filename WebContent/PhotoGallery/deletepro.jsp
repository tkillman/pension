<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="photoGallery.DBB" %>

<html>
<head>
<title>�ۻ���</title>

</head>

<%
    String name = request.getParameter("name");
	String passwd  = request.getParameter("passwd");
	
	DBB manager = DBB.getInstance();
    int check = manager.deleteMember(name,passwd);
	
	if(check==1){
		session.invalidate();
%>
<body>
<form method="post" action="jspTestMain.jsp" name="userinput" >
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr> 
    <td height="39" align="center">
	  <font size="+1" ><b>���� �����Ǿ����ϴ�.</b></font></td>
  </tr>
  <tr>
    <td align="center"> 
      <p>����.... �����մϴ�. �ȳ��� ������.</p>
      <meta http-equiv="Refresh" content="5;url=main.jsp" >
    </td>
  </tr>
  <tr >
    <td align="center"> 
      <input type="submit" value="Ȯ��">
    </td>
  </tr>
</table>
</form>
<%}else {%>
	<script> 
	  alert("��й�ȣ�� ���� �ʽ��ϴ�.");
      history.go(-1);
	</script>
<%}%>

</body>
</html>
