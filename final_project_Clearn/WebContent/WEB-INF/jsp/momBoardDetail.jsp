<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>   
 
 
	function momBoardDelete(ib_num, nowPage) {  
		if (confirm("������ ���� �Ͻðڽ��ϱ�?")) {
			location = "momBoardDelete?ib_num=" + ib_num + "&nowPage=" + nowPage;
		} 
	}   

	function replyDelete(ic_num, p_nickname, ib_num) {
<%-- 		console.log("���� �г��� : "+ "<%=(String) session.getAttribute("uid") %>"); --%>
		var s_nick = "<%=session.getAttribute("uid")%>";
		if(p_nickname === s_nick){
			if(!confirm("�����Ͻǰǰ���?")){
				return;
			} 
			else{
				location.href = 'replyDel?ic_num=' + ic_num + '&ib_num=' + ib_num;
			}
		} else {
			alert("���� ������ �����ϴ�."); 
		}
	} 
</script>

<div>
	<table>

		<tbody>
			<tr>
				<th colspan="2" style="text-align: left;"><h2>${mvo.ib_sub }</h2></th>
			</tr>
			<tr>
				<td>�ۼ���&nbsp;&nbsp;${mvo.ib_date}</td>
				<td style="text-align: right;">��ȸ��&nbsp;&nbsp;${mvo.ib_hit}</td>
			</tr>
			<tr>
				<th colspan="2" style="text-align: right;"><input type="button"
					value="���" onclick="location='momBoardList?nowPage=1'"></th>
			</tr>
			<tr>
				<td colspan="2">${mvo.ib_cont }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="2"><c:if test="${'�����3' eq sessionScope.uid}">
						<td colspan="2" align="center"><input type="button"
							value="����" class="button1"
							onclick="location='momBoardUpform?ib_num=${ib_num}'"></td>
						<td colspan="2" align="left"><input type="button" value="����"
							class="button1"
							onclick="momBoardDelete(${ib_num},${nowPage })"></td>

					</c:if></th>
			</tr>
		</tfoot>
	</table>
	<br>
	<%-- 	<c:if test="${sessionScope.id !=null }"></c:if> --%>
	<!-- 	�񵿱������ ��۴ޱ� -->
	<form method="post" action="replyComm">
		<input type="hidden" name="ib_num" value="${ib_num}"> <input
			type="hidden" name="p_nickname" value="${sessionScope.uid }">
		<table style="width: 410px;">
			<tr>
				<!-- 			���۶� �ڵ����� -->
				<td><textarea rows="3" cols="60" name="ic_comm" id="ic_comm"></textarea></td>
				<td><input type="submit" value="Ȯ��"></td>
			</tr>
		</table>
	</form>
	<table>
		<td>�ۼ���</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;�� ��</td>

		<c:forEach var="reply" items="${list}" varStatus="status">
			<tr>
			</tr>
			<tr>
				<td>${reply.p_nickname}</td>
				<td>${reply.ic_comm}</td>
				<td colspan="2">
					<button
						onclick="replyDelete(${reply.ic_num}, '${reply.p_nickname}', ${ib_num})">����</button>
				</td>
			</tr>

		</c:forEach>
	</table>
</div>
