<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.0.min.js"></script>
<script type="text/javascript">
	function popupOpen() {
		var popUrl = "classdetail?ct_num=3"; //�˾�â�� ��µ� ������ URL
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;"; //�˾�â �ɼ�(optoin)
		window.open(popUrl, "", popOption);
	}
	window.onload = function() {
		if ("${status}" === "") {
		} else {
			alert("${status}");
		}
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.uid==null }">
			<li><a href="loginform">�α��� ����</a></li>
		</c:when>
		<c:otherwise>
			<li>${sessionScope.uid }�Թݰ�����^^<a href="logout">�α׾ƿ� ����</a></li>
		</c:otherwise>
	</c:choose>
	<a href="javascript:popupOpen()">������ �˾�â</a>
	<a href="member">ȸ������</a>
	<a href="idsearch">idã��</a>
	<a href="pwsearch">pwã��</a>
	<a href="registerDoginList">�н��Ϸ�����</a>
	<a href="registerManagerList">�н�����</a>
	<a
		href="registerAddListView?p_id=${sessionScope.p_id }&p_token=${sessionScope.p_token }">������û</a>
	<a href="adminNoticeForm">�������׵��</a>
	<a href="adminNoticeList?nowPage=1">�������׸���Ʈ</a>
	<a href="adminFaqBoardList">FAQ</a>
	<a href="adminParentList?nowPage=1">�θ�ȸ������</a>
	<a href="adminChildList?nowPage=1">�ڳ�ȸ������</a>
	<a href="momBoardList?nowPage=1">�����Խ���</a>
	<a href="parentdetail">����������</a>
	<a href="">�ȵ���̵� ���� ����</a>
</body>
</html>