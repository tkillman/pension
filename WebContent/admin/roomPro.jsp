<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="common.CommonAction"
%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="room" class="reservation.RoomBean">
	<jsp:setProperty name="room" property="*" />
</jsp:useBean>
<%
	CommonAction action = CommonAction.getInstance();
	String type = request.getParameter("type");
	String rname = null;
	if( type.equals("add") || type.equals("reset") ){
		rname = new String(request.getParameter("rname").getBytes("8859_1"),"euc-kr");
		room.setRname(rname);
	}
	
	if( type.equals("add") ){	// �߰�
		action.insertRoom(room);
	}else if( type.equals("reset") ){	// ����
		action.updateRoom(room);
	}else if( type.equals("del") ){	// ����
		action.deleteRoom(room);
	}
%>
<script language="javascript">
	location.href="room.jsp";
</script>