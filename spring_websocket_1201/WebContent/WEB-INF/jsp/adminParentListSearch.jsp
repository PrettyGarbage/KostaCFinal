<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table>
		<thead>
			<tr>
				<th colspan="8"><h2>�θ� ȸ�� ����</h2></th>
			</tr>
			<tr>
				<th>��ȣ</th>
				<th>���̵�</th>
				<th>�̸���</th>
				<th>�޴�����ȣ</th>
				<th>�̸�</th>
				<th>�ּ�</th>
				<th>�г���</th>
				<th>���Գ�¥</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listv" items="${list}">
				<tr>
					<td>${listv.p_num }</td>
					<td><a href="adminParentDetail?p_num=${listv.p_num }">${listv.p_id }</a></td>
					<td>${listv.p_mail }</td>
					<td>${listv.p_phone }</td>
					<td>${listv.p_name }</td>
					<td>${listv.p_addr }</td>
					<td>${listv.p_nickname }</td>
					<td>${listv.p_date }</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="8">${pagingCode }</th>
			</tr>
			<tr>
				<td colspan="8">
					<form method="post" action="adminParentListSearch">
						<input type="hidden" id="nowPage" name="nowPage"
							value="${nowPage}"> <select name="searchType"
							id="searchType">
							<option value="0">����</option>
							<option value="1">���̵�</option>
							<option value="2">�̸�</option>
							<option value="2">��ȭ��ȣ</option>
						</select>&nbsp; <input type="text" name="searchValue" id="searchValue"
							value="${searchValue}">&nbsp; <input type="submit"
							value="�˻�">
					</form>
				</td>
			</tr>
		</tfoot>
	</table>
</div>