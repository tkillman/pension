<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="clientmember.LogonDBBean"%>
<html>
	<head><title>�ֹε�Ϲ�ȣ �ߺ� Ȯ��</title>
	<link href="style.css" rel="stylesheet" type="text/css"></link>
	</head>
	<%
		request.setCharacterEncoding("euc-kr");	
		String jumin1 = request.getParameter("jumin1");
		String jumin2 = request.getParameter("jumin2");
		LogonDBBean manager = LogonDBBean.getInstance();
		int check = manager.confirmJumin(jumin1,jumin2);
	%>
	<body>
		<% if(check == 1){ %>
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td height="39"><p>����� �ֹε�Ϲ�ȣ�� �����ϰ� �־�. �ڼ��� -_-</p>
					<input type="button" value="�ݱ�" class="f2" onClick="resetJumin()" />
				</td>
			</tr>
		</table>
		<%}else{%>
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td>
					<p>������ �� �ִ� �ֹε�Ϲ�ȣ�Դϴ�.</p>
					<input type="button" value="�ݱ�" onclick="setJumin()" class="f2">
				</td>
			</tr>
		</table>
		<%}%>
	</body>
</html>
<script language="javascript">
<!--
	function resetJumin(){
		opener.document.memberjoin.jumin1.value="";
		opener.document.memberjoin.jumin2.value="";
		self.close();
	}
	function setJumin(){
		opener.document.memberjoin.jumin1.value="<%=jumin1%>";
		opener.document.memberjoin.jumin2.value="<%=jumin2%>";
		opener.document.memberjoin.juminCheck.value="yes";
		self.close();
	}
-->
</script>