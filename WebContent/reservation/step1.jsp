<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="reservation.PensionData" %>
<%@ page import="reservation.RoomBean" %>
<%@ page import="reservation.ReservationBean" %>
<% 
	request.setCharacterEncoding("euc-kr");
	
	Vector<RoomBean> room = (Vector<RoomBean>)request.getAttribute("room");
	Vector<ReservationBean> reservation = (Vector<ReservationBean>)request.getAttribute("reservation");
	Vector<String> resDate = (Vector<String>)request.getAttribute("resDate");
	PensionData pension = (PensionData)request.getAttribute("pension");
	
	String[] sSeason = pension.getSseason().split("-");
	String[] eSeason = pension.getEseason().split("-");
	for( int i=0; i<2 ; i++ )
		sSeason[0] = (Integer.parseInt(sSeason[0]) < 10) ? "0"+Integer.parseInt(sSeason[0]) : sSeason[0] ;
	for( int i=0; i<2 ; i++ )
		eSeason[0] = (Integer.parseInt(eSeason[0]) < 10) ? "0"+Integer.parseInt(eSeason[0]) : eSeason[0] ;
		
	int sSea = Integer.parseInt(sSeason[0]+sSeason[1]);
	int eSea = Integer.parseInt(eSeason[0]+eSeason[1]);
/*
	if( room != null ){
		for(int i=0; i<room.size();i++){
			out.print(room.get(i).getRno()+" ");
			out.print(room.get(i).getRname()+" ");
			out.print(room.get(i).getRsize()+" ");
			out.print(room.get(i).getMen()+" ");
			out.print(room.get(i).getAddman()+" ");
			out.print(room.get(i).getWeekday()+" ");
			out.print(room.get(i).getWeekend()+" ");
			out.print(room.get(i).getSweekday()+" ");
			out.print(room.get(i).getSweekend()+"<br />");
		}
	}
	out.print("<hr />");
	if(reservation != null){
		for(int i=0; i<reservation.size();i++){
			out.print(reservation.get(i).getRsno()+" ");
			out.print(reservation.get(i).getRno()+" ");
			out.print(reservation.get(i).getUno()+" ");
			out.print(reservation.get(i).getRes_date()+" ");
			out.print(reservation.get(i).getNight()+" ");
			out.print(reservation.get(i).getUsemen()+" ");
			out.print(reservation.get(i).getPrice()+" ");
			out.print(reservation.get(i).getPayment()+" ");
			out.print(reservation.get(i).getPay_number()+" ");
			out.print(reservation.get(i).getPay_yn()+" ");
			out.print(reservation.get(i).getReg_date()+"<br />");
		}
	}
	*/
	// DB���� �Ѿ�� ���೯¥�� �Ⱓ�� ó���ϱ� ���� ��ó��(��¥�� �����ͷ� �迭ó��)
//	if( resDate != null )
//	for(int i=0; i < resDate.size(); i+=4){
//		out.print(resDate.get(i)+" "+resDate.get(i+1)+" "+resDate.get(i+2)+" "+resDate.get(i+3)+"<br />");
//	}
	
	// ���� ��¥ ���
	Calendar now = Calendar.getInstance();
	int nowYear = now.get(Calendar.YEAR);			// ���� ��
	int nowMonth = now.get(Calendar.MONTH)+1;		// ���� ��
	int nowDate = now.get(Calendar.DATE);			// ���� ��
//	out.print(nowYear+"�� "+nowMonth+"�� "+nowDate+"��");
	
//	out.print("<hr />");
//	out.print("<br />");
//	out.print(request.getAttribute("year")+"/"+request.getAttribute("month"));
	
	String[] day = {"��","��","ȭ","��","��","��","��"};
	int year = Integer.parseInt(request.getAttribute("year").toString());
	int month = Integer.parseInt(request.getAttribute("month").toString());
//	out.print(year+"/"+month);

	// ������ ���� ������
	now.set(year,month-1,1);
	now.add(Calendar.MONTH,-1);
	int laterYear = now.get(Calendar.YEAR);
	int laterMonth = now.get(Calendar.MONTH)+1;
	
	// ������ ���� ������
	now.set(year,month-1,1);
	now.add(Calendar.MONTH,1);
	int nextYear = now.get(Calendar.YEAR);
	int nextMonth = now.get(Calendar.MONTH)+1;
	
	// �޷��� �����ֱ� ���� ��ó�� �۾�
	Calendar cal = Calendar.getInstance();
	cal.set(year, month-1, 1);
	int firstWeekday = cal.get(Calendar.DAY_OF_WEEK);	// ���ÿ��� 1�Ͽ� �ش��ϴ� ����
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);	// ���� ���� ������ ��¥
//	out.print("�̹��� : "+toYear+" "+(toMonth+1)+" "+firstWeekday+" "+lastDay);	// Ȯ��  ��/��/ù�����ϰ� 1~7
	int chkNowDate = month == nowMonth ? nowDate : 0 ;
	if( (year*100)+month == (nowYear*100)+nowMonth ) chkNowDate = nowDate;
	else if( (year*100)+month < (nowYear*100)+nowMonth ) chkNowDate = 32;
	else chkNowDate = 0;
	int count = 1;
	String usedRoom = null;
	String cLinkF = "";
	String cLinkB = "";
	
