<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div> 
	<%
		session.setAttribute("p_id", "user1");
		session.setAttribute("p_pw", "test00");
	%>

	<form action="momBoardAdd" method="post">
		<table>
			<thead>   
				<tr>
					<th colspan="3"><h2>"�� �Խ���"</h2></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>�� ��</th>

					<td><input type="text" name="ib_sub" id="ib_sub"
						style="width: 400px;"></td>
				</tr>

				<tr>
					<th>�� ��</th>
					<td colspan="2"><textarea cols="70" rows="20" name="ib_cont"
							id="ib_cont"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" name="p_num" id="p_num"
						value="5"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="3"><input type="submit" value="���">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="���"
						onclick="location='momBoardList?nowPage=1'"></th>
				</tr>
			</tfoot>
		</table> 
	</form>
</div>

<!-- �α��� �� p���� ���ǿ� �־��ٰ� �����´�? -->