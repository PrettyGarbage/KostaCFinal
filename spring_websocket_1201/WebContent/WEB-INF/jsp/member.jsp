<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<script src="http://code.jquery.com/jquery-1.9.0rc1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.0.0rc1.js"></script>
</head>
<script>
	$(function() {
		// jQuery�� ��� �����ڸ� ����ؼ� idChkBtn�� Ŭ�� �̺�Ʈ�� �����Ͽ�
		// id�� id�� text�� ���� �޾ƿ��� ����
		$('#idCheck').click(function() {
			var idv = $('#p_id').val();  /* $('#p_id').val(); */
			console.log("id�� : " + idv);
			// target�� ajax�� ����� �ٷ� ����
			$('#target').load('parentIdChk?p_id=' + idv);
		});
	});

	$(function() {
		// jQuery�� ��� �����ڸ� ����ؼ� idChkBtn�� Ŭ�� �̺�Ʈ�� �����Ͽ�
		// id�� id�� text�� ���� �޾ƿ��� ����
		$('#nicknameCheck').click(function() {
			var nicknamev = encodeURIComponent($('#p_nickname').val());
			console.log("id�� : " + nicknamev);
			// target�� ajax�� ����� �ٷ� ����
			$('#target2').load('parentNicknamechk?p_nickname=' + nicknamev);
		});
	});
	
	$(function(){
		 $('#p_pw').change(function(){
			   $('font[name=check]').text('');
			  }); //#user_pass.keyup

			  $('#p_pwck').change(function(){
			   if($('#p_pwck').val()!=$('#p_pw').val()){
			    $('font[name=check]').text('');
			    $('font[name=check]').html("��й�ȣ�� Ʋ���ϴ�.");
			    $('font[name=check]').css("color","red");
			   }else{
			    $('font[name=check]').text('');
			    $('font[name=check]').html("��й�ȣ�� ��ġ�մϴ�.");
			    $('font[name=check]').css("color","blue");
			   }
			  }); //#chpass.keyup
			 });
</script>
<body bgcolor="#ffffff" text="#000000">
	<P align="center">
		<FONT size="6"><B>ȸ������</B></FONT>
	</P>
	<form action="memberadd" method="post" id="join" enctype="multipart/form-data">
		<table width="550" align="center" border="1" bordercolor="ADD8E6"
			cellpadding="5">
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">���̵�</td>
				<td bgcolor="#E0FFFF"><input type="text" size="15" id="p_id"
					name="p_id" maxlength="30">&nbsp;<input type="button"
					value="�ߺ�Ȯ��" id='idCheck'>
				<p id="target"></p></td>

			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">��й�ȣ</td>
				<td bgcolor="#E0FFFF"><input type="password" id="p_pw"
					name="p_pw" size=15 maxlength="30"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">��й�ȣȮ��</td>
				<td bgcolor="#E0FFFF"><input type="password" id="p_pwck"
					name="p_pwck" size=15 maxlength="30"> <font name="check" size="2" color="red"></font> </td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">�̸�</td>
				<td bgcolor="#E0FFFF"><input type="text" size="15" id="p_name"
					name="p_name" maxlength="10">&nbsp;
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">�г���</td>
				<td bgcolor="#E0FFFF"><input type="text" size="15"
					id="p_nickname" name="p_nickname" maxlength="20">&nbsp;<input
					type="button" id="nicknameCheck" value="�ߺ�Ȯ��">
				<p id="target2"></p></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">�̸���</td>
				<td bgcolor="#E0FFFF"><input type="text" id="p_mail"
					name="p_mail" size=15 maxlength="30"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">�ּ�</td>
				<td bgcolor="#E0FFFF"><input type="text" id="p_addr"
					name="p_addr" size=15></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">�޴�����ȣ</td>
				<td bgcolor="#E0FFFF"><select id="p_phone1" name="p_phone1"
					style="width: 70;">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select> - <input type="text" id="p_phone2" name="p_phone2" size="4"
					maxlength="4"> - <input type="text" id="p_phone3"
					name="p_phone3" size="4" maxlength="4"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">��������</td>
				<td bgcolor="#E0FFFF"><input type="file" id="img_file"
					name="img_file"></td>
			</tr>
			<tr style="border: none;">
				<td height="50" align="right" colspan="2" style="border: none;">
					<input type="submit" value="ȸ������"> <input type="button"
					value="���" onClick="location='ciform'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>