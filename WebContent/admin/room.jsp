<jsp:include page="head.jsp" />
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.Vector"
    import="reservation.ActionBean"
    import="reservation.RoomBean"
%>
<%
	Vector<RoomBean> vrb = new ActionBean().getRoom();
%>
<script language="javascript">

	// ���� �߰�
	function addRoom(form){
		if( form.nrname.value == "" ){
			alert("���� �̸��� �Է��ϼ���!");
			form.nrname.focus();
			return;
		}
		if( form.nrsize.value == "" ){
			alert("���� ����� �Է��ϼ���!");
			form.nrsize.focus();
			return;
		}
		if( form.nmen.value == "" ){
			alert("���� �ִ��̿��ο��� �Է��ϼ���!");
			form.nmen.focus();
			return;
		}
		if( form.naddman.value == "" ){
			alert("���� �̿��ο� �߰� �ݾ��� �Է��ϼ���!");
			form.naddman.focus();
			return;
		}
		if( form.nweekday.value == "" ){
			alert("���� ����� ���� �ݾ��� �Է��ϼ���!");
			form.nweekday.focus();
			return;
		}
		if( form.nweekend.value == "" ){
			alert("���� ����� �ָ� �ݾ��� �Է��ϼ���!");
			form.nweekend.focus();
			return;
		}
		if( form.nsweekday.value == "" ){
			alert("���� ������ ���� �ݾ��� �Է��ϼ���!");
			form.nsweekday.focus();
			return;
		}
		if( form.nsweekend.value == "" ){
			alert("���� ������ �ָ� �ݾ��� �Է��ϼ���!");
			form.nsweekend.focus();
			return;
		}
		form.action="roomPro.jsp?type=add"
								+"&rname="+form.nrname.value
								+"&rsize="+form.nrsize.value
								+"&men="+form.nmen.value
								+"&addman="+form.naddman.value
								+"&weekday="+form.nweekday.value
								+"&weekend="+form.nweekend.value
								+"&sweekday="+form.nsweekday.value
								+"&sweekend="+form.nsweekend.value;
		form.submit();
	}

	// ���� ���� ( ���̸�,�������ǰ� )
	function resetRoom(form,num){
		if( document.getElementById("rname"+num).value == "" ){
			alert("���� �̸��� �Է��ϼ���!");
			document.getElementById("rname"+num).focus();
			return;
		}
		if( document.getElementById("rsize"+num).value == "" ){
			alert("���� ����� �Է��ϼ���!");
			document.getElementById("rsize"+num).focus();
			return;
		}
		if( document.getElementById("men"+num).value == "" ){
			alert("���� �ִ��̿��ο��� �Է��ϼ���!");
			document.getElementById("men"+num).focus();
			return;
		}
		if( document.getElementById("addman"+num).value == "" ){
			alert("���� �̿��ο� �߰� �ݾ��� �Է��ϼ���!");
			document.getElementById("addman"+num).focus();
			return;
		}
		if( document.getElementById("weekday"+num).value == "" ){
			alert("���� ����� ���� �ݾ��� �Է��ϼ���!");
			document.getElementById("weekday"+num).focus();
			return;
		}
		if( document.getElementById("weekend"+num).value == "" ){
			alert("���� ����� �ָ� �ݾ��� �Է��ϼ���!");
			document.getElementById("weekend"+num).focus();
			return;
		}
		if( document.getElementById("sweekday"+num).value == "" ){
			alert("���� ������ ���� �ݾ��� �Է��ϼ���!");
			document.getElementById("sweekday"+num).focus();
			return;
		}
		if( document.getElementById("sweekend"+num).value == "" ){
			alert("���� ������ �ָ� �ݾ��� �Է��ϼ���!");
			document.getElementById("sweekend"+num).focus();
			return;
		}
		form.action="roomPro.jsp?type=reset"
								+"&rno="+document.getElementById("no"+num).value
								+"&rname="+document.getElementById("rname"+num).value
								+"&rsize="+document.getElementById("rsize"+num).value
								+"&men="+document.getElementById("men"+num).value
								+"&addman="+document.getElementById("addman"+num).value
								+"&weekday="+document.getElementById("weekday"+num).value
								+"&weekend="+document.getElementById("weekend"+num).value
								+"&sweekday="+document.getElementById("sweekday"+num).value
								+"&sweekend="+document.getElementById("sweekend"+num).value;
		form.submit();
	}

	// ���� ����
	function delRoom(form,num){
		if( !confirm("���� ������ ���� �Ͻðڽ��ϱ�?") ){
			return;
		}
		if( document.getElementById("no"+num).value == "" ){
			alert("���ű�ɿ� ������ �߻��Ͽ����ϴ�!\n\n�������� ���ΰ�ġ�� �õ��ϼ���!");
		}
		form.action="roomPro.jsp?type=del"
								+"&rno="+document.getElementById("no"+num).value;
		form.submit();
	}

