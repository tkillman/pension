<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*,clientmember.*,java.util.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String check = request.getParameter("check");
    String dong = request.getParameter("dong");
   
   LogonDBBean Zipcode = LogonDBBean.getInstance();
   Vector zipcodeList = Zipcode.zipcodeRead(dong);
   int totalList = zipcodeList.size(); 
%>
<html>
	<head><title>�����ȣ ã��</title>
	<script language="javascript">
		<!--
			function dongCheck(){
				if(document.zipForm.dong.value==""){
					alert("�� �̸��� �Է��ϼ���.");
					document.zipForm.dong.focus();
					return;
				}
				document.zipForm.submit();
			}

			function sendAddress(zipcode,sido,gugun,dong,ri){
				var address = sido+" "+gugun+" "+dong+" "+ri;
				//���� �и��ؼ� �θ� â�� �ֱ�
				opener.document.memberjoin.zip.value=zipcode;
				opener.document.memberjoin.addr1.value=address;
				self.close();
			}
		-->
	</script>
	<STYLE type="text/css" >
 <!--
    a:link {color:#282828; text-decoration:none;}
       a:hover {color:#1E821E; text-decoration:underline;}
 -->
  </STYLE>
	</head>
	<body>
		<center>
		<font size="5">�����ȣã��</font><p/>
		<form name="zipForm" method="post" action="zip.jsp">
			<center>ã������� �ּ��� ��(��/��) �̸��� �Է��ϼ���.<br>
						��) û��1��, �Ѱ��� 3��, ������</center><br>
			<center><input type="text" size="30" name="dong">&nbsp;<input type="button" value="�˻�" onclick= "dongCheck();"></center><br><br>
				
				�˻� ��� �� �ش� �ּҸ� Ŭ���Ͻø� �ڵ� �Էµ˴ϴ�.<p/>
			 <input type="hidden" name="check" value="n">
			<table width="600" border="1" bgcolor="yellowgreen">
				<tr>
					<td width="100">�����ȣ</td>
					<td width="500">�ּ�</td>
				</tr>
		</table>
		</form>
		<table>
		<%
			if(check.equals("n")){
		%>
		<%
				if(zipcodeList.isEmpty()){	
		%>
			
			<tr><td align="center"><br>�˻��� ����� �����ϴ�.</td></tr>
		<%	 } else { %>
		<tr><td>
		<%
			for(int i=0; i<totalList;i++){
				ZipcodeBean zipBean = (ZipcodeBean)zipcodeList.elementAt(i);
				String tempZipcode = zipBean.getZipcode();
				String tempSido = zipBean.getSido();
				String tempGugun = zipBean.getGugun();
				String tempDong = zipBean.getDong();
				String tempRi = zipBean.getRi();
		%>
			<a href="javascript:sendAddress('<%=tempZipcode%>','<%=tempSido%>','<%=tempGugun%>','<%=tempDong%>','<%=tempRi%>')">
				<%=tempZipcode%>&nbsp;<%=tempSido%><%=tempGugun%>&nbsp;<%=tempDong%>&nbsp;<%=tempRi%></a><br>
	<%
		}//for	
		}
	%>
	<%}%>
		</td></tr>
		<tr><td align="center"><br><a href="javascript:this.close();">�ݱ�</a></td></tr>
			</table>
			</center>
	</body>
</html>