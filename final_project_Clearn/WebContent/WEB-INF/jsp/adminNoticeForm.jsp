<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div style="width: 800px; margin: auto;">
	<form action="adminNoticeAdd" method="post">
		<table class="table">
			<thead>
				<tr>
					<th colspan="2"><h2 style="text-align: center;">�������� ���</h2></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th style="width: 200px; text-align: center;">����</th>
					<th><select name="n_fix">
							<option value="">����</option>
							<option value="0">�߿�X</option>
							<option value="1">�߿�</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="n_sub" id="n_sub"
						style="width: 400px;"></th>
				</tr>
				<tr>
					<th style="width: 200px; text-align: center;">����</th>
					<td><textarea cols="70" rows="20" name="n_cont"
							id="n_cont"></textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2" style="text-align: center;"><input type="submit" value="���" class="btn btn-default">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="���"
						onclick="location='adminNoticeList?nowPage=1'" class="btn btn-default"></th>
				</tr>
			</tfoot>
		</table>
	</form>
</div>