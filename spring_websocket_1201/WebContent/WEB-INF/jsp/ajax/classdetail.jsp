<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>classdetail</title>
</head>
<body>
	<h2>���� : ${vo.ct_sub }</h2>
	<h3>�� ${chapternum }��/${vo.ct_period }��</h3>
	<p>���� : ${vo.ct_detail }</p>
	����
	<table>
		<tr>
			<th>����</th>
			<th>����ð�</th>
		</tr>
	<c:forEach var="listv" items="${list }">
		<tr>
			<td>${listv.ch_sub}</td>
			<td>${listv.ch_time}</td>
		</tr>
	</c:forEach>
	</table>
	<h2> ���� : ${vo.ct_star }</h2> 
	<input type="button" value="�ݱ�" onclick="window.close()"></input>
</body>
</html>