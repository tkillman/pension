<%@ page pageEncoding="EUC-KR" %>
<!-- paging -->
<%
	/** 
		count - �Ѱ���
		pageSize - ���������� ������ ����Ʈ ����
		pageBlock - ȭ�鿡 ������ ��������(�ϴܿ� [1][2]...)
		currentPage - ���� ������ ��
		targetPage - ����� ��������
		addParmeter - �������� �߰��� �ѱ�� ��
	*/
	/* int pageBlock = 5;
	int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1 );
	int startPage = currentPage / (pageBlock + 1) +1 ;
	if( startPage > 1 ){
		startPage = ((startPage-1) * pageBlock)+1;
	}
	int endPage = startPage + pageBlock - 1;
	if( endPage > pageCount ) endPage = pageCount;
	
	if( startPage > pageBlock ){ */
%>
	<%-- <a href="<%= targetPage %>?currentPage=<%= (startPage - 1)+addParmeter %>">[back]</a> --%>
<%
	/* } */
	/* for( int i=startPage; i<=endPage; i++ ){ */
%>
	<%-- <a href="<%= targetPage %>?currentPage=<%= i+addParmeter %>">[<%= i %>]</a> --%>
<%
	/* }
	if( endPage < pageCount ){ */
%>
	<%-- <a href="<%= targetPage %>?currentPage=<%= (endPage + 1)+addParmeter %>">[front]</a> --%>
<%
	/* } */
%> 
<!-- /paging -->