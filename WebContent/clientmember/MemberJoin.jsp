<%@ page contentType="text/html;charset=euc-kr"%>
<!--ȸ������ MemberJoin-->
<html><head>
<link href="style.css" rel="stylesheet" type="text/css"></link>
<script language="JavaScript" src="MemberJoin.js"></script>
</head>
<body onLoad="idfocus()">
<font size="5">ȸ������ �� �̿���</font><p/>
ȸ�������� ���ؼ� ȸ������ ���������� �Է����ֽñ� �ٶ��ϴ�.<p/>
ȸ�������� �ʼ������׸��Դϴ�<br><br><br>
<form method="post" action="inputPro.jsp" name="memberjoin" onSubmit="return validMember(this)" >
	<table cellspacing="0" cellpadding="3" border="1" align="center" width="" bordercolor="#FFC0CB">
		<tr>
			<td align="left" width="16%" class="f1">���̵�</td><td width="84%"><input type="text" name="id" size="15" style="ime-mode:disabled;">&nbsp;&nbsp;<input type="button" name="btn_id" value="���̵� �ߺ�Ȯ��" onClick="openConfirmid(this.form)" class="f2">&nbsp;���̵� �Է����ּ���.</td>
		</tr>
		<tr>
			<td align="left" class="f1">��й�ȣ</td><td><input type="password" name="passwd" size="15">&nbsp;��й�ȣ�� �Է����ּ���.</td>
		</tr>
		<tr>
			<td align="left" class="f1">��й�ȣ Ȯ��</td><td><input type="password" name="passwd2" size="15">&nbsp;��й�ȣ�� �Է����ּ���.</td>
		</tr>
		<tr>
			<td align="left" class="f1">�̸�</td><td><input type="text" name="name" size="15">&nbsp;�̸��� �Է����ּ���.</td>
		</tr>
		<tr>
			<td align="left" class="f1">�ֹε�Ϲ�ȣ</td><td><input type="text" name="jumin1" size="6" maxlength="6" onKeyUP="moveJumin(this.form)">&nbsp;-&nbsp;<input type="password" name="jumin2" size="7" maxlength="7">&nbsp;&nbsp;<input type="button" name="btn_jumin" value="�ߺ�Ȯ��" onClick="openConfirmJumin(this.form)" class="f2">&nbsp;�ֹε�Ϲ�ȣ�� �Է����ּ���.</td>
		</tr>
		<tr>
			<td align="left" class="f1">�̸���</td><td><input type="text" name="email" size="40">&nbsp;&nbsp;<input type="button" name="btn_email" value="�̸��� �ߺ�Ȯ��" onClick="openConfirmEmail(this.form)" class="f2">&nbsp;�̸����� �Է����ּ���.</td>
		</tr>
		<tr>
			<td align="left" class="f1">�̸��� ���ſ���</td><td><input type="radio" name="recv_yn" value="y"checked>��&nbsp;&nbsp;<input type="radio" name="recv_yn" value="n">�ƴϿ�</td>
		</tr>
		<tr>
			<td align="left" class="f1">��ȭ��ȣ</td><td><select name="phone1"><option selected class="f2" value="n">�����ϼ���
																	<option value="02">���� (02)</option>
																	<option value="031">��� (031)</option>
																	<option value="032">��õ (032)</option>
																	<option value="033">���� (033)</option>
																	<option value="041">�泲 (041)</option>
																	<option value="042">���� (042)</option>
																	<option value="043">��� (043)</option>
																	<option value="051">�λ� (051)</option>
																	<option value="052">��� (052)</option>
																	<option value="053">�뱸 (053)</option>
																	<option value="054">��� (054)</option>
																	<option value="055">�泲 (055)</option>
																	<option value="061">���� (061)</option>
																	<option value="062">���� (062)</option>
																	<option value="063">���� (063)</option>
																	<option value="064">���ֵ� (064)</option>
																	<option value="0502">DACOM (0502)</option>
																	<option value="0505">KT (0505)</option>
															</select>&nbsp;-&nbsp;<input type="text" name="phone2" size="4">&nbsp;-&nbsp;<input type="text" name="phone3" size="4">&nbsp;������ȭ��ȣ�� �Է����ּ���.
													</td>
		</tr>
		<tr>
			<td align="left" class="f1">�޴���ȭ��ȣ</td><td><select name="cell1"><option selected class="f2" value="n">�����ϼ���
																	<option value="010">010</option>
																	<option value="011">011</option>
																	<option value="013">013</option>
																	<option value="016">016</option>
																	<option value="017">017</option>
																	<option value="018">018</option>
																	<option value="019">019</option>
																	<option value="0502">0502</option>
																	<option value="0505">0505</option>
																	<option value="0506">0506</option>
																</select>&nbsp;-&nbsp;<input type="text" name="cell2" size="4">&nbsp;-&nbsp;<input type="text" name="cell3" size="4">&nbsp;�޴���ȭ��ȣ�� �Է����ּ���.
															</td>
		</tr>
		<tr>
			<td align="left" class="f1">�ּ�</td><td><input type="text" name="zip" size="7" maxlength="7" readonly>&nbsp;<input type="button" name="btnzip" value="�����ȣã��" onClick="findZip()" class="f2"><p/><input type="text" name="addr1" size="50"><p/><input type="text" name="addr2" size="50"></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" name="btnsubmit" value="Ȯ��" class="f2">&nbsp;&nbsp;<input type="reset" name="btnreset" value="�ٽ��Է�" class="f2"></td>
		</tr>
	</table>
		<input type="hidden" name="idCheck" value="no"> 
		<input type="hidden" name="juminCheck" value="no"> 
		<input type="hidden" name="emailCheck" value="no"> 
	</form>
</body>
</html>