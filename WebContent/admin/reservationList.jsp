<jsp:include page="head.jsp" />
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.Calendar"
    import="java.util.Vector"
    import="common.CommonAction"
    import="reservation.ReservationBean"
%>
<%
	request.setCharacterEncoding("euc-kr");
	Calendar cal = Calendar.getInstance();

	String syear = request.getParameter("syear") == null ? cal.get(Calendar.YEAR)+"" :request.getParameter("syear");
	String smonth = request.getParameter("smonth") == null ? (cal.get(Calendar.MONTH)+1)+"" :request.getParameter("smonth");
	String sdate = request.getParameter("sdate") == null ? cal.get(Calendar.DATE)+"" :request.getParameter("sdate");
	String eyear = request.getParameter("eyear") == null ? cal.get(Calendar.YEAR)+"" :request.getParameter("eyear");
	String emonth = request.getParameter("emonth") == null ? (cal.get(Calendar.MONTH)+1)+"" :request.getParameter("emonth");
	String edate = request.getParameter("edate") == null ? cal.get(Calendar.DATE)+"" :request.getParameter("edate");
	
	String card = request.getParameter("card") == null ? "":request.getParameter("card");
	String bank = request.getParameter("bank") == null ? "":request.getParameter("bank");
	String banksub = request.getParameter("banksub") == null ? "":request.getParameter("banksub");
	
	String searcht = request.getParameter("searcht") == null ? "":request.getParameter("searcht");
	String searchv = request.getParameter("searchv") == null ? "":request.getParameter("searchv");
	
	int currentPage = Integer.parseInt((request.getParameter("currentPage")==null || request.getParameter("currentPage").equals(""))?"1":request.getParameter("currentPage"));
%>
<script language="javascript">
<!--
	// �Ա� �Ϸ� ó�� �� �ٽ� ������
	function payOk(rsno){
		window.open('payOk.jsp?rsno='+rsno+'&currentPage='+<%= currentPage %>,'','width=1 height=1');
	}
-->
</script>
<form name="searchFrm" method="post" action="reservationList.jsp">
<input type="hidden" name="currentPage" value="" /><!-- payOk.jsp �˾����Ͽ��� ����ϴ� hidden -->
<table border="1">
	<tr>
		<th colspan="2" class="tableSubject1">��� ���� ���</th>
	</tr>
	<tr>
		<td class="tableSubject2">�˻��Ⱓ</td>
		<td>
			<select name="syear">
			<% for( int i=2008; i<2011; i++ ){ %>
				<option value="<%= i %>" <% if(Integer.parseInt(syear)==i)out.print("selected"); %> /><%= i %>
			<% } %>
			</select>�� 
			<select name="smonth">
			<% for( int i=1; i<13; i++ ){ %>
				<option value="<%= (i<10)?"0"+i:i %>" <% if(Integer.parseInt(smonth)==i)out.print("selected"); %> /><%= i %>
			<% } %>
			</select>�� 
			<select name="sdate">
				<% for( int i=1; i<32; i++ ){ %>
				<option value="<%= (i<10)?"0"+i:i %>" <% if(Integer.parseInt(sdate)==i)out.print("selected"); %> /><%= i %>
			<% } %>
			</select>�� ~ 
			<select name="eyear">
			<% for( int i=2008; i<2011; i++ ){ %>
				<option value="<%= i %>" <% if(Integer.parseInt(eyear)==i)out.print("selected"); %> /><%= i %>
			<% } %>
			</select>�� 
			<select name="emonth">
			<% for( int i=1; i<13; i++ ){ %>
				<option value="<%= (i<10)?"0"+i:i %>" <% if(Integer.parseInt(emonth)==i)out.print("selected"); %> /><%= i %>
			<% } %>
			</select>�� 
			<select name="edate">
				<% for( int i=1; i<32; i++ ){ %>
				<option value="<%= (i<10)?"0"+i:i %>" <% if(Integer.parseInt(edate)==i)out.print("selected"); %> /><%= i %>
			<% } %>
			</select>��
		</td>
	</tr>
	<tr>
		<td class="tableSubject2">�˻����</td>
		<td>
			<input type="checkbox" name="card" value="card" <% if(card.equals("card"))out.print("checked"); %> />ī�� 
			<input type="checkbox" name="bank" value="bank" <% if(bank.equals("bank"))out.print("checked"); %> />������ü &nbsp;&nbsp;&nbsp;
			<input type="radio" name="banksub" value="y" <% if(banksub.equals("y"))out.print("checked"); %> />�ԱݿϷ� 
			<input type="radio" name="banksub" value="n" <% if(banksub.equals("n"))out.print("checked"); %> />�Աݿ��� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="searcht">
				<option value="" <% if(searcht.equals(""))out.print("selected"); %> />::�˻�Ÿ��Ʋ::
				<option value="rname" <% if(searcht.equals("rname"))out.print("selected"); %> />�����̸�
				<option value="id" <% if(searcht.equals("id"))out.print("selected"); %> />������ID
				<option value="name" <% if(searcht.equals("name"))out.print("selected"); %> />�����ڸ�
			</select>
			<input type="text" name="searchv" value="<%= searchv %>" size="15" /> 
			<input type="submit" value="�˻�" />
		</td>
	</tr>
