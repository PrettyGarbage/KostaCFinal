<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table{text-align: center;}
.table tr th {text-align: center;}
</style>
<div style="1000px;">
	<input type="hidden" value="${p_num }" name="p_num">
	<table class="table">
		<tr>
			<th>����</th>
			<th>��������</th>
			<th>������</th>
			<th>�����ϼ�</th>
		</tr>
		<c:forEach var="listv" items="${list }">
			<tr>
				<td>${listv.cc_name }</td>
				<td><a href="registerClassList?ct_num=${listv.ct_num }">${listv.ct_sub }</a></td>
				<td><progress max="100" value="${listv.percent }"></progress>${listv.percent}%</td>
				<td>${listv.finish_date }��</td>
			</tr>
		</c:forEach>
	</table>
	<div id="chap_list"></div>
</div>