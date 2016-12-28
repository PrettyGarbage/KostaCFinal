package or.clearn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import or.clearn.dao.FaqBoardDao;
import or.vo.SearchFaqBoardVO;
// �����ϴ� ���� ����Ʈ�� �ѷ��� Ŭ�����Դϴ�.
@Controller
public class FaqBoardControllr {
	// �����ϴ� ���� ����Ʈ dao�����ͼ� �ڵ��� ���⸦ �մϴ�.(@AutoWired ������̼� ���)
	@Autowired
	private FaqBoardDao faqBoardDao;
	
	// �����ϴ� ���� �Խ��� ����Ʈ ��  �����Դϴ�.
	@RequestMapping(value="/adminFaqBoardList")
	public ModelAndView adminFaqBoardList(){
		List<SearchFaqBoardVO> list = faqBoardDao.faqboardList();
		ModelAndView mav = new ModelAndView("adminFaqBoardList");
		mav.addObject("list", list);
		return mav;
	}
	// �����ϴ� ���� �Խ��� �� �ε�� �亯 �Դϴ�.
	@RequestMapping(value="/adminFaqBoardListLoad")
	public ModelAndView adminFaqBoardListLoad(){
		List<SearchFaqBoardVO> list = faqBoardDao.faqboardList();
		ModelAndView mav = new ModelAndView("adminFaqBoardListLoad");
		mav.addObject("list", list);
		return mav;
	}
}
