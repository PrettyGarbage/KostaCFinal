<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div style="width: 800px; margin: auto;">
	<form action="adminNoticeUpdate" method="post">
		<input type="hidden" value="${n_num}" name="n_num">
		<table class="table">
			<thead>
				<tr>
					<th colspan="2"><h2 style="text-align: center;">공지사항 수정</h2></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th style="width: 200px; text-align: center;">제목</th>
					<th><select name="n_fix">
							<option value="0">중요X</option>
							<option value="1">중요</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="n_sub" id="n_sub"
						style="width: 400px;" value="${snvo.n_sub}"></th>
				</tr>
				<tr>
					<th style="width: 200px; text-align: center;">내용</th>
					<td><textarea cols="70" rows="20" name="n_cont" id="n_cont">${snvo.n_cont}</textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2" style="text-align: center;"><input
						type="submit" value="수정" class="btn btn-default">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
						onclick="history.back(); return false;" class="btn btn-default"></th>
				</tr>
			</tfoot>
		</table>
	</form>
</div>