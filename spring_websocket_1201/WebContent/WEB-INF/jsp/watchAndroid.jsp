<%@page import="or.clearn.service.FcmService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String msg = request.getParameter("msg");
	String p_token = request.getParameter("p_token");
	FcmService fs = new FcmService();
	fs.sendDataType1(p_token, msg);
%>
<body>
	�˸��� ���������� ���۵Ǿ����ϴ�.
	<br />���۵� Ǫ�� �޽����� Ȯ���ϼ���!
</body>