<jsp:include page="head.jsp" />
<%@ page contentType="text/html; charset=euc-kr"
	import="common.CommonBean"
	import="common.CommonAction" 
%>
<%
	CommonBean cb = CommonAction.getInstance().selectCommon();
	String[] ssea = null;
	String[] esea = null;
	
	if( cb == null ){ 
		cb = new CommonBean();
		ssea = new String[]{"",""};
		esea = new String[]{"",""};
	}else{
		ssea = cb.getSseason().split("-");
		esea = cb.getEseason().split("-");
	}
%>
<script language="javascript">
	function chkCommonFrm(form){
		if( form.sseason1.value == "" ){
			alert("������Ⱓ�� �Է��ϼ���!");
			form.sseason1.focus();
			return false;
		}
		if( form.sseason2.value == "" ){
			alert("������Ⱓ�� �Է��ϼ���!");
			form.sseason2.focus();
			return false;
		}
		if( form.eseason1.value == "" ){
			alert("������Ⱓ�� �Է��ϼ���!");
			form.eseason1.focus();
			return false;
		}
		if( form.eseason2.value == "" ){
			alert("������Ⱓ�� �Է��ϼ���!");
			form.eseason2.focus();
			return false;
		}
		return true;
	}
</script>
<form name="commonFrm" method="post" action="commonPro.jsp" onSubmit="return chkCommonFrm(this)">
<table border="1">
	<tr>
		<th colspan="3" class="tableSubject1">��� ���� �Է»���</th>
	</tr>
	<tr>
		<td rowspan="2" class="tableSubject2">������Ⱓ</td>
		<td class="tableSubject2">����</td>
		<td>
			<input type="text" name="sseason1" size="3" value="<%= ssea[0] %>" />�� 
			<input type="text" name="sseason2" size="3" value="<%= ssea[1] %>" />��
		</td>
	</tr>
	<tr>
		<td class="tableSubject2">��</td>
		<td>
			<input type="text" name="eseason1" size="3" value="<%= esea[0] %>" />�� 
			<input type="text" name="eseason2" size="3" value="<%= esea[1] %>" />��
		</td>
	</tr>
	<tr>
		<td rowspan="3" class="tableSubject2">�Աݰ���</td>
		<td class="tableSubject2">�����</td>
		<td><input type="text" name="bankname" value="<%= cb.getBankname() %>" /></td>
	</tr>
	<tr>
		<td class="tableSubject2">���¹�ȣ</td>
		<td><input type="text" name="banknumber" value="<%= cb.getBanknumber() %>" /></td>
	</tr>
	<tr>
		<td class="tableSubject2">�����ָ�</td>
		<td><input type="text" name="bankuser" value="<%= cb.getBankuser() %>" /></td>
	</tr>
	<tr>
		<td colspan="3" class="center1">
			<input type="submit" value="�����ϱ�" />
		</td>
	</tr>
</table>
</form>
<jsp:include page="foot.html" />