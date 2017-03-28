<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import="board.BoardDBBean" %>
<%@ page import="board.BoardDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%!
    int pageSize = 10;  // �� �������� ��Ÿ�� �� ��
    SimpleDateFormat sdf =
    new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {//������ ��ȣ�� �μ��� �Ѿ���� ������ 1�� ���
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;  //�� �������� ������ ����
    // 2�������� ���
    // (2-1)*10 + 1 = 11
    int endRow = currentPage * pageSize; // �� �������� ���� ����
    // 2�������� ���
    //  2+10 = 20
    int count = 0;    // ��ü �� ��
    int number=0;   // �� ���������� ������ ��ȣ

    List articleList = null;
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleCount();
    if (count > 0) {
    //    articleList = dbPro.getArticles(startRow, pageSize);
        articleList = dbPro.getArticles(startRow, endRow);
    }

    number=count-(currentPage-1)*pageSize;//�� ���������� ���� �� ��ȣ
    // ��ü 52���� ���� ��� 2������ ���� �� ��ȣ
    //    52 - (2-1)*10 = 42
%>

<%@page import="board.BoardDBBean"%>
<%@page import="board.BoardDataBean"%><html>
    <head>
        <title>�Խ���</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>

<body bgcolor="green">
    <center><b>�۸��(��ü ��:<%=count%>)</b>
    <table width="700">
        <tr>
            <td align="right" bgcolor="green">
                <a href="writeForm.jsp">�۾���</a>
            </td>
        </tr>
    </table>

<%
    if (count == 0) {  // ��ϵ� ���� ���� ���
%>
    <table width="700" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                �Խ��ǿ� ����� ���� �����ϴ�.
            </td>
        </tr>
    </table>

<%  } else {    %>  // ��ϵ� ���� �ִ� ���
    <table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
        <tr height="30" bgcolor="green">
            <td align="center"  width="50"  >�� ȣ</td>
            <td align="center"  width="250" >��   ��</td>
            <td align="center"  width="100" >�ۼ���</td>
            <td align="center"  width="150" >�ۼ���</td>
            <td align="center"  width="50" >�� ȸ</td>
            <td align="center"  width="100" >IP</td>   
        </tr>
<% 
    for (int i = 0 ; i < articleList.size() ; i++) {
        BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
<%}%>
    </table>
<%}%>

<%
    if (count > 0) {  // ��ϵ� ���� �ִ� ���
    int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
    // �������� �� ���
    //  5 + 1 = 6(��ϵ� ���� 52���� ���)
    // 5 + 0 = 5 (��ϵ� ���� 50���� ���)     
    int startPage = (int)(currentPage/10)*10+1;
    int pageBlock=10;
    // ���� ������ ��ȣ
    // (int)15/10 * 10 + 1= 11(15�������� ���)
    int endPage = startPage + pageBlock-1;
    //
    if (endPage > pageCount) endPage = pageCount;

        if (startPage > 10) {    %>
            <a href="list.jsp?pageNum=<%= startPage - 10 %>">[����]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
            <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
            <a href="list.jsp?pageNum=<%= startPage + 10 %>">[����]</a>
<%
        }
    }
%>
        </center>
    </body>
</html>