<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table>
		<thead>
			<tr>
				<th colspan="2" style="text-align: left; font-size: 30px;">��������</th>
			</tr>
			<tr>
				<th colspan="2" style="text-align: left; font-size: 15px;">����������
					�˷��帳�ϴ�.</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th colspan="2" style="text-align: left;"><h2>${snvo.n_sub }</h2></th>
			</tr>
			<tr>
				<td>�ۼ���&nbsp;&nbsp;${snvo.n_date}</td>
				<td style="text-align: right;">��ȸ��&nbsp;&nbsp;${snvo.n_hit}</td>
			</tr>
			<tr>
				<th colspan="2" style="text-align: right;"><input type="button"
					value="���" onclick="location='noticeList?nowPage=1'"></th>
			</tr>
			<tr>
				<td colspan="2">${snvo.n_cont }</td>
			</tr>
		</tbody>
	</table>
