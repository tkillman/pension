<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="clientmember.LogonDBBean"%>

<html>
	<head>
	</head>
	<%
		String id=(String)session.getAttribute("memId");
		String passwd=request.getParameter("passwd");

		LogonDBBean manager=LogonDBBean.getInstance();
		int check = manager.deleteMember(id,passwd);

		if(check == 1){
			session.invalidate();
	%>
	<body>
		<form method="post" action="main.jsp" name="userprint">
			<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
				<tr align="center">
					<td><b>ȸ�� ������ �����Ǿ����ϴ�.</b></td>
				</tr>
				<tr>
					<td><meta http-equiv="Refresh"content="5;url=../index.jsp"></td>
				</tr>
				<tr>
					<td align="center"><input type="submit" value="Ȯ��"></td>
				</tr>
			</table>
		</form>
		<%}else{%>
			<script>
				alert("��й�ȣ�� ���� �ʽ��ϴ�.");
				history.go(-1);
			</script>
		<%}%>
	</body>
</html>