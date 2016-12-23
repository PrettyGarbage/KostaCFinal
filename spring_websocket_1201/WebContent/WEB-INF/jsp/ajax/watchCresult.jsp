<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table>
		<c:choose>
			<c:when test="${list == null}">
				<tr>
					<td><h3>����� �����ϴ�.</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th>��ȣ</th>
					<th>�������ȣ</th>
					<th>���۽ð�</th>
					<th>����ð�</th>
				</tr>
				<c:forEach var="listv" items="${list }" varStatus="status">
					<tr>
						<td>${listv.number }</td>
						<td>${listv.v_num }</td>
						<td>${listv.start_time }</td>
						<td>${listv.end_time }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>