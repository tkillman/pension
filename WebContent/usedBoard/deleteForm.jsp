<%@ page contentType="text/html;charset=euc-kr" %>


<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");

%>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="JavaScript">     
<!--     
  function deleteSave(){   
    if(document.delForm.passwd.value==''){
    alert("��й�ȣ�� �Է��Ͻʽÿ�.");
    document.delForm.passwd.focus();
    return false;
 }
}   
// -->     
</script>
</head>
<body>
<img src="./img/head02.gif"><br>
       <center><img src=".\img\img02.gif"></center>
    <br>
<br>
<form method="POST" name="delForm"  action="deletePro.jsp?pageNum=<%=pageNum%>"
   onsubmit="return deleteSave()">
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center>
       <b>��й�ȣ�� �Է��� �ּ���.</b></td>
  </tr>
  <tr height="30">
     <td align=center>��й�ȣ :  
       <input type="password" name="passwd" size="8" maxlength="12">
       <input type="hidden" name="num" value="<%=num%>"></td>
 </tr>
 <tr height="30">
    <td align=center>
      <input type="image" src="./img/btn_ok.gif">
      <input type="button" 
      document.location.href='list.jsp?pageNum=<%=pageNum%>'">    
   </td>
 </tr> 
</table>
</form>
</body>
</html>

