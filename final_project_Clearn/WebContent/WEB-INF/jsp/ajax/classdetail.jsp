<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<style>
table {
	width: 650px;
}

table tr th {
	text-align: center;
}

table tr td {
	text-align: center;
}
</style>
<div style="width: 650px; margin: auto;">
	<h2 style="text-align: center;">${vo.ct_sub }</h2>
	<h3 style="text-align: right;">�� ${chapternum }�� / ${vo.ct_period }��</h3>
	<p style="background: pink;">${vo.ct_detail }</p>
	<h3 style="text-align: center;">����</h3>
	<table>
		<tr>
			<th>����</th>
			<th>����ð�</th>
		</tr>
		<c:forEach var="listv" items="${list }">
			<tr>
				<td>${listv.ch_sub}</td>
				<td>${listv.ch_time}��</td>
			</tr>
		</c:forEach>
	</table>
	<h2 style="text-align: center;">���� : ${vo.ct_star }</h2>
	<p style="text-align: center;">
		<input type="button" value="�ݱ�" onclick="window.close()"
			class="btn btn-danger">
	</p>
</div>