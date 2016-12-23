<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function childDelete(c_num, nowPage) {
		if (confirm("������ Ż�� ��Ű�ڽ��ϱ�?")) {
			location = "adminChildDelete?c_num=" + c_num + "&nowPage="
					+ nowPage;
		}
	}
</script>
<div>
	<table class="table">
		<input type="hidden" id="nowPage" name="nowPage" value="${nowPage}">
		<thead>
			<tr>
				<th colspan="4"><h2>�ڳ� ȸ�� ����</h2></th>
			</tr>
			<tr>
				<th>��ȣ</th>
				<th>�θ��̸�</th>
				<th>�̸�</th>
				<th>����</th>
				<th>����</th>
				<th>Ż��</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listv" items="${list}">
				<tr>
					<td>${listv.c_num }</td>
					<td>${listv.p_name }</td>
					<td><a href="adminChildDetail?c_num=${listv.c_num }">${listv.c_name }</a></td>
					<td>${listv.c_age }</td>
					<td>${listv.c_birth }</td>
					<td><input type="button" value="����Ż��" onclick="childDelete(${listv.c_num},${nowPage })"></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="4">${pagingCode }</th>
			</tr>
			<tr>
				<td colspan="4">
					<form method="post" action="adminChildListSearch">
						<input type="hidden" id="nowPage" name="nowPage"
							value="${nowPage}"> <select name="searchType"
							id="searchType">
							<option value="0">����</option>
							<option value="1">�̸�</option>
							<option value="2">����</option>
						</select>&nbsp; <input type="text" name="searchValue" id="searchValue"
							value="${searchValue}">&nbsp; <input type="submit"
							value="�˻�">
					</form>
				</td>
			</tr>
		</tfoot>
	</table>
</div>