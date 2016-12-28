package or.clearn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import or.clearn.dao.NoticeDao;
import or.clearn.service.Paging;
import or.vo.SearchNoticeVO;

// �� Ŭ������ @Controller ������̼��� ����Ͽ� ���� Ŭ������ ���Ǵ� ������ �����ݴϴ�.
// �� Ŭ������ ���� �������׸��� ���� ���Դϴ�.
@Controller
public class NoticeController {

	// String�� �����ڷ������� ����� pagingCode�� ����¡ó���� �ϱ� ���Ͽ� ����� �����Դϴ�.
	private String pagingCode;

	// �� ������ @Value ������̼��� ����Ͽ� properties�� �ۼ��� numPerBlock�� ����ϱ� ���� ���� �Դϴ�.
	// �� ������ ����ϸ� �������� ��� ���� ������ �� �ֽ��ϴ�.
	// �� ) [1] [2] [3] [4] [5]
	@Value("#{props['numPerBlock']}")
	private int numPerBlock;

	// �� ������ @Value ������̼��� ����Ͽ� properties�� �ۼ��� numPerPage�� ����ϱ� ���� ���� �Դϴ�.
	// �� ������ ����ϸ� ������ �ȿ� �ִ� �Խñ��� ���� ������ �� �ֽ��ϴ�.
	@Value("#{props['numPerPage']}")
	private int numPerPage;

	// ���������� ���� �������� 1�� ������ �־����ϴ�.
	public NoticeController() {
		int nowPage = 1;
	}

	// ������̼�(@Autowired)�� ����Ͽ� �����ͺ��̽��� ����ϱ� ���� dao�� �����߽��ϴ�.
	@Autowired
	private NoticeDao noticeDao;

	// ���������� ����ϱ� ���� ���� ��������ϴ�.
	@RequestMapping(value = "adminNoticeForm")
	public String viewNotice() {
		return "adminNoticeForm";
	}

	// �������� �Խù��� ����ϴ� �۾��Դϴ�.
	@RequestMapping(value = "/adminNoticeAdd", method = RequestMethod.POST)
	public ModelAndView adminNoticeAdd(SearchNoticeVO snvo) {
		ModelAndView mav = new ModelAndView("redirect:/adminNoticeList?nowPage=1");
		noticeDao.noticeAdd(snvo);
		return mav;
	}

	// �ۼ��� �Ϸ�� ���������� ����� �����ִ� method�Դϴ�.
	@RequestMapping(value = "/adminNoticeList")
	public ModelAndView adminNoticeList(SearchNoticeVO snvo, Integer nowPage) {
		// SearchNoticeVO�� ����Ͽ� SearchNoticeVO �ȿ� �ִ� start���� end���� �����ϱ� ����
		// �����Դϴ�.
		// Integer�� �����ڷ����� nowPage�� �������ݴϴ�.

		// ����¡ ó���� ���� ��ȣ�Դϴ�.
		int start = 0;
		// ����¡ ó���� ������ ��ȣ�Դϴ�.
		int end = 0;
		// int�� �Ϲ��ڷ����� total �̶�� ������ ������ �� noticeDao���� �Խñ��� �� ���� �����ɴϴ�.
		int total = noticeDao.noticeListTotal();
		// ���� �Խñ��� �� ���� 0 �̶��
		if (total == 0) {
			// numPerPage�� 1�� �������ְ�, 
			numPerPage = 1;
			// numPerBlock�� 1�� ������ �ݴϴ�.
			numPerBlock = 1;
			
			// �Խñ��� �� ���� 0�� �ƴ϶��
			
			// total�� ���� 
		} else { 
			numPerPage = 10; // numPerPage�� ���� 10����
			numPerBlock = 5; // numPerBlock�� ���� 5�� �������ְ�,
			start = (nowPage - 1) * numPerPage + 1; // ���� ��ȣ�� (���� ������ - 1) * ������
													// ������ ������ �� (10) + 1�� �ؼ�
			// ���� �������� ���� 1�̶�� (1 - 1 = 0) * (10 + 1)�� �ؼ� 11�� �Ǵϱ� 10���� �߶� ����
			// �������� 1�̶�� (1 ~ 10) ����
			// ���� �������� 2��� (11 ~ 20)���� �߶���ϴ�.
			end = start + numPerPage - 1;
		}
		// Paging Ŭ������ ���� �����ɴϴ�. (�ʿ��� ���� ���ñ��� �� ��, ����������, numPerPage���� numPerBlock, �̵��� �ּ�)
		Paging page = new Paging(total, nowPage, numPerPage, numPerBlock, "adminNoticeList");
		// pagingCode ������ PagingŬ������ PagingCode�� getter�� �������ݴϴ�.
		pagingCode = page.getPagingCode();
		
		// ModelAndView�� �����ϰ�, �� �ȿ� ViewName�� �ۼ��Ѵ�.
		ModelAndView mav = new ModelAndView("adminNoticeList");
		// list�� �����ϰ� �� �ȿ� ������ ����� �ִ´�.
		List<SearchNoticeVO> list1 = noticeDao.noticeListFix();
		// list�� �����ϰ� �� �ȿ� �������� �ʰ� ���¡ ó���� �� ����� �ִ´�. (start���� end���� �ֱ�)
		List<SearchNoticeVO> list2 = noticeDao.noticeList(new SearchNoticeVO(start, end));
		//�信 ������ list��� ����¡ ó���� �� pagingCode, nowPage�� �����Ѵ�.
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("nowPage", nowPage);
		mav.addObject("pagingCode", pagingCode);
		// ModelAndView�� �����Ѵ�.
		return mav;
	}

