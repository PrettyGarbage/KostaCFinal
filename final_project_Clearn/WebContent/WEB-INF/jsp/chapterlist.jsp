<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<table>
		<tr>
			<th>��ȣ</th>
			<th>���Ǹ�</th>
			<th>������</th>
			<th>�н��ϱ�</th>
		</tr>
		<c:forEach var="listv" items="${list }" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${listv.ch_sub}</td>
				<td>${listv.cl_done }</td>
				<td><input type="button" value="�н��ϱ�" onclick="location.href='play'"></td>
			</tr>
		</c:forEach>
	</table>
</div>