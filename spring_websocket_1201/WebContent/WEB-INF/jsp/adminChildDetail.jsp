<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div>
	<table>
		<thead>
			<tr>
				<th colspan="2"><h2>�ڳ� ȸ�� ����</h2></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>�̸�</th>
				<td>${scvo.c_name }</td>
			</tr>
			<tr>
				<th>����</th>
				<td>${scvo.c_age }</td>
			</tr>
			<tr>
				<th>����</th>
				<td>${scvo.c_gender }</td>
			</tr>
			<tr>
				<th>����</th>
				<td><img src="resources/upload/${scvo.c_pic }" width="150"
					height="150"></td>
			</tr>
			<tr>
				<th>����</th>
				<td>${scvo.c_birth }</td>
			</tr>
		</tbody>
		<tfoot>
		<tr>
			<th colspan="2"><input type="button" value="���" onclick="history.back();"></th>
		</tr>
		</tfoot>
	</table>
</div>