<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div>
	<table>
		<thead>
			<tr>
				<th></th>
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

				<td height="50" align="right" colspan="2" style="border: none;">
					<input type="button" value="�ڳ���" onclick="location='children'">
					<input type="button" value="����"
					onclick="location='parentupform?p_num=${parentVO.p_num}'">
					</a> <input type="button" value="���" onclick="location='ciform'">
				</td>
			</tr>
		</tbody>
	</table>
</div>