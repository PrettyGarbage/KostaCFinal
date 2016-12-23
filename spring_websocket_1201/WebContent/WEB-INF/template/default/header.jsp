<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- start header -->
<head>
<link href="resources/css/style.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<header>
		<div class="navbar navbar-default navbar-static-top">
			<c:choose>
				<c:when test="${sessionScope.role eq \"admin\" }">
					<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li><a href="index.html"><img
									src="resources/img/main1.jpg" width="200px" height="100px"
									align="top"></a></li>
							<li><a href="member">ȸ������</a></li>
							<li><a href="adminNoticeList?nowPage=1">��������</a></li>
							<li><a href="adminFaqBoardList">FAQ</a></li>
							<li><a href="adminParentList?nowPage=1">�θ�ȸ������</a></li>
							<li><a href="adminChildList?nowPage=1">�ڳ�ȸ������</a></li>
							<li><a href="momBoardList?nowPage=1">�����Խ���</a></li>
							<li><a href="contChapForm">������ ���</a>
							<li><a href=""></a>
						</ul>
					</div>
				</c:when>
				<c:otherwise">
					<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li><a href="index.html"><img
									src="resources/img/main1.jpg" width="200px" height="100px"
									align="top"></a></li>
							<li><a href="noticeList?nowPage=1">��������</a></li>
							<li><a href="registerManagerList">�н��Ϸ�����</a></li>
							<li><a href="registerAddListView">������û</a></li>
							<li><a href="adminFaqBoardList">FAQ</a></li>
							<li><a href="momBoardList?nowPage=1">�����Խ���</a></li>
							<li><a href="parentdetail">����������</a></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="container" id="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>

				<!-- <div class="navbar-collapse collapse ">  
					<ul class="nav navbar-nav"> 
						<li><a href="index.html"><img src="resources/img/main1.jpg" width="200px" height="100px" align="top"></a></li>
						<li><a href="javascript:popupOpen()">������ �˾�â</a></li>
						<li><a href="member">ȸ������</a></li>
						<li><a href="idsearch">idã��</a></li> 
						<li><a href="pwsearch">pwã��</a></li>
						<li><a href="registerDoginList">�н��Ϸ�����</a></li>
						<li><a href="registerAddListView">������û</a></li>
						<li><a href="adminNoticeForm">�������׵��</a></li>
						<li><a href="adminNoticeList?nowPage=1">�������׸���Ʈ</a></li>
						<li><a href="adminFaqBoardList">FAQ</a></li>
				 		<li><a href="adminParentList?nowPage=1">�θ�ȸ������</a></li>
						<li><a href="adminChildList?nowPage=1">�ڳ�ȸ������</a></li>
						<li><a href="momBoardList?nowPage=1">�����Խ���</a></li>
						<li><a href="parentdetail">����������</a></li>
						<li><a href="">�ȵ���̵� ���� ����</a></li>
					</ul>
				</div>   -->
			</div>
		</div>
	</header>
</body>
<!-- end header -->
