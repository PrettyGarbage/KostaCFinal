<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function noticeDelete(n_num,nowPage) {
		if(confirm("������ ���� �Ͻðڽ��ϱ�?")){
			location="adminNoticeDelete?n_num=" + n_num + "&nowPage=" + nowPage;
		}
	}
</script>
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
					value="���" onclick="location='adminNoticeList?nowPage=1'"></th>
			</tr>
			<tr>
				<td colspan="2">${snvo.n_cont }</td>
			</tr>
		</tbody>
		<tfoot>
			<th colspan="2"><input type="button" value="����"
				onclick="location='adminNoticeUpform?n_num=${n_num}'"> <input
				type="button" value="����" onclick="noticeDelete(${n_num},${nowPage})"></th>
		</tfoot>
	</table>
</div>