<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div>
	<P align="center">
		<FONT size="6"><B>���� ��� �� ����</B></FONT>
	</P>
	<form action="childadd" method="post" id="jooin">
		<table>
			<div>
				<a href="member">�θ� ȸ������<img src="resources/img/h.jpg" width="250px" height="250px"></a>
				<a href="children">�ڳ���<img src="resources/img/child.jpg" width="250px" height="250px"></a> 
				<a href="parentdetail">����������
				<img src="resources/img/m.jpg" width="250px" height="250px"></a>
			<p>chk : ${sessionScope.p_num } </p>
			</div>
		</table>
	</form>
</div>