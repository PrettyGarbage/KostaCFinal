<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="http://code.jquery.com/jquery-1.9.0rc1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.0.0rc1.js"></script>
<style>
#container {
	width: 800px;
	margin: auto;
}

.name {
	text-align: center;
	width: 200px;
}
</style>
<div id="container">
	<div>
		<P align="center">
			<FONT size="6"><B>�ڳ��������</B></FONT>
		</P>
		<form action="childrenAdd" method="post" id="join"
			enctype="multipart/form-data" class="form-horizontal">
			<table class="table">
				<tr>
					<td class="name">�̸�</td>
					<td><input type="text" size="15" id="c_name" name="c_name"></td>
				</tr>
				<tr>
					<td class="name">����</td>
					<td><input type="radio" name="c_gender" value="����">����
						<input type="radio" name="c_gender" value="����">����<br></td>
				</tr>
				<tr>
					<td class="name">��������</td>
					<td><input type="file" id="c_pic" name="c_pic"
						class="btn btn-danger"></td>
				</tr>
				<tr>
					<td class="name">����</td>
					<td><input type="text" size="15" id="c_age" name="c_age"></td>
				</tr>
				<tr>
					<td class="name">����</td>
					<td><input type="date" name="c_birth" id="c_birth"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input type="submit" value="���"
						class="btn btn-default"> &nbsp;&nbsp;<input type="button" value="���"
						onclick="location='parentdetail'" class="btn btn-default">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>