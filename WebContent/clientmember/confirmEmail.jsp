<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="clientmember.LogonDBBean"%>

<html>
	<head><title>�̸��� �ߺ� Ȯ��</title>
	<link href="style.css" rel="stylesheet" type="text/css"></link>
	</head>
	<%
		request.setCharacterEncoding("euc-kr");	
		String email = request.getParameter("email");
		LogonDBBean manager = LogonDBBean.getInstance();
		int check = manager.confirmEmail(email);

	%>
	<body>
		<%
			if(check == 1){ %>
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td height="39"><%=email%> �̹� ������� �̸����Դϴ�</td>
			</tr>
		</table>
		<form name="checkForm" method="post" action="confirmEmail.jsp">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td>
					�ٸ� �̸����� ���� �� ���� ��...<p>
					<input type="text" size="15" maxlength="15" name="email">
					<input type="submit" value="�̸��� �ߺ�Ȯ��" class="f2">
				</td>
			</tr>
		</table>
		</form>
		<%}else{%>
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td>
					<p>�� <%=email%>�̸����� ����� �� ������.</p>
					<input type="button" value="�ݱ�" onclick="setEmail()" class="f2">
				</td>
			</tr>
		</table>
		<%}%>
	</body>
</html>
<script language="javascript">
		
			function setEmail(){
				opener.document.memberjoin.email.value="<%=email%>";
				opener.document.memberjoin.emailCheck.value="yes";
				self.close();
			}
		
	</script>