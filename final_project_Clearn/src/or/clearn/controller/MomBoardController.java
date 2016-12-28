package or.clearn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import or.clearn.dao.MomBoardDao;
import or.clearn.service.MomBoardDeleteInter;
import or.clearn.service.Paging;
import or.vo.MomBoardVo;
import or.vo.ReplyVo;

@Controller
public class MomBoardController {

	private String pagingCode; 

	@Value("#{props['numPerBlock']}")
	private int numPerBlock;

	@Value("#{props['numPerPage']}")
	private int numPerPage;

	public MomBoardController() { 
		int nowPage = 1;
	}

	@Autowired
	private MomBoardDeleteInter service;
	
	@Autowired
	private MomBoardDao momBoardDao;
	 
//	@Autowired
//	private ReplyDao dao;
  
	// �������� ��� ��
//	@RequestMapping(value = "momform")
//	public String viewmomBoard() {
//
//		return "momBoardForm";
//	} 
  
	// �������� ��� ó��
	@RequestMapping(value = "/momBoardAdd", method = RequestMethod.POST)
	public ModelAndView momBoardAdd(MomBoardVo mvo) {
		System.out.println("���������? addadd");
		ModelAndView mav = new ModelAndView("redirect:/momBoardList?nowPage=1");
		momBoardDao.insertMomBoard(mvo);
		return mav;
	} 
//
//	@RequestMapping(value = "/momBoardAdd")
//	public ModelAndView momBoardAdd2() {
//		System.out.println("222222222222");
//		ModelAndView mav = new ModelAndView("redirect:/momBoardList?nowPage=1");
//		return mav;
//	}

	// �������� ����Ʈ
	@RequestMapping(value = "/momBoardList")
	public ModelAndView momBoardList(MomBoardVo mvo, Integer nowPage) {
		int start = 0;
		int end = 0;
		int total = momBoardDao.totalMomboard1();
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
		Paging page = new Paging(total, nowPage, numPerPage, numPerBlock, "momBoardList");
		pagingCode = page.getPagingCode();
		System.out.println(pagingCode);
		System.out.println(start);
		System.out.println(end);
		System.out.println("��������� �Ǵ°ǰ�?");
		ModelAndView mav = new ModelAndView("momBoardList");
		System.out.println("�� ���� �ȵǴ� ����?");
		List<MomBoardVo> list2 = momBoardDao.listMomBoard1(new MomBoardVo(start, end));
		mav.addObject("list2", list2);
		mav.addObject("nowPage", nowPage);
		mav.addObject("pagingCode", pagingCode);
		return mav;
	}

	// �������� �˻� ����Ʈ
	@RequestMapping(value = "/momBoardListSearch", method = { RequestMethod.GET })
	public ModelAndView momBoardListSearch(MomBoardVo mvo, int nowPage) {
		int start = (nowPage - 1) * numPerPage + 1;
		int end = start + numPerPage - 1;
		mvo.setStart(start);
		mvo.setEnd(end);
		int total = momBoardDao.totalMomboard2(mvo);
		// System.out.println("--------------------------------------------------------");
		// System.out.println("total:" + total);
		// System.out.println("start2:" + snvo.getStart());
		// System.out.println("end2:" + snvo.getEnd());
		Paging page = new Paging(total, nowPage, numPerPage, numPerBlock, "momBoardListSearch", mvo.getSearchType(),
				mvo.getSearchValue());
		pagingCode = page.getPagingCode(); 
		ModelAndView mav = new ModelAndView("momBoardList");
		System.out.println("�˻�Ÿ��1:" + mvo.getSearchType());
		System.out.println("�˻�value1:" + mvo.getSearchValue());
		List<MomBoardVo> list2 = momBoardDao.listMomBoard2(mvo);
		System.out.println("��������� ����");
		mav.addObject("list2", list2);
		mav.addObject("nowPage", nowPage);
		mav.addObject("pagingCode", pagingCode);
        
		// System.out.println("�˻�Ÿ��2:" + snvo.getSearchType());
		// System.out.println("�˻�value2:" + snvo.getSearchValue());
		return mav;
	}

	// �Խ��� �������� + ��ȸ�� ����
	@RequestMapping(value = "/momBoardDetail")
	public ModelAndView momBoardDetail(ReplyVo rvo, int ib_num) {

		MomBoardVo mvo = momBoardDao.momBoardDetail(ib_num);
		int nowPage = 1;
		if (mvo.getNowPage() > 0) {
			nowPage = mvo.getNowPage();
		}
		momBoardDao.momBoardUpdateHit(ib_num); 
  
		List<ReplyVo> list = momBoardDao.getreplyList(ib_num);
		ModelAndView mav = new ModelAndView("momBoardDetail");
		mav.addObject("mvo", mvo);
		mav.addObject("ib_num", ib_num);
		mav.addObject("nowPage", nowPage);
		// -------------------------------- *************---------------
		mav.addObject("list", list);
		mav.addObject("ib_num", ib_num);
		return mav;
	}

	// �������� ���� ��
	@RequestMapping(value = "/momBoardUpform", method = { RequestMethod.GET })
	public ModelAndView momBoardUpform(int ib_num) {
		MomBoardVo mvo = momBoardDao.momBoardDetail(ib_num);
		ModelAndView mav = new ModelAndView("momBoardUpform");
		mav.addObject("mvo", mvo);
		mav.addObject("ib_num", ib_num);
		return mav;
	}

	// �������� ����
	@RequestMapping(value = "/momBoardUpdate")
	public ModelAndView momBoardUpdate(MomBoardVo mvo) {
		momBoardDao.momBoardUpdate(mvo);
		int ib_num = mvo.getIb_num();
		System.out.println("������ �ǳ�");
		ModelAndView mav = new ModelAndView("redirect:/momBoardDetail?ib_num=" + ib_num);
		return mav;
	}

	@RequestMapping(value = "/momBoardforum")
	public ModelAndView momBoardForum(MomBoardVo mvo) {
		momBoardDao.momBoardUpdate(mvo);
		System.out.println("������ �ǳ�");
		ModelAndView mav = new ModelAndView("redirect:/momboardforum");
		return mav;
	}

	// �������� ���� 
	@RequestMapping(value = "/momBoardDelete")
	public ModelAndView momBoardDelete(MomBoardVo mvo) throws Exception {
		int nowPage = 1;
		if (mvo.getNowPage() > 0) {
			nowPage = mvo.getNowPage();
		}
		service.deleteAll(mvo.getIb_num());
		ModelAndView mav = new ModelAndView("redirect:/momBoardList?nowPage=" + nowPage);
		return mav;
	}
	
	
	@RequestMapping(value="/momBoardForm")
	public String viewIndex(){
		return "momBoardForm";
	} 

}
