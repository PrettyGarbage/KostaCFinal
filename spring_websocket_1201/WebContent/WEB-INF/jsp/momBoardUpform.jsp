<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div>
	<form action="momBoardUpdate" method="post"> 
		<input type="hidden" value="${ib_num}" name="ib_num">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h2>�����ϱ�</h2></th>
				</tr>
			</thead> 
			<tbody>
				<tr>  
					<th>����</th>

					<td><input type="text" name="ib_sub" id="ib_sub"
						style="width: 400px;" value="${mvo.ib_sub}"></td>
				</tr>
				<tr>
					<th>����</th>
					<td colspan="2"><textarea cols="70" rows="20" name="ib_cont"
							id="ib_cont">${mvo.ib_cont}</textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="3"><input type="submit" value="����">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="���"
						onclick="history.back(); return false;"></th>
				</tr>
			</tfoot>
		</table>
	</form>   
</div>