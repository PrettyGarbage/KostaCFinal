<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<table>
		<tr>
			<th>����</th>
			<th>���Ǹ�</th>
			<th>����</th>
			<th>�����ϼ�</th>
		</tr>
		<c:forEach var="listv" items="${list }">
			<tr>
				<td>${listv.cc_name }</td>
				<td>${listv.ct_sub }</td>
				<td><progress max="100" value="${listv.percentage }"></progress>${listv.percentage }%</td>
				<td>${listv.leftday }��</td>
			</tr>
		</c:forEach>
	</table>
</div>