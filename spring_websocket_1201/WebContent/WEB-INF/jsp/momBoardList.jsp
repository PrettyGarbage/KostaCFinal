<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table>
		<thead>
			<tr>
				<th colspan="7">�� �Խ��� ����Ʈ</th>
			</tr>
			<tr>
				<th>��ȣ</th>
				<th>����</th>
				<th>��ȸ��</th>
				<th>��õ��</th>
				<th>�����</th> 
				<th>����ȣ</th>
			</tr>
		</thead>
		<tbody> 

			<c:forEach var="listv" items="${list2 }"> 
				<tr>
					<td>${listv.ib_num}</td>
					<td><a href="momBoardDetail?ib_num=${listv.ib_num}">${listv.ib_sub}</a>
					</td>
					<td>${listv.ib_hit}</td>
					<td>${listv.ib_recom}</td>
					<td>${listv.ib_date}</td>
					<td>${listv.p_num}</td>
			 	</tr>
			</c:forEach>
		</tbody>

		<tfoot>
			<tr>
				<th colspan="4"><input type="button" value="�۾���"
					onclick="location='momBoardForm'"></th>
			</tr>
			<tr>
				<th colspan="4">${pagingCode}</th>
			</tr>
			<tr>
				<td colspan="4">
					<form method="get" action="momBoardListSearch">
						<input type="hidden" id="nowPage" name="nowPage"
							value="${nowPage}"> <select name="searchType"
							id="searchType">
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