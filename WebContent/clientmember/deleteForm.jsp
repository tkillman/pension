<%@ page contentType="text/html;charset=euc-kr"%>
<html>
	<head>
	<link href="style.css" rel="stylesheet" type="text/css"></link>
	<script language="javascript">
	<!--
		function begin(){
			document.myform.id.focus();
		}
		
		function checkIt(){
			if(document.myform.id.value==" " || document.myform.passwd.value=" "){
				alert("���̵�� �н����带 �Է����ּ���.");
				document.myform.id.focus();
				return false;
			}
		}
	-->
	</script>
	</head>
	<body onLoad="begin()">
		<form name="myform" action="deletePro.jsp" method="post" onSubmit="return checkIt()">
			<table cellspacing="0"cellpadding="3" width="260" border="1" align="center">
				<tr>
					<td colspan="2" align="middle">
						ȸ��Ż�� ���� �ٽ� �� �� ���̵�� ��й�ȣ�� �Է����ּ���.
					</td>
				</tr>	
				<tr>
					<td>���̵�</td>
					<td><input type="text" name="id" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="passwd" size="15" maxlength="15"></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" name="btn_quit" value="ȸ��Ż��" class="f2"></td>
				</tr>
			</table>
		</form>
	</body>
</html>