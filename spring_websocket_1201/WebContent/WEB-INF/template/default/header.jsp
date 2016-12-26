<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/style.css" rel="stylesheet" />
<header>
	<div class="navbar navbar-default navbar-static-top">
		<c:choose>
			<c:when test="${sessionScope.uid == null }">
				<div class="navbar-collapse collapse ">
					<ul class="nav navbar-nav">
						<li><a href="index.html"><img
								src="resources/img/main1.jpg" width="200px" height="100px"
								align="top"></a></li>
						<li><a href="loginform">�α���</a></li>
						<li><a href="member">ȸ������</a></li>
						<li><a href="idsearch">���̵� ã��</a></li>
						<li><a href="pwsearch">��й�ȣ ã��</a></li>
					</ul>
				</div>
			</c:when>
			<c:when test="${sessionScope.role eq \"admin\" }">
				<div class="navbar-collapse collapse ">
					<ul class="nav navbar-nav">
						<li><a href="index.html"><img
								src="resources/img/main1.jpg" width="200px" height="100px"
								align="top"></a></li>
						<li><a href="adminNoticeList?nowPage=1">��������</a></li>
						<li><a href="adminFaqBoardList">FAQ</a></li>
						<li><a href="adminParentList?nowPage=1">�θ�ȸ������</a></li>
						<li><a href="adminChildList?nowPage=1">�ڳ�ȸ������</a></li>
						<li><a href="momBoardList?nowPage=1">�����Խ���</a></li>
						<li><a href="contChapForm">������ ���</a></li>
						<li><br />${sessionScope.uid }�Ծȳ��ϼ���~^^</li>
						<li><a href="logout">�α׾ƿ�</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
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
						<li><br />${sessionScope.uid }�Ծȳ��ϼ���~^^</li>
						<li><a href="logout">�α׾ƿ�</a></li>
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
		</div>
	</div>
</header>
