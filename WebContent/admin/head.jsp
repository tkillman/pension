<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%
	String checkAdmin = "";
	try{
		checkAdmin = session.getAttribute("ultraId").toString();
	}catch(NullPointerException e){
		checkAdmin = "";
	}finally{
		if( !checkAdmin.equals("admin") ){
%>
		<script language='javascript'>
			location.href='/pension/servlet/reservation.Reservation';
		</script>
<%
		}
	}
%>
<html>
	<head>
		<title>��� ������ ���</title>
		<link rel="stylesheet" type="text/css" href="./css/admin.css" />
	</head>
	<body>
		<table border="1">
			<tr>
				<th class="tableSubject1">��� ������ �Դϴ�.</th>
			</tr>
			<tr>
				<td class="tableSubject2">&nbsp;&nbsp;
					<a href="logout.jsp">�α� �ƿ�</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="common.jsp">��ǰ���</a> &nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="member.jsp">ȸ������</a> &nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="room.jsp">���ǰ���</a> &nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="reservationList.jsp">����Ȯ��</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="../index.jsp">����� ȭ������..</a>
				</td>
			</tr>
		</table>
		<hr />