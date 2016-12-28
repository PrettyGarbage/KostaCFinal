<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table class="table">
		<thead>
			<tr>
				<th colspan="4">�������� ����Ʈ</th>
			</tr>
			<tr>
				<th>��ȣ</th>
				<th>����</th>
				<th>��ȸ��</th>
				<th>�����</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listv" items="${list1 }" end="5">
				<tr>
					<td>[����]</td>
					<td><a href="adminNoticeDetail?n_num=${listv.n_num}">${listv.n_sub}</a></td>
					<td>${listv.n_hit}</td>
					<td>${listv.n_date}</td>
				</tr>
			</c:forEach>
			<c:forEach var="listv" items="${list2 }">
				<tr>
					<td>${listv.n_num}</td>
					<td><a href="adminNoticeDetail?n_num=${listv.n_num}">${listv.n_sub}</a></td>
					<td>${listv.n_hit}</td>
					<td>${listv.n_date}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="4"><input type="button" value="�۾���"
					onclick="location='adminNoticeForm'"></th>
			</tr>
			<tr>
				<th colspan="4">${pagingCode }</th>
			</tr>



			<tr>
				<td colspan="4">
					<form method="post" action="adminNoticeListSearch">
						<input type="hidden" id="nowPage" name="nowPage"
							value="${nowPage}"> <select name="searchType"
							id="searchType">
							<option value="0">����</option>
							<option value="1">����</option>
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