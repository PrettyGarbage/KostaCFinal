<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>VR���� C Learn �Դϴ�.</title>

<!-- Bootstrap Core CSS -->
<link href="resources/vendor/bootstrap/css/style.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
 


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<div id="hgroup" align="right" style="margin: 2px">
	<c:choose>
		<c:when test="${sessionScope.uid == null }">
	<a href="loginform">�α���</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="member">ȸ������</a> <br>
	</c:when>
		<c:otherwise>
			<p>${sessionScope.uid }�� �ȳ��ϼ���~^^</p>
			<p><a href="logout">�α׾ƿ�</a></p>
		</c:otherwise>
	</c:choose>
</div>