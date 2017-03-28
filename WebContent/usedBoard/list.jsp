<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import="board.BoardDBBean"%>
<%@ page import="board.BoardDataBean"%>
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

<html>
    <head>
        <title>�Խ���</title>
        
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>

<body>
    <img src=".\img\head02.gif"><br>
       <center><img src=".\img\img02.gif">
    <br>

<%
    if (count == 0) {  // ��ϵ� ���� ���� ���
%>
    <table width="800" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                �Խ��ǿ� ����� ���� �����ϴ�.
            </td>
        </tr>
    </table>

<%  } else {     // ��ϵ� ���� �ִ� ���%> 
    <table border="1" width="800" cellpadding="0" cellspacing="0" align="center">
	    
		
        <tr height="30" bgcolor="black">
            <td align="center"  width="25" ><font color="white" face="HY����M" size="3">�� ȣ</td>
            <td align="center"  width="250" ><font color="white" face="HY����M" size="3">��   ��</td>
            <td align="center"  width="100" ><font color="white" face="HY����M" size="3">�ۼ���</td>
            <td align="center"  width="150" ><font color="white" face="HY����M" size="3">�ۼ���</td>
            <td align="center"  width="50" ><font color="white" face="HY����M" size="3">�� ȸ</td>
           
        </tr>
<% 
    for (int i = 0 ; i < articleList.size() ; i++) {
        BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
        <tr height="30">
            <td align="center"  width="50"> <%=number--%></td>
            <td  width="250" >
<%
    int wid=0;  // �鿩���� ����(������ ����)
    if(article.getRe_level()>0){
        wid=5*(article.getRe_level());
%>
        <img src="images/level.gif" width="<%=wid%>" height="16">
        <img src="./img/ioc-reply.gif"">
<%}else{%>
        <img src="images/level.gif" width="<%=wid%>" height="16">
<%}%>
        <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>&sstring=a">
        <%=article.getSubject()%></a>
<% if(article.getReadcount()>=20){%>
        <img src="./img/11.bmp" border="0"  height="16"><%}%> </td>
            <td align="center"  width="100">
            <a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
            <td align="center"  width="150"><%= sdf.format(article.getReg_date())%></td>
            <td align="center"  width="50"><%=article.getReadcount()%></td>
        </tr>
<%}%>
	</table>
<%}%>
	
<table border="0" width="800">	
<tr>
<td><a href="wirteForm.jsp"><img src=".\img\btn_write.gif" border="0"></a></td>
</tr>
</table>
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
<form method="post" name="inform" action="searchList.jsp" >
<table>
<input type="hidden" name="flag" value="search">
<tr>
<td><select name="gubun">
    <option value="subject"> ��    ��</option>
    <option value="content">��    ��</option>
    <option value="writer">�ۼ���</option>
</select>
<td><input type="text" name="sstring" size=30></td>
<td><input type="image" src="./img/btn_search.gif"></td>
</table>
</form> 
</center>
</body>
</html>