%>
<html>
	<head>
		<title>��ǿ���</title>
		<style type="text/css" lang="stylesheet">
		<!--
			td.center {width:110px;height:30px; text-align:center;}
			td.topLeft {width:110px;height:100px; vertical-align:top; padding:5px 5px 5px 5px;}
			
			#calTitle {font-size:20px;font-weight:bold;}
			#link {font-weight:normal;cursor:hand;}
			#noLink {font-weight:normal;}
			#days {font-weight:bold;}
			#state1 {font-size:11px;}
			#state2 {font-size:11px;}
			#heart {font-size:12px;color:limegreen;padding-right:2px;}
		-->
		</style>
		<script language="javascript">
			// ��¥�� ���� ����
			function chooseRoom(cDate,rno){
			//	document.getElementById("aa").innerHTML=cDate;
				var month = <%= month %>;
				month = (month < 10) ? "0"+month : month;
				var date = (cDate < 10) ? "0"+cDate : cDate;
				document.step2Form.chooseDate.value = <%= year %>+month+date;
				document.step2Form.chooseRno.value = rno;
				document.step2Form.submit();
			}
			// ���â����Ŀ��ó��
			function alertAndFocus(v,str){
				alert(str);
				v.focus();
			}
			// �������� ���� �Ǳ��� üũ
			function chkReservation(form){
				if(form.roomNo.value == ""){
					alertAndFocus(form.roomNo,"������ �����ϼ���!");
					return false;
				}
				return true;
			}
		</script>
	</head>
	<body>
		<form name="step2Form" method="post" action="reservation.Reservation">
			<input type="hidden" name="step" value="two" />
			<input type="hidden" name="chooseDate" />
			<input type="hidden" name="chooseRno" />
		</form>
		<table border="1" width="770">
			<tr>
				<td colspan="7">
					<%= "������ - "+nowYear+"�� "+nowMonth+"�� "+nowDate+"��" %>
					<center id="calTitle">
						<a href="reservation.Reservation?y=<%= laterYear %>&m=<%= laterMonth %>">��</a>
						 <%= year+"�� "+month+"��" %> 
						<a href="reservation.Reservation?y=<%= nextYear %>&m=<%= nextMonth %>">��</a>
					</center>
				</td>
			</tr>
			<tr>
			<%	for( int i=0; i<day.length ; i++ ){ // �Ͽ�ȭ������� ��� for��	%>
				<td class="center" <% if( i == 0 ){out.print("bgcolor='tomato'");}else if( i == 6 ){out.print("bgcolor='skyblue'");}else{out.print("bgcolor='tan'");} %>>
					<%= day[i] %>
				</td>
			<%	}	%>
			</tr>
			<%	while( true ){	%>
				<tr>
				<%	for( int i=0; i<7 ; i++ ){		// ��¥ ���
						if( i<firstWeekday-1 && count == 1 ){ out.print("<td>&nbsp;</td>"); continue; } 
						if( count > lastDay ){out.print("<td>&nbsp;</td>");}else{ %>
							<td class="topLeft" <% if( i == 0 ){out.print("bgcolor='tomato'");}else if( i == 6 ){out.print("bgcolor='skyblue'");} %>>
								<div id="days"><%= count++ %></div>
								<div id="state1">
									<%
										int sChkDate = Integer.parseInt(month+""+(((count-1) < 10) ? "0"+(count-1) : (count-1)));
										if( sChkDate >= sSea && sChkDate <= eSea ) out.print("<b>������</b>");
										else out.print("�����");
									%>
								</div>
								<br />
								<div id="state2">
								<%if( count > chkNowDate )
									if( room != null )
										for( int j=0; j<room.size();j++ ){	// �氹�� ��ŭ ����
											String thisDate = (room.get(j).getRno()+"-"+year+"-"+(month < 10 ? "0"+month : month)+"-"+((count-1) < 10 ? "0"+(count-1) : (count-1))).toString();
											if( resDate != null ){
												for( int k=0; k < resDate.size(); k+=4 ){	// ���೯¥ ��ŭ ����
													if( resDate.get(k).equals(thisDate) ){
														cLinkF = "<b id='noLink' title='������\n"+resDate.get(k+2)+"\n"+resDate.get(k+3)+"'>";
														cLinkB = "</b>";
														if( resDate.get(k+1).equals("Y") ){
															usedRoom = "<font color='red'>(�Ϸ�)</font>"; break;
														}else{
															usedRoom = "<font color='green'>(���)</font>"; break;
														}
													}else{
														usedRoom = "<font color='blue'>(��û)</font>";
														cLinkF = "<b id='link' onClick='javascript:chooseRoom("+(count-1)+","+room.get(j).getRno()+")'>";
														cLinkB = "</b>";
													}
													//out.print(resDate.get(k)+"/"+thisDate);
												}
											}else{
												usedRoom = "<font color='blue'>(��û)</font>";
												cLinkF = "<b id='link' onClick='javascript:chooseRoom("+(count-1)+","+room.get(j).getRno()+")'>";
												cLinkB = "</b>";
											}
									%>
											<font id="heart">��</font><%= cLinkF+room.get(j).getRname()+usedRoom+cLinkB %>
											<br />
									<%
										}
									%>
								</div>
							</td>
				<% 		
						}
					}
				%>
				</tr>
			<%	
				if( count > lastDay ) break;	// while �� ����
			}
			%>
		</table>
	</body>
</html>