</script>
<form name="roomFrm" method="post">
	<table border="1">
		<tr>
			<th colspan="10" class="tableSubject1">���� ���</th>
		</tr>
		<tr>
			<td rowspan="2" class="tableSubject2">��ȣ</td>
			<td rowspan="2" class="tableSubject2">�����̸�</td>
			<td rowspan="2" class="tableSubject2">����ũ��(��)</td>
			<td rowspan="2" class="tableSubject2">�ִ��ο���</td>
			<td rowspan="2" class="tableSubject2">�߰��ο��ݾ�</td>
			<td colspan="2" class="tableSubject2">�����</td>
			<td colspan="2" class="tableSubject2">������</td>
			<td rowspan="2" class="tableSubject2">����/����</td>
		</tr>
		<tr>
			<td class="tableSubject2">���߰���</td><td class="tableSubject2">�ָ�����</td><td class="tableSubject2">���߰���</td><td class="tableSubject2">�ָ�����</td>
		</tr>
	<% for( int i=0; i<vrb.size(); i++){
		RoomBean rb = vrb.get(i);
	%>
		<tr>
			<td><%= i+1 %><input type="hidden" name="no<%= i %>" value="<%= rb.getRno() %>"></td>
			<td><input type="text" id="rname<%= i %>" name="rname<%= i %>" size="10" value="<%= rb.getRname() %>" /></td>
			<td><input type="text" name="rsize<%= i %>" size="7" value="<%= rb.getRsize() %>" /></td>
			<td><input type="text" name="men<%= i %>" size="7" value="<%= rb.getMen() %>" /></td>
			<td><input type="text" name="addman<%= i %>" size="7" value="<%= rb.getAddman() %>" /></td>
			<td><input type="text" name="weekday<%= i %>" size="7" value="<%= rb.getWeekday() %>" /></td>
			<td><input type="text" name="weekend<%= i %>" size="7" value="<%= rb.getWeekend() %>" /></td>
			<td><input type="text" name="sweekday<%= i %>" size="7" value="<%= rb.getSweekday() %>" /></td>
			<td><input type="text" name="sweekend<%= i %>" size="7" value="<%= rb.getSweekend() %>" /></td>
			<td>
				<input type="button" value="���Ǽ���" onClick="resetRoom(this.form,<%= i %>)" /> 
				<input type="button" value="����" onClick="delRoom(this.form,<%= i %>)" />
			</td>
		</tr>
	<% 	} %>
		<tr>
			<td colspan="10"  class="tableSubject2">���� �߰�</td>
		</tr>
		<tr>
			<td>�Է�</td>
			<td><input type="text" name="nrname" size="10" /></td>
			<td><input type="text" name="nrsize" size="7" /></td>
			<td><input type="text" name="nmen" size="7" /></td>
			<td><input type="text" name="naddman" size="7" /></td>
			<td><input type="text" name="nweekday" size="7" /></td>
			<td><input type="text" name="nweekend" size="7" /></td>
			<td><input type="text" name="nsweekday" size="7" /></td>
			<td><input type="text" name="nsweekend" size="7" /></td>
			<td><input type="button" value="�����߰�" onClick="addRoom(this.form)" /></td>
		</tr>
	</table>
</form>
<jsp:include page="foot.html" />