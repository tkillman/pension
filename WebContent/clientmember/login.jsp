<%@ page contentType="text/html; charset=euc-kr"%>
<html>
	<head><title>�����Դϴ�..</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	</head>
<%
 try{
   if(session.getAttribute("memId")==null){%>
	<script language="javascript">
	<!--
		function focusIt(){      
			document.inform.id.focus();
		}
		function checkIt(){
			inputForm=eval("document.inform");
			if(!inputForm.id.value){
				alert("���̵� �Է��ϼ���..");
				inputForm.id.focus();
				return false;
			}
			if(!inputForm.passwd.value){
				alert("�н����带 �Է��ϼ���..");
				inputForm.passwd.focus();
				return false;
			}
	 	}
	//-->
	</script>
	</head>
	<body onLoad="focusIt();">
	  <table cellpadding="0" cellspacing="0"  align="center" border="1" >
	      <tr>
	       <form name="inform" method="post" action="../clientmember/loginPro.jsp"  onSubmit="return checkIt();">
	        <td width="100" align="right">���̵�</td>
	        <td width="100" >
	            <input type="text" name="id" size="15" maxlength="10"></td>
	      </tr>
	      <tr > 
	         <td width="100" align="right">�н�����</td>
	         <td width="100">
	            <input type="password" name="passwd" size="15" maxlength="10"></td>
	       </tr>
	       <tr>
	          <td colspan="3" align="center">
	            <input type="submit" name="Submit" value="�α���" class="f2">
	            <input type="button"  value="ȸ������" onclick="javascript:window.parent.center.location='../clientmember/MemberJoin.jsp'" class="f2">
	          </td></form></tr></table>
	     <%}else{%>
	       <table cellpadding="0" cellspacing="0"  align="center" border="1" >
	         <tr>
	             <%=session.getAttribute("memId")%>���� <br>
	             �湮�ϼ̽��ϴ�
	             <form  method="post" action="../clientmember/logout.jsp">  
		             <input type="submit" value="�α׾ƿ�">
		             <input type="button" value="ȸ����������" onclick="javascript:parent.center.location='modifyForm.jsp'">
	             </form>
	         </td>
	        </tr>
	     </table>
	     <br>
	 <%}
	 }catch(NullPointerException e){}
	 %>
	 </body>
</html>