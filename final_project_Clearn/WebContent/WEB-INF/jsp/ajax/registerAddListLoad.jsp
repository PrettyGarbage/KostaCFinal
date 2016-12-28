<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.0.min.js"></script>
<script type="text/javascript">
	// �󼼺��� ��ư�� Ŭ���ϸ� ����Ǵ� �Լ�
	function popupOpen(ct_num) {
		/* console.log("ct_num : "+ct_num); */
		var popUrl = "classdetail?ct_num="+ct_num; //�˾�â�� ��µ� ������ URL
		var popOption = "width=570, height=560, resizable=no, scrollbars=no, status=no;"; //�˾�â �ɼ�(optoin)
		window.open(popUrl, "", popOption);
	}
	
	$(function(){
		// insertClassMany��� ���̵� ���� ��ư�� Ŭ���ϸ� �����ϴ� �Լ�
		$('#insertClassMany').click(function(){
			// confirm â�� �����Ų��.
			var result = confirm('������û�� �Ͻðڽ��ϱ�?');
			// ���� p_num�� p_num�̶�� ���̵��� ���� �����´�.
			var p_num = $("#p_num").val();
			// ���� p_token�� p_token�̶�� ���̵��� ���� �����´�.
			var p_token = $("#p_token").val();
			// ���� ct_num_ary��� ������ �迭�� �����Ѵ�.
			var ct_num_ary = [];
			// input �±� �߿��� name�̶�� �Ӽ��� ckd�̰� ������ �Ǿ��ִ� �͵��� each���� ����ؼ� ���� ���� ������ �����´�.
		    $("input[name='ckd']:checked").each(function(i) {
		    	// ������ ������ ct_num_ary�� �ִ´�.
		       ct_num_ary.push($(this).val());
		    });
			// �� ���������� �����ϰ� ���� ��� �������� ������ �ִ´�.
			var allData = { "p_num": p_num, "ct_num_ary": ct_num_ary, "p_token" :p_token};
			// ���� (result�� ���� ������ ���� Ŭ��������)
			if(result){
				// �Ʒ��� ajax�� �����Ѵ�.
					//({
						// url : �� insertClass��� �ּҸ� �־� ������ ���鿡 ���Ͽ� ����Ѵ�.
						// type :���� ���������� �ִµ� 'post' ����� �����ߴ�.
						// data : { ����ϰ� ���� ������ �ۼ��ؼ� �����Ѵ�. }
						// success : data ���� ������ �����̸� ����ȴ�.
						// ������ confirm â�� �����Ű�� ���� Ŭ���ϸ� �������� ���� �������� �̵��Ѵ�.
						// error : ���н� 
						// alert("���� �߻�~~ \n" + textStatus + " : " + errorThrown)
						// ��� ��� â�� ����.
					//})
				 $.ajax({
        			url:'insertClass',
        			type:'post',
        			data: {p_num : p_num, ct_num_ary : ct_num_ary, p_token : p_token},
        			success:function(data){
        				if(confirm('������û �Ϸ�! ������������ �̵��Ͻðڽ��ϱ�')){
        					location.replace('registerManagerList');
        				}
        			},
        			error:function(jqXHR, textStatus, errorThrown){
            			alert("���� �߻�~~ \n" + textStatus + " : " + errorThrown);
        			}
    			});
			}
		});
	});
	
	function insertClassSelect(){
		// ����� ID�� ���� �´�.
	    var userId = $("#userId").val();
	 	
	    // name�� ���� üũ�ڽ��� ������ �迭�� ��´�.
	    var checkboxValues = [];
	    $("input[name='hobby']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    }); 
	}
</script>
<div>
	<form method="post">
		<input type="hidden" value="${cc_num }" name="cc_num"> <input
			type="hidden" value="${sessionScope.p_token }" name="p_token"
			id="p_token"> <input type="hidden"
			value="${sessionScope.p_num }" name="p_num" id="p_num">
		<table class="table">
			<c:forEach var="listv" items="${list }">
				<tr>
					<td><input type="checkbox" name="ckd" value="${listv.ct_num }">&nbsp;&nbsp;${listv.ct_sub }
					</td>
					<td>${listv.cnt}��/(${listv.ct_period }��)</td>
					<td><input type="button" value="�󼼺���"
						onclick="javascript:popupOpen(${listv.ct_num})"
						class="btn btn-info"></td>
				</tr>
				<tr>
					<td colspan="2">�� ${listv.ct_star }��</td>
					<td>������ : ${listv.ct_hit }</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="������û" id="insertClassMany"
			class="btn btn-danger">
	</form>
	<br />
</div>

