<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="clientmember.LogonDBBean"%>

<html>
	<head><title>ID �ߺ� Ȯ��</title>
	<link href="style.css" rel="stylesheet" type="text/css"></link>
	</head>
	<%
		request.setCharacterEncoding("euc-kr");	
		String id = request.getParameter("id");
		LogonDBBean manager = LogonDBBean.getInstance();
		int check = manager.confirmId(id);
	%>
	<body>
		<%
			if(check == 1){ %>
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td height="39"><%=id%> �̹� ������� ���̵��Դϴ�</td>
			</tr>
		</table>
		<form name="checkForm" method="post" action="confirmId.jsp">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td>
					�ٸ� ���̵� �����ϼ���<p>
					<input type="text" size="15" maxlength="15" name="id" style="ime-mode:disabled;">
					<input type="submit" value="���̵� �ߺ�Ȯ��" class="f2">
				</td>
			</tr>
		</table>
		</form>
		<%}else{%>
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td>
					<p>�Է��Ͻ� <%=id%>�� ����Ͻ� �� �ִ� ID�Դϴ�.</p>
					<input type="button" value="�ݱ�" onclick="setid()" class="f2">
				</td>
			</tr>
		</table>
		<%}%>
	</body>
</html>
<script language="javascript">
<!--
	function setid(){
		opener.document.memberjoin.id.value="<%=id%>";
		opener.document.memberjoin.idCheck.value="yes";
		self.close();
	}
-->
</script>