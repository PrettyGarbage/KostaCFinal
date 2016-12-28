package or.clearn.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import or.clearn.service.ContChapInsertInter;
import or.vo.ChapEnrollVO;
import or.vo.ContentEnrollVO;

@Controller
public class Cont_ChapController {

	@Autowired
	private ContChapInsertInter service;

	// �������� é�͸� �Բ� ����ϴ� ���Դϴ�.
	@RequestMapping(value = "/contChapForm")
	public String adminenrollView() {
		return "adminenroll";
	}
	// �������� é�͸� �Բ� ����ϴ� �۾��� ó���մϴ�.
	@RequestMapping(value = "insertRegister", method = RequestMethod.POST)
	public ModelAndView insertAll(ContentEnrollVO ctvo, ChapEnrollVO chvo, MultipartFile chap_file,
		HttpServletRequest request) throws Exception {
		System.out.println("������������????");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
//		for(ChapEnrollVO vo : chvo.getList()){
			String r_path = session.getServletContext().getRealPath("/");
			System.out.println("Root_RealPath : " + r_path);
			String chap_path = "\\resources\\chapterupload\\";
			StringBuffer sb = new StringBuffer();
			sb.append(r_path).append(chap_path);
			String oriFn = chap_file.getOriginalFilename();
			sb.append(oriFn);
			System.out.println("�������� ���� : " + oriFn);
			File f = new File(sb.toString());
			try {
				chap_file.transferTo(f); // ���� ���ε� ��
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			chvo.setCh_file(oriFn);
			// DB�۾�
			service.insertAll(ctvo, chvo);
//		}
		mav.setViewName("redirect:/index");
		return mav;

	}
}
