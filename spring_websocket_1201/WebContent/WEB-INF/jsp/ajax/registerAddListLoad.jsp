<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.0.min.js"></script>
<script type="text/javascript">
	function popupOpen(ct_num) {
		/* console.log("ct_num : "+ct_num); */
		var popUrl = "classdetail?ct_num="+ct_num; //�˾�â�� ��µ� ������ URL
		var popOption = "width=570, height=560, resizable=no, scrollbars=no, status=no;"; //�˾�â �ɼ�(optoin)
		window.open(popUrl, "", popOption);
	}
	
	$(function(){
		$('.insertClassMany').click(function(){
			var result = confirm('������û�� �Ͻðڽ��ϱ�?');
			var p_num = $("#p_num").val();
			var p_token = $("#p_token").val();
			var ct_num_ary = [];
		    $("input[name='ckd']:checked").each(function(i) {
		       ct_num_ary.push($(this).val());
		    });
			var allData = { "p_num": p_num, "ct_num_ary": ct_num_ary, "p_token" :p_token};
			if(result){
				 $.ajax({
        			url:'insertClass',
        			type:'post',
        			data: {p_num : p_num, ct_num_ary : ct_num_ary, p_token : p_token},
        			success:function(data){
        				if(confirm('������û �Ϸ�! ������������ �̵��Ͻðڽ��ϱ�')){
        					location.replace('registerDoginList');
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
			type="hidden" value="${sessionScope.p_token }" name="p_token" id="p_token">
		<input type="hidden" value="${sessionScope.p_num }" name="p_num"
			id="p_num">
		<table class="table">
			<c:forEach var="listv" items="${list }">
				<tr>
					<td><input type="checkbox" name="ckd" value="${listv.ct_num }">${listv.ct_sub }</td>
					<td>${listv.cnt}��/(${listv.ct_period }��)</td>
					<td><input type="button" value="�󼼺���"
						onclick="javascript:popupOpen(${listv.ct_num})"></td>
					<td><input type="button" value="������û" id="insertClassOne"></td>
				</tr>
				<tr>
					<td colspan="3">��${listv.ct_star }��</td>
					<td>������ : ${listv.ct_hit }</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="������û" class="insertClassMany">
	</form>
</div>

