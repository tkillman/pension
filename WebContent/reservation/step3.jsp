<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String str = "";
	if( request.getAttribute("insertResult") == null ){
		str = "�̹� ����� �����Դϴ�. �ٽ� Ȯ���Ͻð� ��û�ϼ���!";
	}else{
		int result = (Integer)request.getAttribute("insertResult");
		if( result == 1 ){
			str = "���������� �Է��� �Ϸ� �Ǿ����ϴ�.";
		}else{
			str = "���� ����-������ ����ڰ� �����ϴ�. ����� �ٽ� �õ��ϼ���!";
		}
	}
%>
<center>
<%= str %>
</center>