	// �ۼ��� �Ϸ�� ���������� ����� �˻��ؼ� ������ method�Դϴ�.
	@RequestMapping(value = "/adminNoticeListSearch", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminNoticeListSearch(SearchNoticeVO snvo, int nowPage) {
		int start = (nowPage - 1) * numPerPage + 1;
		int end = start + numPerPage - 1;
		snvo.setStart(start);
		snvo.setEnd(end);
		int total = noticeDao.noticeListSearchTotal(snvo);
		// �� �޼��忡���� �˻� Ÿ�԰� �˻����� ���� �����Ѵ�.
		Paging page = new Paging(total, nowPage, numPerPage, numPerBlock, "adminNoticeListSearch", snvo.getSearchType(),
				snvo.getSearchValue());
		pagingCode = page.getPagingCode();
		ModelAndView mav = new ModelAndView("adminNoticeListSearch");
		List<SearchNoticeVO> list1 = noticeDao.noticeListFix();
		List<SearchNoticeVO> list2 = noticeDao.noticeListSearch(snvo);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("nowPage", nowPage);
		mav.addObject("pagingCode", pagingCode);
		return mav;
	}

	// ���������� ���������� �����ְ� ��ȸ���� ������ų method�Դϴ�.
	@RequestMapping(value = "/adminNoticeDetail")
	public ModelAndView adminNoticeDetail(int n_num) {

		SearchNoticeVO snvo = noticeDao.noticeDetail(n_num);
		int nowPage = 1;
		if (snvo.getNowPage() > 0) {
			nowPage = snvo.getNowPage();
		}
		noticeDao.noticeUpdateHit(n_num);
		ModelAndView mav = new ModelAndView("adminNoticeDetail");
		mav.addObject("snvo", snvo);
		mav.addObject("n_num", n_num);
		mav.addObject("nowPage", nowPage);
		return mav;
	}

	// ���������� ������ ���Դϴ�.
	@RequestMapping(value = "/adminNoticeUpform")
	public ModelAndView adminNoticeUpform(int n_num) {
		SearchNoticeVO snvo = noticeDao.noticeDetail(n_num);
		ModelAndView mav = new ModelAndView("adminNoticeUpform");
		mav.addObject("snvo", snvo);
		mav.addObject("n_num", n_num);
		return mav;
	}

	// �������� ������ ó���� method�Դϴ�.
	@RequestMapping(value = "/adminNoticeUpdate", method = RequestMethod.POST)
	public ModelAndView adminNoticeUpdate(SearchNoticeVO snvo) {
		noticeDao.noticeUpdate(snvo);
		int n_num = snvo.getN_num();
		ModelAndView mav = new ModelAndView("redirect:/adminNoticeDetail?n_num=" + n_num);
		return mav;
	}

	// ���������� ������ method�Դϴ�.
	@RequestMapping(value = "/adminNoticeDelete")
	public ModelAndView adminNoticeDelete(SearchNoticeVO snvo) {
		int nowPage = 1;
		if (snvo.getNowPage() > 0) {
			nowPage = snvo.getNowPage();
		}
		noticeDao.noticeDelete(snvo.getN_num());
		ModelAndView mav = new ModelAndView("redirect:/adminNoticeList?nowPage=" + nowPage);
		return mav;
	}

	// ���ݱ����� ������ ���������� �ʿ��� method���̾����ϴ�.
	// -----------------------------------------------------------------------------------------------------------------------------------------------------------
	// ���ݺ��ʹ� ����� ���������� �ʿ��� method���Դϴ�.
	// method���� ������ ���� ������ ����Ʈ �������� �˻��� ����Ʈ ������, ���������Դϴ�.
	
	
	// �������� ����Ʈ
	@RequestMapping(value = "/noticeList")
	public ModelAndView noticeList(SearchNoticeVO snvo, Integer nowPage) {
		int start = 0;
		int end = 0;
		int total = noticeDao.noticeListTotal();
		// System.out.println(total);
		if (total == 0) {
			numPerPage = 1;
			numPerBlock = 1;
		} else {
			numPerPage = 10;
			numPerBlock = 5;
			start = (nowPage - 1) * numPerPage + 1;
			end = start + numPerPage - 1;
		}
		Paging page = new Paging(total, nowPage, numPerPage, numPerBlock, "noticeList");
		pagingCode = page.getPagingCode();
		// System.out.println(start);
		// System.out.println(end);
		ModelAndView mav = new ModelAndView("noticeList");
		List<SearchNoticeVO> list1 = noticeDao.noticeListFix();
		List<SearchNoticeVO> list2 = noticeDao.noticeList(new SearchNoticeVO(start, end));
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("nowPage", nowPage);
		mav.addObject("pagingCode", pagingCode);
		return mav;
	}

	// �������� �˻� ����Ʈ
	@RequestMapping(value = "/noticeListSearch", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeListSearch(SearchNoticeVO snvo, int nowPage) {
		int start = (nowPage - 1) * numPerPage + 1;
		int end = start + numPerPage - 1;
		snvo.setStart(start);
		snvo.setEnd(end);
		int total = noticeDao.noticeListSearchTotal(snvo);
		// System.out.println("--------------------------------------------------------");
		// System.out.println("total:" + total);
		// System.out.println("start2:" + snvo.getStart());
		// System.out.println("end2:" + snvo.getEnd());
		Paging page = new Paging(total, nowPage, numPerPage, numPerBlock, "noticeListSearch", snvo.getSearchType(),
				snvo.getSearchValue());
		pagingCode = page.getPagingCode();
		ModelAndView mav = new ModelAndView("noticeListSearch");
		// System.out.println("�˻�Ÿ��1:" + snvo.getSearchType());
		// System.out.println("�˻�value1:" + snvo.getSearchValue());
		List<SearchNoticeVO> list1 = noticeDao.noticeListFix();
		List<SearchNoticeVO> list2 = noticeDao.noticeListSearch(snvo);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("nowPage", nowPage);
		mav.addObject("pagingCode", pagingCode);
		// System.out.println("�˻�Ÿ��2:" + snvo.getSearchType());
		// System.out.println("�˻�value2:" + snvo.getSearchValue());
		return mav;
	}

	// �������� �������� + ��ȸ�� ����
	@RequestMapping(value = "/noticeDetail")
	public ModelAndView noticeDetail(int n_num) {

		SearchNoticeVO snvo = noticeDao.noticeDetail(n_num);
		int nowPage = 1;
		if (snvo.getNowPage() > 0) {
			nowPage = snvo.getNowPage();
		}
		noticeDao.noticeUpdateHit(n_num);
		ModelAndView mav = new ModelAndView("noticeDetail");
		mav.addObject("snvo", snvo);
		mav.addObject("n_num", n_num);
		mav.addObject("nowPage", nowPage);
		return mav;
	}
}
