<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.0.min.js"></script>
<script>
	$(function() {
		var $tab = $('div.tabMenu>.tabGroup>li');
		var $sub = $('div.tabMenu>.subGroup>li');
		var i = 0;

		// �ѱ� ���� �����ش�.
		$('#tab1').show();
		// �ѱ� ���� ���� ��������
		$('#tab1').css('color', 'red');
		// ���� ���� ���� ��������
		$('#tab2').css('color', 'black');
		// ���� ���� ���� �������� �����ش�.
		$('#tab3').css('color', 'black');
		// �ѱ� ����Ʈ�� �ε��Ѵ�.
		$('#subTab1').load('registerAddListLoad?cc_num=3');
		// ���� ����Ʈ�� ���� ����Ʈ�� �����.
		$('#subTab2').hide();
		$('#subTab3').hide();

		$tab.click(function() {
			i = $(this).index();
			$sub.hide();
			$sub.eq(i).show();
		});
	});
</script>
<script>
	$(function() {
		// �ѱ� ���� Ŭ���ϸ�
		$('#tab1').click(function() {
			// �ѱ� ����Ʈ�� �ε��Ѵ�.
			$('#subTab1').load('registerAddListLoad?cc_num=3');
			// �ѱ� ���� ���� ��������
			$('#tab1').css('color', 'red');
			// ���� ���� ���� ��������
			$('#tab2').css('color', 'black');
			// ���� ���� ���� �������� �����ش�.
			$('#tab3').css('color', 'black');
		});
		// ���� ���� Ŭ���ϸ�
		$('#tab2').click(function() {
			// ���� ����Ʈ�� �ε��Ѵ�.
			$('#subTab2').load('registerAddListLoad?cc_num=1');
			// ���� ���� ���� ��������
			$('#tab2').css('color', 'red');
			// �ѱ� ���� ���� ��������
			$('#tab1').css('color', 'black');
			// ���� ���� ���� �������� �����ش�.
			$('#tab3').css('color', 'black');
		});
		// ���� ���� Ŭ���ϸ�
		$('#tab3').click(function() {
			// ���� ����Ʈ�� �ε��Ѵ�.
			$('#subTab3').load('registerAddListLoad?cc_num=2');
			// ���� ���� ���� ��������
			$('#tab3').css('color', 'red');
			// �ѱ� ���� ���� ��������
			$('#tab1').css('color', 'black');
			// ���� ���� ���� �������� �����ش�.
			$('#tab2').css('color', 'black');
		});
	});
</script>
<style>
.tabMenu {
	width: 1000px;
}
</style>
<div class="tabMenu">
	<ul style="list-style: none;" class="tabGroup">
		<li id="tab1" style="float: left; border: 1px solid; font-size: 20px;">&nbsp;&nbsp;&nbsp;�ѱ�&nbsp;&nbsp;&nbsp;</li>
		<li id="tab2" style="float: left; border: 1px solid; font-size: 20px;">&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;</li>
		<li id="tab3" style="float: left; border: 1px solid; font-size: 20px;">&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;</li>
	</ul>
	<ul style="list-style: none;" class="subGroup">
		<li id="subTab1"></li>
		<li id="subTab2"></li>
		<li id="subTab3"></li>
	</ul>
</div>
