<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "common.LoginDBbean" %>

<% request.setCharacterEncoding("euc-kr");%>

<%
    String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
	
	LoginDBbean manager = LoginDBbean.getInstance();
    int check = manager.userCheck(id,passwd);

	if(check==1){
		session.setAttribute("ultraId",id);
		response.sendRedirect("index.jsp");
	}else if(check==0){%>
	<script> 
	  alert("��й�ȣ�� ���� �ʽ��ϴ�.");
      history.go(-1);
	</script>
<%	}else{ %>
	<script>
	  alert("���̵� ���� �ʽ��ϴ�..");
	  history.go(-1);
	</script>
<%}	%>