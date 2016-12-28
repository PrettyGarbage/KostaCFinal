package or.clearn.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import or.clearn.dao.ReplyDao;
import or.vo.ReplyVo; 

@Controller
public class ReplyController {
  
	@Autowired 
	private ReplyDao dao;

	// bbs1Comm.kosta : insert Comment
	@RequestMapping(value = "/replyComm", method = RequestMethod.POST)
	public ModelAndView replyComm(ReplyVo vo, String p_nickname) {
		System.out.println("��������� �°Ŵ�?");
		int p_num = dao.getp_num(p_nickname);
		vo.setP_num(p_num);
		dao.insertrplay(vo);
		// Deatil�� �̵� �� get������� ���� detail�� �ĺ�����
		// kcode������ �����ؾ� �Ѵ�.!
		StringBuffer redirect = new StringBuffer();
		redirect.append("redirect:/momBoardDetail?ib_num=");
		redirect.append(vo.getIb_num());
		return new ModelAndView(redirect.toString());
	}

	// ��� ����Ʈ
//	@RequestMapping(value = "/replyList") 
//	public ModelAndView replyList(int ib_num, int ic_num) {
//		System.out.println("��������� �Ǵ°ǰ�?"); 
//		ModelAndView mav = new ModelAndView("replyList");
//		System.out.println("�� ���� �ȵǴ� ����?");  
//		List<ReplyVo> list = dao.getreplyList(ib_num); 
//		mav.addObject("list", list);
//		mav.addObject("ib_num", ib_num);
//		mav.addObject("ic_num", ic_num);
//		return mav;
//	}    
//	
	@RequestMapping(value = "/replyDel") 
	public ModelAndView replyDel(ReplyVo vo) {
		System.out.println("��� ����ž�");
		ModelAndView mav = new ModelAndView("redirect:/momBoardDetail?ib_num="+vo.getIb_num());
		System.out.println("�� ���� �ȵǴ� ����?");  
		dao.replyDelete(vo); 
		return mav;
	}
}    
