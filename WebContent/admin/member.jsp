<jsp:include page="head.jsp" />
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.Vector"
    import="common.MemberBean"
    import="common.CommonAction"
%>
<%	
	request.setCharacterEncoding("euc-kr");
	String searcht = request.getParameter("searcht") == null ? "":request.getParameter("searcht");
	String searchv = request.getParameter("searchv") == null ? "":request.getParameter("searchv");

	// �� ��
	Vector<MemberBean> cvmb = CommonAction.getInstance().selectMember(searcht,searchv,0,0);
	int count = cvmb.get(0).getMno();	// �˻��� ����Ʈ �� �� ��ȯ
	int currentPage = Integer.parseInt(request.getParameter("currentPage")==null?"1":request.getParameter("currentPage"));
	if( currentPage < 1 )currentPage = 1;
	int pageSize = 12;								// �� �������� ������ ����Ʈ ��
	int startNum = ((currentPage-1) * pageSize)+1;	// ����¡�� ���� ���۰�
	int endNum = currentPage * pageSize;			// ����¡�� ���� ����
	// ����Ʈ
	Vector<MemberBean> vmb = CommonAction.getInstance().selectMember(searcht,searchv,startNum,endNum);
/**
	count - �Ѱ���
	currentPage - ���� ������ ��
	targetPage - ���� ��������
	addPrameter - �������� �ѱ�°�
*/
	String addParmeter = "&searcht="+searcht+"&searchv="+searchv;
	String targetPage = "member.jsp";
%>
<form method="post" action="member.jsp">
<table border="1">
	<tr>
		<th colspan="2" class="tableSubject1">ȸ������Ʈ</th>
	</tr>
	<tr>
		<td class="tableSubject2">�Ϲݰ˻�</td>
		<td>
			<select name="searcht">
				<option value="" <% if(searcht.equals("")) out.print("selected"); %> />::�˻� Ÿ��Ʋ::
				<option value="name" <% if(searcht.equals("name")) out.print("selected"); %> />�̸�
				<option value="addr1" <% if(searcht.equals("addr1")) out.print("selected"); %> />�ּ�
				<option value="email" <% if(searcht.equals("email")) out.print("selected"); %> />�̸���
			</select> 
			<input type="text" name="searchv" /> 
			<input type="submit" value="�˻�" />
		</td>
	</tr>
</table>
</form>
<p />
<table border="1">
	<tr>
		<td class="tableSubject2">��ȣ</td>
		<td class="tableSubject2">���̵�</td>
		<td class="tableSubject2">�̸�</td>
		<td class="tableSubject2">�̸���</td>
		<td class="tableSubject2">���ſ���</td>
		<td class="tableSubject2">����ȭ</td>
		<td class="tableSubject2">�޴���</td>
		<td class="tableSubject2">������</td>
	</tr>
<%
	if( vmb == null ){
%>
	<tr>
		<td colspan="8" class="center1">[ ã���ô� ������ �����ϴ� ]</td>
	</tr>
<%
	}else
	for( int i=0; i<vmb.size() ; i++ ){
		MemberBean mb = vmb.get(i);
%>
	<tr>
		<td><%= vmb.size()-i %></td>
		<td><%= mb.getId() %></td>
		<td><%= mb.getName() %></td>
		<td><%= mb.getEmail() %></td>
		<td><%= mb.getRecv_yn() %></td>
		<td><%= mb.getPhone1()+"-"+mb.getPhone2()+""+mb.getPhone3() %></td>
		<td><%= mb.getCell1()+"-"+mb.getCell2()+"-"+mb.getCell3() %></td>
		<td><%= mb.getReg_date() %></td>
	</tr>
<% 	} %>
	<tr>
		<td colspan="8" class="tableSubject2">
			<%@ include file="../common/paging.jsp" %>
		</td>
	</tr>
</table>
<jsp:include page="foot.html" />