<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<html>
<head>
	<title>���� ���� õ������ �޽İ���</title>

	<script language="javascript" src="script.js">

	</script>
</head>

<body>
	<img src="../project_img\img\photogelleryhead.gif"><p> 
	<div align="center"><img src="../project_img\img\photogallery.gif" align="center"></div>
	
<form name="regform" enctype="multipart/form-data" method="post" action="PhotoGalleryPro.jsp" onsubmit="return checIt()">
			<center><table class="ba3" cellpadding="10" cellspacing="0" border="1" width="800" frame="hsides">
				<tr>
					<td colspan="2"><center><b><font size="4" face="�޸�����ü"> ��/��/��/��</font></b></center></td>
				</tr>
			</table>	
			<center><table width="800" frame="below" rules="none" scellpadding="10" cellspacing="10" border="1">	
				<tr>
 					<td align=right width="150"><font size="4" face="�޸�����ü">Name</font></td>
					<td align=left><input type="text" name="name" size="20" maxlength="20"></td>
				</tr>

				<tr>
					<td align=right><font size="4" face="�޸�����ü">Password</font></td>
					<td align=left><input type="password" name="passwd" size=21 maxlength="20"></td>
				</tr>
   
				<tr>
					<td align=right><font size="4" face="�޸�����ü">E-mail</font></td>
					<td align=left><input name="email" type="text" size="40" maxlength="64"></td>
				</tr>
				
				<tr>
					<td align=right><font size="4" face="�޸�����ü">Homepage</font></td>
					<td align=left><input name="homepage" type="text" size="40" maxlength="64"></td>
				</tr>
				
				<tr>
					<td align=right><font size="4" face="�޸�����ü">Title</font></td>
					<td align=left><input name="title" type="text" size="60" maxlength="64">
					</td>
				</tr>
				
				<tr>
					<td align=right><font size="4" face="�޸�����ü">Contents</font></td>
					<td align=left><textarea name="content" cols="70" rows="16"></textarea></td>
				</tr>
				
				<tr>
					<td align=right><font size="4" face="�޸�����ü">Image</font></td>
					<td align=left><input type="file" name="uploadfile" size="45"><font size="4" face="�޸�����ü">&nbsp;*5MB����</font></td>
				</tr>
			</table></center> <p>
			<table>
	 <center><input type="image" src="../project_img\img\ok1.jpg" border="0"></a>&nbsp;&nbsp;
	 <a href="PhotoGalleryMain.jsp"><img src="../project_img\img\see1.jpg" border="0"></a>&nbsp;&nbsp;
	 <a href="PhotoGalleryMain.jsp"><img src="../project_img\img\index1.jpg" border="0"></a>
	</center>
			</table>
 </form>
</body>
</html>