function memberReg(){
	document.location="MemberJoin.jsp";
}

//�������� ������ �� Ŀ���� idĭ�� ��ġ�ϵ���
function idfocus(){
	window.document.memberjoin.id.focus();
}

// ���̵� �ߺ� Ȯ��
function openConfirmid(mfrm){
		if(mfrm.id.value==""){
		alert("id�� �ʼ��Է»����Դϵ�.");
		mfrm.id.focus();
		return false;
	}
	url="confirmId.jsp?id=" + mfrm.id.value;
	
	open(url,"confirm","toolbar=no, location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=300,height=200");

}

// �ֹι�ȣ ���ڸ� �� ���� �� ���� ĭ���� �̵�
function moveJumin(mfrm){
	if(mfrm.jumin1.value.length==6){
		mfrm.jumin2.focus();
	}
}

// �ֹι�ȣ �ߺ� Ȯ��
function openConfirmJumin(mfrm){
	if(mfrm.jumin1.value=="" && mfrm.jumin2.value==""){
		alert("�ֹε�Ϲ�ȣ�� �ʼ��Է»����̶��!");
		mfrm.jumin1.focus();
		return false;
	}
	
	url="confirmJumin.jsp?jumin1=" + mfrm.jumin1.value + "&jumin2=" + mfrm.jumin2.value;
	open(url,"confirm","toolbar=no, location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=300,height=200");

}

// �̸��� �ߺ� Ȯ��
function openConfirmEmail(mfrm){
	if(mfrm.email.value==""){
		alert("�̸����� �ʼ��Է»�����");
		mfrm.email.focus();
		return false;
	}
	url="confirmEmail.jsp?email=" + mfrm.email.value;
	open(url,"confirm","toolbar=no, location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=300,height=200");

}

// �����ȣ ã��
function findZip(){
	url="zip.jsp?check=y";
	window.open(url,"zip","toolbar=no, width=700, height=500, directories=no, status=yes, scrollbars=yes, menubar=no");
}

function validMember(mfrm){
	if(mfrm.id.value==""){
		alert("���̵�� �ʼ��Է»����Դϵ�.");
		mfrm.id.focus();
		return false;
	}
	

	/*var ptn = new RegExp('[^a-zA-Z0-9]'); //���Խ��� �̿��� ����, �������� ����ϴ� ����

	if( ptn.test(mfrm.id.value) ) {
	  alert("����, ������ �Է��� �����ϴ�.. �ٽ� �Է��ض�.");
	  mfrm.id.value = "";
	  mfrm.id.value();
	  return;
	}*/

	

	if(mfrm.id.value.length<4 || mfrm.id.value.length>12){
		alert("id�� 4~12���Դϴ�.");
		mfrm.id.focus();
		return false;
	}

	if(mfrm.passwd.value=="" || mfrm.passwd2.value==""){
		alert("��й�ȣ�� �ʼ��Է»����ӵ�.");
		mfrm.passwd.focus();
		return false;
	}


	 /*var str = mfrm.member_name.value;
	 r0=/[A-z]/gi;
	 r1=/[0-9]/gi;
	 t0=str.search(r0);
	 t1=str.search(r1);
	 if(t0!=-1&&t1!=-1){
	  alert('ȥ��');
	 } else {
	  alert('�� ȥ��');
	 }*/

	if(mfrm.passwd.value != mfrm.passwd2.value){
		alert("��й�ȣ�� ���ƾ���!");
		mfrm.passwd.value="";
		mfrm.passwd2.value="";
		mfrm.passwd.focus();
		return false;
	}
	
	if(mfrm.name.value==""){
		alert("�̸��� �ʼ��Է»����Դϵ�.");
		mfrm.name.focus();
		return false;
	}

	
	/*var jumin1=mfrm.jumin1.value;
	var jumin2=mfrm.jumin2.value;
	var jumin=jumin1+jumin2;
	var index="234567892345";
	var total=0;
	for(var i=0;i<12;i++)
		total+=parseInt(jumin.charAt(i)*index.charAt(i));

	total=11-total%11;
	if(total==10)
		total=0;
	else if(total==11)
		total=1;

	if(total!=jumin.charAt(13))
	{
		alert("�ֹι�ȣ�� �ٽ� Ȯ���ϼ���.");
		mfrm.jumin1.value="";
		mfrm.jumin2.value="";
		mfrm.jumin1.focus();
		return false;
	}*/
	
	if (mfrm.jumin1.value=="" || mfrm.jumin2.value==""){
		  alert("�ֹι�ȣ�� �ʼ��Է»����̿�.");
		  mfrm.jumin1.focus();
		  return false;
	}
	
	var result = isNaN(mfrm.jumin1.value);
	if( result || isNaN(mfrm.jumin2.value) ){
		alert("�ֹι�ȣ�� ���ڷ� �Է��ϼ���");
		mfrm.jumin1.value="";
		mfrm.jumin2.value="";
		mfrm.jumin1.focus();
		return false;
	}
	
	var str=mfrm.email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail�ּ� ������ �߸��Ǿ����ϴ�.\n\r�ٽ� �Է��� �ּ���!');
	      mfrm.email.focus();
		  return false;
    }

	if(mfrm.cell1.value=="" || mfrm.cell2.value=="" || mfrm.cell3.value==""){
		alert("�޴���ȭ��ȣ�� �ʼ��Է»����Դϵ�.");
		mfrm.cell1.focus();
		return false;
	}
	
	if(mfrm.zip.value==""){
		alert("�ּҴ� �ʼ��Է»����Դϵ�.");
		mfrm.btnzip.focus();
		return false;
	}

	//���̵� �ߺ��˻縦 �� ���� ���
	if(mfrm.idCheck.value != "yes"){
		alert("���̵� �ߺ��˻� ��ư�� �����ּ�.");
		mfrm.btn_id.focus();
		return false;
	}


	// �ֹε�Ϲ�ȣ �ߺ�Ȯ���� �� ���� ��� 
	
	if(mfrm.juminCheck.value != "yes"){
		alert("�ֹι�ȣ �ߺ��˻� ��ư�� �����ּ�.");
		mfrm.btn_jumin.focus();
		return false;
	}

	// �̸��� �ߺ�Ȯ���� �� ���� ��� 
	if(mfrm.emailCheck.value != "yes"){
		alert("�̸��� �ߺ��˻� ��ư�� �����ּ�.");
		mfrm.btn_email.focus();
		return false;
	}

	alert("ȸ�� ������ �Ϸ�Ǿ����ϴ�.\nȮ���� �����ø� �Ѿ�ϴ�."); 
    return true; // ���������� false �� ���� �� ���� true �Ͽ� �Ѱ���

}