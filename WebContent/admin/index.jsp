<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	try{
		if(session.getAttribute("ultraId")==null){
%>
<html>
	<head>
	<title>��� ������ �α���</title>
	<script language="Javascript">
		function focusIt(){
			document.login.id.focus();
		}
		function checkIt(){
			var inputForm=eval("document.login");
			if(!inputForm.id.value){
				alert("��ڴ� ���̵���");
				inputForm.id.focus();
				return;
			}
			if(!inputForm.passwd.value){
				alert("��й�ȣ�� ������");
				inputForm.passwd.focus();
				return;
			}
			document.login.submit();
		}
	</script>
	<link rel="stylesheet" type="text/css" href="./css/admin.css" />
	</head>
	<body onLoad="focusIt()"><br /><br /><br /><br />
	<h2 align="center" style="background:#C4B4E1;">*��ڴ�  � �ɼ�*</h2><br /><br />
		<form method="post" action="LoginPro.jsp" name="login">
			<table border="0" align="center" width="350">
				<tr align="center">
					<td class="tableSubject2" height="60" width="350">
						ID&nbsp;<input type="text" name="id" size="10" /> 
						passwd&nbsp;<input type="password" name="passwd" size="10" onkeypress="javascript:if(event.keyCode==13)checkIt();" />
					</td>
				</tr>
				<tr>
					<td class="tableSubject3" onClick="checkIt()" style="cursor:hand;" height="100">�α���</td>
				</tr>
			</table >
		</form>
		<%} else { %>
		<script language="javascript">
			location.href="reservationList.jsp";
		</script>
	<%	  }
	} catch(NullPointerException e){}
	%>
	</body>
</html>	