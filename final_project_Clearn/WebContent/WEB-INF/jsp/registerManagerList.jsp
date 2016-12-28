<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script>
	$(function() {
		var $tab = $('div.tabMenu>.tabGroup>li');
		var $sub = $('div.tabMenu>.subGroup>li');
		var i = 0;
		// �������� ���� ���� �����ش�.
		$('#registerDoing').show();
		// �������� ���� ����Ʈ�� �ε��Ѵ�.
		$('#registerDoingList').load('registerDoginList');
		// �������� ���� ���� ���ڻ��� ����������
		$('#registerDoing').css('color', 'red');
		// ���� �Ϸ�� ���� ���� ���ڻ��� �˻������� �����ش�.
		$('#registerDone').css('color', 'black');
		// ���� �Ϸ�� ���� ���� �����.
		$('#registerDoneList').hide();

		// ���� Ŭ���ϸ�
		$tab.click(function() {
			// ���� ����ŭ �����ش�.
			i = $(this).index();
			// ����� �����.
			$sub.hide();
			// ����� ����ŭ �����ش�.
			$sub.eq(i).show();
		});
	});
</script>
<script>
	$(function() {
		// �������� ���� ���� Ŭ���ϸ�
		$('#registerDoing').click(function() {
			// �������� ���� ����Ʈ�� �ε��ϰ�
			$('#registerDoingList').load('registerDoginList');
			// �������� ���� ���� ���� ���������� �����ְ�
			$('#registerDoing').css('color', 'red');
			// ���� �Ϸ�� ���� ���� ���� ���������� �����ش�.
			$('#registerDone').css('color', 'black');
		});
		// ���� �Ϸ�� ���� ���� Ŭ���ϸ�
		$('#registerDone').click(function(num) {
			// ���� �Ϸ�� ���� ����Ʈ�� �ε��Ѵ�.
			$('#registerDoneList').load('registerDoneList');
			// ���� ���� ���� ���� ���� ���������� �����ش�.
			$('#registerDoing').css('color', 'black');
			// ���� �Ϸ�� ���� ���� ���� ���������� �����ش�.
			$('#registerDone').css('color', 'red');
		});
	});
</script>
<div class="tabMenu" style="width: 1000px;">
	<input type="hidden" value="${sessionScope.p_num }" name="p_num">
	<ul style="list-style: none;" class="tabGroup">
		<li id="registerDoing"
			style="float: left; border: 1px solid; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������
			����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
		<li id="registerDone"
			style="float: left; border: 1px solid; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����
			�Ϸ�� ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
	</ul>
	<ul style="list-style: none;" class="subGroup">
		<li id="registerDoingList"></li>
		<li id="registerDoneList"></li>
	</ul>
</div>
