<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ȸ������</title>
<script src="http://code.jquery.com/jquery-1.9.0rc1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.0.0rc1.js"></script>
</head>
<script>
	$(function() {
		// jQuery�� ��� �����ڸ� ����ؼ� idChkBtn�� Ŭ�� �̺�Ʈ�� �����Ͽ�
		// id�� id�� text�� ���� �޾ƿ��� ����
		$('#idCheck').click(function() {
			var idv = $('#a_id').val();
			console.log("id�� : " + idv);
			// target�� ajax�� ����� �ٷ� ����
			$('#target2').load('adminIdChk?a_id=' + idv);
		});
	});

	$(function() {
		// jQuery�� ��� �����ڸ� ����ؼ� idChkBtn�� Ŭ�� �̺�Ʈ�� �����Ͽ�
		// id�� id�� text�� ���� �޾ƿ��� ����
		$('#nicknameCheck').click(function() {
			var nicknamev = $('#a_nickname').val();
			console.log("id�� : " + nicknamev);
			// target�� ajax�� ����� �ٷ� ����
			$('#target3').load('adminNicknamechk?a_nickname=' + nicknamev);
		});
	});
</script>
<body bgcolor="#ffffff" text="#000000">
	<P align="center">
		<FONT size="6"><B>������ ȸ������</B></FONT>
	</P>
	<form action="adminadd" method="post" id="join"
		enctype="multipart/form-data">
		<table width="550" align="center" border="1" bordercolor="ADD8E6"
			cellpadding="5">
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">������ ������ȣ</td>
				<td bgcolor="#E0FFFF"><input type="text" size="15" id="a_num"
					name="a_num" maxlength="30">&nbsp;<input type="button"
					value="��ȿüũ" id='numCheck'>
					<p id="target"></p></td>

			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">������ ���̵�</td>
				<td bgcolor="#E0FFFF"><input type="text" size="15" id="a_id"
					name="a_id" maxlength="30">&nbsp;<input type="button"
					value="�ߺ�üũ" id='idCheck'>
					<p id="target2"></p></td>

			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">������ �̸�</td>
				<td bgcolor="#E0FFFF"><input type="text" id="a_name"
					name="a_name" size=15 maxlength="30"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">������ ��й�ȣ</td>
				<td bgcolor="#E0FFFF"><input type="password" size="15"
					id="a_pwd" name="a_pwd" maxlength="10">&nbsp;
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">������ ����</td>
				<td bgcolor="#E0FFFF"><input type="radio" name="r_num"
					value="1">�Խ��� <input type="radio" name="r_num"
					value="2">ȸ������ <input type="radio" name="r_num"
					value="3">����������<br></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">������ �г���</td>
				<td bgcolor="#E0FFFF"><input type="text" size="15"
					id="a_nickname" name="a_nickname" maxlength="20">&nbsp;<input
					type="button" value="�ߺ�üũ" id='nicknameCheck'>
					<p id="target3"></p></td>
			</tr>
			<tr style="border: none;">
				<td height="50" align="right" colspan="2" style="border: none;">
					<input type="submit" value="ȸ������"> <input type="button"
					value="���" onClick="location='adminmenu'"> <!-- �����̼� cifrom ���� ���ּ��� -->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>