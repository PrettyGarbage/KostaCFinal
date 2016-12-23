<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PW ã��</title>
<script src="http://code.jquery.com/jquery-1.9.0rc1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.0.0rc1.js"></script>
</head>
<script>
	var answer = "";
	function check_code() {
		console.log("answer : " + answer);
		console.log("element : " + document.getElementById("answer_input").value);
		if (document.getElementById("answer_input").value === answer) {
			alert('�ӽ� ��й�ȣ�� �߼۵Ǿ����ϴ�.');
			location.href = 'new_pw?p_id=' + document.getElementById("p_id").value +'&p_mail='+document.getElementById("p_mail").value;
		} else {
			alert('������ȣ�� Ʋ�Ƚ��ϴ�.');
		}
	}
	$(function() {
		$('#code_req').click(function() {
			var p_name = encodeURIComponent($('#p_name').val());
			var p_id = encodeURIComponent($('#p_id').val());
			var p_mail = encodeURIComponent($('#p_mail').val());
			$.ajax({
				url : 'findpw',
				type : 'post',
				data : {
					p_name ,
					p_id,
					p_mail
				},
				success : function(msg) {
					msg = msg.replace(/(^\s*)|(\s*$)/ig, '').replace(/\n/ig, '');
					console.log("msg�� : " + msg);
					if(msg===""){
						alert('���Ե� ������ �����ϴ�.');
					} else {
					$('#code_input').html("������ȣ : <input type=\"text\" id=\"answer_input\" name=\"answer_input\"> <input type=\"button\" id=\"ck_answer\" name=\"ck_answer\" value=\"Ȯ��\" onclick=\"check_code()\" >");
					answer = msg;
					}
				}
			})
		});

		$('#ck_answer').click(function() {
			if ($('#answer_input').val() == answer) {
				$(location).attr('href', "findid_result");
			} else {
				alert('������ȣ�� Ʋ�Ƚ��ϴ�.');
			}
		});
	});
</script>

<body bgcolor="#ffffff" text="#000000">
	�̸� : <input type="text" id="p_name" name="p_name">
	���̵� : <input type="text" id="p_id" name="p_id">
	�̸��� : <input type="email" id="p_mail" name="p_mail">
	<input type="button" value="������ȣ ��û" id="code_req">
	<div id="code_input"></div>
</body>
</html>