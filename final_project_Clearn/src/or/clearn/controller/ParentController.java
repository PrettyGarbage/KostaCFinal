package or.clearn.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import or.clearn.dao.ParentDao;
import or.clearn.service.Paging;
import or.vo.ParentVO;
import or.vo.SearchParentVO;

@Controller
public class ParentController {
	@Autowired
	private ParentDao parentDao;
	private String pagingCode;
	@RequestMapping(value =  "/member")
	public String member() {
		return "member";
	}
	
	@Value("#{props['numPerBlock']}")
	private int numPerBlock;

	@Value("#{props['numPerPage']}")
	private int numPerPage;

	public ParentController() {
		int nowPage = 1;
	}

	@Autowired
	private ParentDao parentdao;
	
	@RequestMapping(value="/adminParentList")
	public ModelAndView adminParentList(SearchParentVO spvo, Integer nowPage){
		int start = 0;
		int end = 0;
		int total = parentdao.parentlisttotal();
		if(total == 0){
			numPerPage = 1;
			numPerBlock = 1;
		} else {
			numPerPage = 10;
			numPerBlock = 5;
			start = (nowPage - 1) * numPerPage + 1;
			end = start + numPerPage - 1;
		}
		Paging page = new Paging(total, nowPage, numPerPage, numPerBlock, "adminParentList");
		pagingCode = page.getPagingCode();
		ModelAndView mav = new ModelAndView("adminParentList");
		List<SearchParentVO> list = parentdao.parentlist(new SearchParentVO(start, end));
		mav.addObject("list", list);
		mav.addObject("nowPage",nowPage);
		mav.addObject("pagingCode",pagingCode);
		return mav;
	}
	@RequestMapping(value = "/adminParentListSearch", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminParentListSearch(SearchParentVO spvo, int nowPage){
		int start = (nowPage - 1) * numPerPage + 1;
		int end = start + numPerPage - 1;
		spvo.setStart(start);
		spvo.setEnd(end);
		int total = parentdao.parentlisttotalsearch(spvo);
		Paging page = new Paging(total, nowPage, numPerPage, numPerBlock, "adminParentListSearch", spvo.getSearchType(),
				spvo.getSearchValue());
		pagingCode = page.getPagingCode();
		ModelAndView mav = new ModelAndView("adminParentListSearch");
		List<SearchParentVO> list = parentdao.parentlistsearch(spvo);
		mav.addObject("list",list);
		mav.addObject("nowPage", nowPage);
		mav.addObject("pagingCode", pagingCode);
		return mav;
	}
	@RequestMapping(value="/adminParentDetail")
	public ModelAndView adminParentDetail(int p_num){
		SearchParentVO spvo = parentdao.parentdetailadmin(p_num);
		int nowPage = 1;
		if(spvo.getNowPage() > 0){
			nowPage = spvo.getNowPage();
		}
		ModelAndView mav = new ModelAndView("adminParentDetail");
		mav.addObject("spvo", spvo);
		mav.addObject("p_num", p_num);
		mav.addObject("nowPage", nowPage);
		return mav;
	}
	
	// ȸ���������� ó��0 00
	@RequestMapping(value = "/memberadd", method = RequestMethod.POST)
	public ModelAndView addMem(ParentVO vo, String p_phone1, String p_phone2, String p_phone3, MultipartFile img_file,
			HttpServletRequest request) {
		// -----------------------------------
		ModelAndView mav = new ModelAndView();
		// �̹����� ����� ���� ��� ����
		HttpSession session = request.getSession();
		// PageContext�� �ش�. // ���� resources/img�� ��θ� ��� ����
		String r_path = session.getServletContext().getRealPath("/");
		System.out.println("Root_RealPath : " + r_path);
		String img_path = "\\resources\\upload\\";
		StringBuffer sb = new StringBuffer();
		sb.append(r_path).append(img_path);
		// ----------------------------------------
		// upload�� �����̸��� path�� ����
		String oriFn = img_file.getOriginalFilename();
		// �ϼ��� ��ο� �̹��� �����̸� �߰�
		sb.append(oriFn);
		// ��ο� ������ �ϼ�----------------------------------------
		System.out.println("�������� ���� : " + oriFn);
		// ���� ���ε� ��ų ��θ� �߻�ȭ�ؼ� File��ü�� ����
		File f = new File(sb.toString());
		// �߻�ȭ�� File��ü�� String�� �ʰ��� ���� ���ε� ��Ŵ
		try {
			img_file.transferTo(f); // ���� ���ε� ��
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		vo.setP_pic(oriFn);
		vo.setP_phone(p_phone1 + p_phone2 + p_phone3);
		vo.setP_token(UUID.randomUUID().toString().replace("-", ""));
		parentDao.addParent(vo);
		mav.setViewName("redirect:/index");
		return mav;
		// ------------------------------------
		// vo.setP_phone(p_phone1 + p_phone2+ p_phone3);
		// vo.setP_token(UUID.randomUUID().toString().replace("-", ""));
		// parentDao.addParent(vo);
		// return new ModelAndView("redirect:/member");
	}

	// ���̵� �ߺ� Ȯ��
	@RequestMapping(value = "/parentIdChk")
	public ModelAndView checkId(String p_id) {
		int res = parentDao.checkId(p_id);
		String m = "";
		char chrInput = ' ';
		System.out.println("����Ʈ �� : " + res);
		for (int i = 0; i < p_id.length(); i++) {
			chrInput = p_id.charAt(i); // �Է¹��� �ؽ�Ʈ���� ���� �ϳ��ϳ� �����ͼ� üũ
			if (((chrInput >= 0x30 && chrInput <= 0x39) || (chrInput >= 0x61 && chrInput <= 0x7A)
					|| (chrInput >= 0x41 && chrInput <= 0x5A)) && res <= 0) {
				m = "<p style='color:blue'> ��밡���� ���̵� �Դϴ�. </p>";
			} else if (res > 0) {
				m = "<p style='color:red'> �̹� �����ϴ� ���̵� �Դϴ�. </p>";
			} else {
				m = "<p style='color:red'> ���̵�� ������ ���ڸ� �Է��� �����մϴ�. </p>";
			}
		}
		ModelAndView mav = new ModelAndView("ajax/idChk");
		mav.addObject("res", m);
		return mav;
	}

	// �г����ߺ�Ȯ��
	@RequestMapping(value = "/parentNicknamechk")
	public ModelAndView checknickname(String p_nickname) throws UnsupportedEncodingException {
		p_nickname = URLDecoder.decode(p_nickname, "utf-8");
		int res = parentDao.checknickname(p_nickname);
		System.out.println("res : "+res);
		System.out.println("���ڵ��� �ȵƴ�?"+p_nickname);
		String m = "";
		if (res > 0) {
			m = "<p style='color:red'> �̹� �����ϴ� �г��� �Դϴ�. </p>";
		} else {
			m = "<p style='color:blue'> ��� ������ �г��� �Դϴ�. </p>";
		}
		ModelAndView mav = new ModelAndView("ajax/nicknamechk");
		mav.addObject("res", m);
		return mav;
	}

	@RequestMapping(value = "/parentupform")
	public ModelAndView parentupform(int p_num) throws UnsupportedEncodingException {
		ParentVO pvo = parentDao.parentdetail(p_num);
		pvo.setP_pic(URLDecoder.decode(pvo.getP_pic(), "utf-8"));
		ModelAndView mav = new ModelAndView("parentupform");
		String phone2 = pvo.getP_phone().substring(3, 7);
		String phone3 = pvo.getP_phone().substring(7, 11);
		System.out.println(phone2);
		System.out.println(phone3);
		mav.addObject("pvo", pvo);
		mav.addObject("phone2",phone2);
		mav.addObject("phone3",phone3);
		mav.addObject("p_num", p_num);
		return mav;
	}

	@RequestMapping(value = "/parentdetail")
	public ModelAndView pardetail(HttpSession session) throws UnsupportedEncodingException {
		ParentVO res = parentDao.parentdetail((int) session.getAttribute("p_num"));
		res.setP_pic(URLDecoder.decode(res.getP_pic(), "utf-8"));
		System.out.println(res.getP_pic().toString());
		ModelAndView mav = new ModelAndView("parentdetail");
		mav.addObject("parentVO", res);
		return mav;
	}

	@RequestMapping(value = "/parentupdate", method = RequestMethod.POST)
	public ModelAndView parentupdate(ParentVO vo, String p_phone1, String p_phone2, String p_phone3,
			MultipartFile img_file, HttpServletRequest request) {
		System.out.println("�׽�Ʈ");
		ModelAndView mav = new ModelAndView();
		// �̹����� ����� ���� ��� ����
		HttpSession session = request.getSession();
		// PageContext�� �ش�. // ���� resources/img�� ��θ� ��� ����
		String r_path = session.getServletContext().getRealPath("/");
		System.out.println("Root_RealPath : " + r_path);
		String img_path = "\\resources\\upload\\";
		StringBuffer sb = new StringBuffer();
		sb.append(r_path).append(img_path);
		// ----------------------------------------
		// upload�� �����̸��� path�� ����
		String oriFn = img_file.getOriginalFilename();
		// �ϼ��� ��ο� �̹��� �����̸� �߰�
		sb.append(oriFn);
		// ��ο� ������ �ϼ�----------------------------------------
		System.out.println("�������� ���� : " + oriFn);
		// ���� ���ε� ��ų ��θ� �߻�ȭ�ؼ� File��ü�� ����
		File f = new File(sb.toString());
		String delete_file = parentDao.getdeletefile(vo.getP_num());
		File delete_f = new File(r_path+img_path + delete_file);
		System.out.println("�α׷α� ���� �̸�"+delete_f);
		System.out.println("�α׷α�" + delete_f.exists());
		if (delete_f.exists()) {
			delete_f.delete();
		}
		// �߻�ȭ�� File��ü�� String�� �ʰ��� ���� ���ε� ��Ŵ
		try {
			img_file.transferTo(f); // ���� ���ε� ��
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		vo.setP_pic(oriFn);
		vo.setP_phone(p_phone1 + p_phone2 + p_phone3);
		// vo.setP_token(UUID.randomUUID().toString().replace("-", ""));
		parentDao.parentupdate(vo);
		int p_num = vo.getP_num();
		mav.setViewName("redirect:/parentdetail?p_num=" + p_num);
		return mav;
		// parentDao.parentupdate(vo);
		// int p_num = vo.getP_num();
		// System.out.println("������Ʈ ����"+vo.getP_num());
		// ModelAndView mav = new ModelAndView();
		// System.out.println("�ѿ��� ��� : " + p_num);
		// mav.setViewName("redirect:/parentdetail?p_num="+p_num);
		// return mav;
	}

	// �������� �г����ߺ�Ȯ��
	@RequestMapping(value = "/parentupnickname")
	public ModelAndView parnickname(String p_nickname) {
		int res = parentDao.checknickname(p_nickname);
		System.out.println(res);
		System.out.println(p_nickname);
		String m = "";
		if (res > 0) {
			m = "<p style='color:red'> �̹� �����ϴ� �г��� �Դϴ�. </p>";
		} else {
			m = "<p style='color:blue'> ��� ������ �г��� �Դϴ�. </p>";
		}
		ModelAndView mav = new ModelAndView("parentupnickname");
		mav.addObject("res", m);
		return mav;
	}
}
