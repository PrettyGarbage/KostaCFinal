<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div>
	<table>
		<thead>
			<tr>
				<th colspan="2"><h2>�θ� ȸ�� ����</h2></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>���̵�</th>
				<td>${spvo.p_id }</td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td>${spvo.p_pw }</td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td>${spvo.p_mail }</td>
			</tr>
			<tr>
				<th>�޴�����ȣ</th>
				<td>${spvo.p_phone }</td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td>${spvo.p_name }</td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td>${spvo.p_addr }</td>
			</tr>
			<tr>
				<th>����</th>
				<td><img src="resources/upload/${spvo.p_pic }" width="150" height="150"></td>
			</tr>
			<tr>
				<th>�г���</th>
				<td>${spvo.p_nickname }</td>
			</tr>
		</tbody>
		<tfoot>
			<th colspan="2"><input type="button" value="���" onclick="history.back();"></th>
		</tfoot>
	</table>
</div>