<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.Vector"
    import="reservation.ActionBean"
    import="reservation.ReservationBean"
%>
<%
	String id="";
	try{
		id = session.getAttribute("memId").toString();
	}catch(NullPointerException e){
%>
	<script language="javascript">
		alert("������ ȸ���� �����մϴ�!");
		location.href="../servlet/reservation.Reservation";
	</script>
<%
	}
	if( id.equals("") ){
%>
	<script language="javascript">
		alert("���� Ȯ���� �α����� �Ͽ��� �մϴ�.");
//		location.href="../index.jsp";
	</script>
<%
	}else{
%>
<h3>���� ��� �Դϴ�.</h3>
<table border="1">
	<tr>
		<td class="tableSubject2">��ȣ</td>
		<td class="tableSubject2">�����̸�</td>
		<td class="tableSubject2">����ο�</td>
		<td class="tableSubject2">�����ݾ�</td>
		<td class="tableSubject2">�������</td>
		<td class="tableSubject2">��������</td>
		<td class="tableSubject2">���೯¥</td>
		<td class="tableSubject2">�����ϼ�</td>
		<td class="tableSubject2">��û��¥</td>
	</tr>
<%
	Vector<ReservationBean> vrb = new ActionBean().confirmBook(id);
	
	if( vrb == null ){
%>
	<tr>
		<td colspan="11">[ ã���ô� ������ �����ϴ� ]</td>
	</tr>
<% 	}else{
		for( int i=0; i<vrb.size(); i++ ){
			ReservationBean rb = vrb.get(i);
%>
	<tr>
		<td><%= i+1 %></td>
		<td><%= rb.getRoomname() %></td>
		<td><%= rb.getUsemen() %></td>
		<td><%= rb.getPrice() %></td>
		<td><%= rb.getPay_name() %></td>
		<td><%= rb.getPay_yn() %></td>
		<td><%= rb.getRes_date() %></td>
		<td><%= rb.getNight() %></td>
		<td><%= rb.getReg_date() %></td>
	</tr>
<% 		}
	} %>
</table>
<% 	} %>