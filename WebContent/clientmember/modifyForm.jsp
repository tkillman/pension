<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import = "clientmember.*" %>


<html>
	<head>
	<link href="style.css" rel="stylesheet" type="text/css"></link>
		<script language="Javascript" src="MemberJoin.js">
		 <!-- 
		    function checkIt() {
		        var userinput = eval("document.userinput");
		               
		        if(!userinput.passwd.value ) {
		            alert("��й�ȣ�� �Է��ϼ���");
		            return false;
		        }
		        if(userinput.passwd.value != userinput.passwd2.value)
		        {
		            alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
		            return false;
		        }
		       
		        if(!userinput.username.value) {
		            alert("����� �̸��� �Է��ϼ���");
		            return false;
		        }
		        if(!userinput.jumin1.value  || !userinput.jumin2.value )
		        {
		            alert("�ֹε�Ϲ�ȣ�� �Է��ϼ���");
		            return false;
		        }
		    }
		-->
			
		</script>
	</head>
	<%
		String id = (String)session.getAttribute("memId");
		LogonDBBean manager = LogonDBBean.getInstance();
		LogonDataBean c= manager.getMember(id);
		
		try{
	%>
	<body>
		<form method="post" action="modifyPro.jsp" name="userinput" onsubmit="return checkIt()">
		<table width="600" border="1" cellspacing="0" cellpadding="3" align="center" bordercolor="#FFC8FF">
			<tr>
				<td colspan="2" height="39" align="center">
					<b>ȸ����������</b>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">ȸ���� ������ �����մϴ�.</td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#FFC8FF" class="f1">���̵��Է�</td>
				
			</tr>
			<tr>
				<td class="f1">�����ID</td>
				<td><%=c.getId()%></td>
			</tr>
			<tr>
				<td class="f1">��й�ȣ</td>
				<td><input type="password" name="passwd" size="10" maxlength="10" value="<%=c.getPasswd()%>"></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#FFC8FF" class="f1">�������� �Է�</td>
				
			</tr>
			<tr>
				<td class="f1">����� �̸�</td>
				<td><input type="text" name="name" size="12" maxlength="12" value="<%=c.getName()%>"></td>
			</tr>
			<tr>
				<td class="f1">�ֹε�Ϲ�ȣ</td>
				<td><%=c.getJumin1()%>-<%=c.getJumin2()%></td>
			</tr>
			<tr>
				<td class="f1">E-Mail</td>
				<td><input type="text" name="email" size="40" maxlength="30" value="<%=c.getEmail()%>">	
				</td>
			</tr>
			<tr>
				<td class="f1">�̸��� ���ſ���</td>
				<td><input type="radio" name="recv_yn" value="y" <%if(c.getRecv_yn().equals("y")){%> checked <%}%>>��
 					<input type="radio" name="recv_yn" value="n" <%if(c.getRecv_yn().equals("n")){%> checked <%}%>>�ƴϿ�
			</tr>
			<tr>
				<td class="f1">��ȭ��ȣ</td>
				<td><%if(c.getPhone1()==null){%>
							<input type="text" name="phone1" size="4" maxlength="4">-
							<input type="text" name="phone2" size="4" maxlength="4">-
							<input type="text" name="phone3" size="4" maxlength="4">
						<%}else{%>
							<input type="text" name="phone1" size="4" maxlength="4" value="<%=c.getPhone1()%>">-
							<input type="text" name="phone2" size="4" maxlength="4" value="<%=c.getPhone2()%>">-
							<input type="text" name="phone3" size="4" maxlength="4" value="<%=c.getPhone3()%>">	
						<%}%></td>
			</tr>
			<tr>
				<td class="f1">�޴���ȭ</td>
				<td><input type="text" name="cell1" size="4" maxlength="4" value="<%=c.getCell1()%>">-
					<input type="text" name="cell2" size="4" maxlength="4" value="<%=c.getCell2()%>">-
					<input type="text" name="cell3" size="4" maxlength="4" value="<%=c.getCell3()%>">
				</td>
			</tr>
			<tr>
				<td class="f1">�ּ�</td>
				<td><%if(c.getAddr1()==null){%>
							<input type="text" name="zip" size="7" maxlength="7">
							<input type="button" name="btnzip" value="�����ȣã��" class="f2" onClick="findZip()"><p/><input type="text" name="addr1" size="50"><p/><input type="text" name="addr2" size="50"></td>
						<%}else{%>
							<input type="text" name="zip" size="7" maxlength="7" value="<%=c.getZip()%>">
							<input type="button" name="btnzip" value="�����ȣã��" class="f2" onClick="findZip()"><p/><input type="text" name="addr1" size="50" value="<%= c.getAddr1() %>">
							<p/><input type="text" name="addr2" size="50" value="<%=c.getAddr2()%>"></td>
						<%}%></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="modify" value="�� ��" class="f2">&nbsp;&nbsp;
					<input type="button" value="�� ��" onClick="javascript:window.location='../Main/centerMain.jsp'" class="f2">&nbsp;&nbsp;
					<input type="button" value="ȸ��Ż��" onClick="javascript:window.location='deleteForm.jsp'" class="f2">
				</td>
			</tr>
		</table>
		</form>
	</body>
	<%}catch(Exception e){}%>
</html>