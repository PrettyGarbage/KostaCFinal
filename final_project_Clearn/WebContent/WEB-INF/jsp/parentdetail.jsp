<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<style>
		table tr th {text-align: center;}
		table tr td {text-align: center;}
	</style>
<div style="width: 800px; margin: auto;">
	<table class="table">
		<thead>
			<tr>
				<th colspan="2"><h2>${sessionScope.uid }�� ȯ���մϴ�.</h2></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>���̵�</th>
				<td>${parentVO.p_id }</td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td>${parentVO.p_mail }</td>
			</tr>
			<tr>
				<th>�޴�����ȭ</th>
				<td>${parentVO.p_phone }</td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td>${parentVO.p_name }</td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td>${parentVO.p_addr }</td>
			</tr>
			<tr>
				<th>����</th>
				<td><img src="resources/upload/${parentVO.p_pic}"
					style="width: 200px; height: 200px;"></td>
			</tr>
			<tr>
				<th>�г���</th>
				<td>${parentVO.p_nickname }</td>
			</tr>
			<tr>
				<td colspan="2" >
					<input type="button" value="�ڳ���" onclick="location='children'" class="btn btn-default">
					&nbsp;&nbsp;<input type="button" value="����" 
					onclick="location='parentupform?p_num=${parentVO.p_num}'" class="btn btn-default">
					&nbsp;&nbsp;<input type="button" value="���" onclick="location='index'" class="btn btn-default">
				</td>
			</tr>
		</tbody>
	</table>
</div>