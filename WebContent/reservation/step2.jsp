<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="reservation.RoomBean" %>
<%@ page import="reservation.PensionData" %>
<%@ page import="java.text.NumberFormat" %>
<%
	String id = null;
	try{
		id = session.getAttribute("memId").toString();
	}catch(NullPointerException e){
%>
	<script language="javascript">
		alert("������ ȸ���� �����մϴ�!");
		location.href="../servlet/reservation.Reservation";
	</script>
<%
	}
	
	request.setCharacterEncoding("euc-kr");
	
	NumberFormat nf = NumberFormat.getInstance();

	PensionData pension = (PensionData)request.getAttribute("pension");
	RoomBean room = (RoomBean)request.getAttribute("room");
	RoomBean date1 = (RoomBean)request.getAttribute("date1");
	int maxMen = room.getMen();
	int maxRange = (int)(Integer)request.getAttribute("maxRange");
	int[] price = (int[])request.getAttribute("roomPrice");
	String[] days = (String[])request.getAttribute("days");
	
	String chooseDate = request.getParameter("chooseDate").toString();
%>
<html>
	<head>
		<title>��ǿ��� ���� ��</title>
		<script language="javascript">
			function number_format(numstr) {
				var numstr = String(numstr);
				var re0 = /(\d+)(\d{3})($|\..*)/;
				if (re0.test(numstr)) 
					return numstr.replace( 
					  re0, 
					  function(str,p1,p2,p3) { return number_format(p1) + "," + p2 + p3; } 
					); 
				else 
					return numstr; 
			}

			function calculateMoney(){
				var payMoney = 0;
				var price = new Array(<% for(int i=0; i<price.length; i++){ out.print(price[i]+","); } out.print("0"); %>);
				var addManPrice = <%= room.getAddman() %>;
				var cNight = document.resForm.cNight.value;
				var addMan = document.resForm.men.value;
				for( var i=0; i<cNight; i++ ){
					payMoney += price[i];
				};
				for( var i=0; i<addMan; i++ ){
					payMoney += addManPrice;
				}
				document.resForm.payAll.value = payMoney;
				document.getElementById("allMondy").innerHTML=number_format(payMoney)+"��";
			}

			function viewCard(){
				document.getElementById('bank').style.display="none";
				document.getElementById('card').style.display="block";
			}
			function viewBank(){
				document.getElementById('card').style.display="none";
				document.getElementById('bank').style.display="block";
			}

			// ���â����Ŀ��ó��
			function alertAndFocus(v,str){
				alert(str);
				v.focus();
			}

			function payCard(form){
				form.payment.value="card";
				if( form.payAll.value == "" ){
					alert("�����κп� ������ �߻��Ͽ����ϴ�!\n\n�ٽ� ��û�ϼ���!");
					history.back(-1);
					return;
				}
				if( form.cardName.value == "" ){
					alertAndFocus(form.cardName,"ī���̸��� ��������!");
					return;
				}
				if( form.cardNumber.value == "" ){
					alertAndFocus(form.cardNumber,"ī���ȣ�� ��������!");
					return;
				}
				if( form.cardPasswd.value == "" ){
					alertAndFocus(form.cardPasswd,"ī���й�ȣ�� ��������!");
					return;
				}
				if( confirm("������ ī�� ������ �Ͻðڽ��ϱ�?") ){
					form.submit();
				}
			}

			function payBank(form){
				form.payment.value="bank";
				if( confirm("������ ������ü(�������)�� ��û�Ͻðڽ��ϱ�?") ){
					form.submit();
				}
			}
		</script>
	</head>
	<body onLoad="calculateMoney()">
		<form name="resForm" method="post" action="reservation.Reservation" onSubmit="return chkReservation(this)">
			<input type="hidden" name="step" value="three" />
			<input type="hidden" name="chooseDate" value="<%= chooseDate %>" />
			<input type="hidden" name="payment" value="" />
			<input type="hidden" name="roomnumber" value="<%= room.getRno() %>" />
			<input type="hidden" name="roomname" value="<%= room.getRname() %>" />
			<input type="hidden" name="payAll" value="" />
			<input type="hidden" name="id" value="<%= id %>" />
			<table border="1" width="500"> 
				<tr>
					<td colspan="2">���� ���� �����ϱ�</td>
				</tr>
				<tr>
					<td width="100">����</td>
					<td><%= room.getRname() %></td>
				</tr>
				<tr>
					<td>��������</td>
					<td><%= chooseDate.substring(0,4)+"�� "+chooseDate.substring(4,6)+"�� "+chooseDate.substring(6,8)+"�� "+days[0]+"����" %></td>
				</tr>
				<tr>
					<td>�����ϼ�</td>
					<td>
						<select name="cNight" onChange="calculateMoney()">
						<% for(int i=1; i<maxRange+1 ; i++){ %>
							<option value="<%= i %>" /><% out.print(i+"�� "+(i+1)+"�� "); out.print(days[i-1]+"���� +"); out.print(nf.format(price[i-1])+"��"); %>
						<% } %>
						</select>
						<br />
						��������� <%= nf.format(room.getWeekday()) %>�� �߰�<br />
						������ָ� <%= nf.format(room.getWeekend()) %>�� �߰�<br />
						���������� <%= nf.format(room.getSweekday()) %>�� �߰�<br />
						�������ָ� <%= nf.format(room.getSweekend()) %>�� �߰�
					</td>
				</tr>
				<tr>
					<td>�ο��߰�</td>
					<td>
						<select name="men" onChange="calculateMoney()">
							<option value="0" />�⺻2��
						<% for(int i=1; i<maxMen-1 ; i++){ %>
							<option value="<%= i %>" /><%= i %>��
						<% } %>
						</select>�߰� (�Ѹ� �߰��� <%= nf.format(room.getAddman()) %>�� �߰�)
					</td>
				</tr>
				<tr>
					<td>�� �����ݾ�</td>
					<td><b id="allMondy"></b></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="ī�����" onClick="viewCard()" />
						<input type="button" value="������ü" onClick="viewBank()" />
					</td>
				</tr>
			</table>
			<!-- ī����� -->
			<table id="card" border="1" width="500" style="display:none">
				<tr>
					<td colspan="2">ī�� �Ƚ� ����</td>
				</tr>
				<tr>
					<td width="100">ī���̸�</td>
					<td><input type="text" size="30" name="cardName" /></td>
				</tr>
				<tr>
					<td>ī���ȣ</td>
					<td><input type="text" size="30" name="cardNumber" /></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" size="30" name="cardPasswd" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="�����ϱ�" onClick="payCard(this.form)" /></td>
				</tr>
			</table>
			<!-- ������ü -->
			<table id="bank" border="1" width="500" style="display:none">
				<tr>
					<td colspan="2">������ü(�������)</td>
				</tr>
				<tr>
					<td width="100">�����</td>
					<td width="400"><%= pension.getBankname() %></td>
				</tr>
				<tr>
					<td>���¹�ȣ</td>
					<td><%= pension.getBanknumber() %></td>
				</tr>
				<tr>
					<td>������</td>
					<td><%= pension.getBankuser() %></td>
				</tr>
				<tr>
					<td colspan="2">�Աݽ�û �� 24�ð����� �Ա��� Ȯ�ε��� �����ÿ��� <br />�ڵ����� ��ҵ˴ϴ�.</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="�Աݽ�û" onClick="payBank(this.form)" /></td>
				</tr>
			</table>
		</form>
	</body>
</html>
