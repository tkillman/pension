function writeSave(){
	
	if(document.writeform.writer.value==""){
	  alert("�̸�����?");
	  document.writeform.writer.focus();
	  return false;
	}
	if(document.writeform.subject.value==""){
	  alert("������??");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){
	  alert("�ù�(��)����");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(document.writeform.passwd.value==""){
	  alert("���ϳ��� ������ض�~");
	  document.writeform.passwd.focus();
	  return false;
	}
 }    