</table>
</form>
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
		<td class="tableSubject2">������ID</td>
		<td class="tableSubject2">�����ڸ�</td>
		<td class="tableSubject2">��û��¥</td>
		<td class="tableSubject2">�Ա�ó��</td>
	</tr>
<%
	// �� ��
	Vector<ReservationBean> cvrb = CommonAction.getInstance().selectReservation(syear+smonth+sdate,eyear+emonth+edate,card,bank,banksub,searcht,searchv,0,0);
	int count = cvrb.get(0).getRsno();	// �˻��� ����Ʈ �� �� ��ȯ

	if( currentPage < 1 )currentPage = 1;
	int pageSize = 12;								// �� �������� ������ ����Ʈ ��
	int startNum = ((currentPage-1) * pageSize)+1;	// ����¡�� ���� ���۰�
	int endNum = currentPage * pageSize;			// ����¡�� ���� ����
	// ����Ʈ
	Vector<ReservationBean> vrb = CommonAction.getInstance().selectReservation(syear+smonth+sdate,eyear+emonth+edate,card,bank,banksub,searcht,searchv,startNum,endNum);
/**
	count - �Ѱ���
	currentPage - ���� ������ ��
	targetPage - ���� ��������
	addPrameter - �������� �ѱ�°�
*/
	String addParmeter = "&syear="+syear+"&smonth="+smonth+"&sdate="+sdate+"&eyear="+eyear+"&emonth="+emonth+"&edate="+edate+"&card="+card+"&bank="+bank+"&banksub="+banksub+"&searcht="+searcht+"&searchv="+searchv;
	String targetPage = "reservationList.jsp";
	
	if( vrb == null ){
%>
	<tr>
		<td colspan="12" class="center1">[ ã���ô� ������ �����ϴ� ]</td>
	</tr>
<% 	}else{
		int listCount = count - (startNum-1);
		for( int i=0; i<vrb.size(); i++ ){
			ReservationBean rb = vrb.get(i);
%>
	<tr>
		<td><%= listCount-- %></td>
		<td><%= rb.getRoomname() %></td>
		<td><%= rb.getUsemen() %></td>
		<td><%= rb.getPrice() %></td>
		<td><%= rb.getPay_name() %></td>
		<td><%= rb.getPay_yn() %></td>
		<td><%= rb.getRes_date() %></td>
		<td><%= rb.getNight() %></td>
		<td><%= rb.getUserid() %></td>
		<td><%= rb.getUsername() %></td>
		<td><%= rb.getReg_date() %></td>
		<td>
			<% if( rb.getPay_yn().equals("N") ){ %>
				<input type="button" value="�ԱݿϷ�" onClick="javascript:if(confirm('����? �ԱݵȰ�??'))payOk(<%= rb.getRsno() %>);" />
			<% } %>
		</td>
	</tr>
<% 		}
	} %>
	<tr>
		<td colspan="12" class="tableSubject2">
			<%@ include file="../common/paging.jsp" %>
		</td>
	</tr>
</table>
<jsp:include page="foot.html" />