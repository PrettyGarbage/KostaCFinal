<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table>
		<tr>
			<th>��ȣ</th>
			<th>�������ȣ</th>
			<th>������</th>
			<th>�����</th>
			<th>���</th>
		</tr>
		<c:forEach var="listv" items="${list }" varStatus="status">
			<tr>
				<td>${listv.number }</td>
				<td>${listv.v_num }</td>
				<td>${listv.userAnswerList }</td>
				<td>${listv.quizAnswerList }</td>
				<td>${listv.resultList}</td>
			</tr>
		</c:forEach>
	</table>
</div>