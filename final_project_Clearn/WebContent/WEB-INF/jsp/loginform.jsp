<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#containter {
	width: 650px;;
	padding-top: 100px;
	padding-bottom: 100px;
	margin: auto;
}
</style>
<div id="containter">
	<h3>Login with User ID and Password</h3>
	<%-- <c:url var="loginUrl" value="/j_spring_security_check"></c:url> 
<!-- security�� ���� ����  ���� ���͸� �ݵ�� ��ġ���� �Ѵ� --> --%>
	<form class="form-horizontal" action="login" method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">User
				ID :</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="id" name="id"
					placeholder="User Id">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">Password
				:</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="pw" name="pw"
					placeholder="User Password">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<a href="idsearch">idã��</a> / <a href="pwsearch">pwã��</a><br />
				<br />
				<button type="submit" class="btn btn-default" style="width: 100px;">login</button>
			</div>
		</div>
	</form>

</div>