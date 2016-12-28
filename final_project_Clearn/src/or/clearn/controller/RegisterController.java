package or.clearn.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import or.clearn.dao.RegisterDao;
import or.clearn.service.DoStarUpdateImple;
import or.clearn.service.DoStarUpdateInter;
import or.vo.DostarVO;
import or.vo.RegisterAddListVO;
import or.vo.RegisterClassListVO;
import or.vo.RegisterDoingVO;
import or.vo.RegisterDoneVO;

@Controller
public class RegisterController {

	@Autowired
	private RegisterDao registerDao;
	@Autowired
	private DoStarUpdateInter dostar;

	// ������û ����Ʈ (�ε�Ǵ� ��)
	@RequestMapping(value = "/registerAddListLoad")
	public ModelAndView registerAddListLoad(int cc_num) {
		ModelAndView mav = new ModelAndView("ajax/registerAddListLoad");
		List<RegisterAddListVO> list = registerDao.registerAddList(cc_num);
		mav.addObject("list", list);
		System.out.println("list ct_num : " + list.get(0).getCt_num());
		mav.addObject("cc_num", cc_num);
		return mav;
	}

	// ������ ���� ����Ʈ���� �������� ������ ���� ���ϰ� �������.
	// ������ �����Ǹ� p_token�� ���� �ٲ� �����̹Ƿ� �� �� �ִ�.
	@RequestMapping(value = "registerAddListView")
	public ModelAndView registerAddListView(HttpSession session) {
		String p_id = (String) session.getAttribute("p_id");
		String p_token = registerDao.getp_token(p_id);
		session.removeAttribute("p_token");
		session.setAttribute("p_token", p_token);
		ModelAndView mav = new ModelAndView();
		if (p_id.equals(p_token)) { // ���̵�� ��ū�� ���� ������ index�������� ����
			mav.setViewName("index");
			mav.addObject("status", "���� ������ ����Ʈ���� ���������ּ���.");
		} else { // ���̵�� ��ū�� ���� �ٸ��� registerAddList(������û ������)�� ������ �������.
			mav.setViewName("registerAddList");
		}
		return mav;
	}

	/*
	 * @RequestMapping(value = "/registerClassList") public ModelAndView
	 * registerClassList(int ct_num) { System.out.println("ct_num" + ct_num);
	 * ModelAndView mav = new ModelAndView("registerClassList");
	 * List<RegisterClassListVO> list = registerDao.registerClassList(ct_num);
	 * mav.addObject("list", list); mav.addObject("ct_num", ct_num); return mav;
	 * }
	 */

	// ���� ���� ����Ʈ
	@RequestMapping(value = "/registerDoginList")
	public ModelAndView registerDoginList(HttpSession session) {
		int p_num = (int) session.getAttribute("p_num"); // p_num�� session����
															// �����´�.
		List<RegisterDoingVO> list = new ArrayList<RegisterDoingVO>(); // RegisterDoingVO��
																		// ArrayList��
																		// �����.
		List<Integer> ct_list = registerDao.getct_list(p_num); // ������ ����Ʈ�� ��������
																// �����´�.
		for (Integer ct_num : ct_list) { // �������� ��� for���� ����Ͽ� �����´�.
			RegisterDoingVO vo = new RegisterDoingVO();
			vo.setP_num(p_num); // �θ��� ��ȣ��
			vo.setCt_num(ct_num); // �������� ��ȣ��
			for (RegisterDoingVO v : registerDao.registerDoginList(vo)) {// for������
																			// �����鼭
																			// �����´�.
				list.add(v); // ������ ���� ����Ʈ�� �ִ´�.
			}
		}
		for (RegisterDoingVO vo : list) { // �ۼ�Ʈ�� �������� ���ؼ� �������� ����Ʈ�� for������ ������.
			vo.setCnt_ch_num(registerDao.get_cntchnum(vo)); // é���� ���� �����´�.
			vo.setCnt_cl_done(registerDao.get_cntcldone(vo)); // �����Ϸ�� ���� �����´�.
			float percent = ((float) vo.getCnt_cl_done() / (float) vo.getCnt_ch_num()) * 100;
			// ������ �� ���� �̿��Ͽ� �ۼ�Ʈ�� ���Ѵ�.
			vo.setPercent((int) percent); // ���� �ۼ�Ʈ�� vo�� �ִ� ������ �ִ´�.
		}
		ModelAndView mav = new ModelAndView("ajax/registerDoginList");
		mav.addObject("list", list);
		return mav;
	}

	// �������� ������ ���� ���
	@RequestMapping(value = "/registerClassList")
	public ModelAndView registerChapList(int ct_num, HttpSession session) throws ParseException {
		RegisterDoingVO vo = new RegisterDoingVO();
		vo.setP_num((int) session.getAttribute("p_num")); // p_num�� session������
															// �޴´�.
		vo.setCt_num(ct_num); // ������ ���� vo�� �ִ´�.
		ModelAndView mav = new ModelAndView("registerClassList");
		List<RegisterDoingVO> list = registerDao.getChaplist(vo); // é�͸���Ʈ
		System.out.println("*******" + list.get(0).getV_num());
		SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd"); // �ð��� ǥ��
		Date date = new Date(); // ��¥�� ������
		for (RegisterDoingVO v : list) { // vo�� list�� �ִ´�.
			if (v.getCl_date() != null) { // ���� ��¥�� null�̸�
				System.out.println(v.getCl_date());
				date = df.parse(v.getCl_date()); // ��¥�� setting
				v.setCl_date(df.format(date)); // vo�� ��¥�� ����
				System.out.println("after : " + v.getCl_date());
			}
		}
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/registerManagerList")
	public String registerManagerList() {
		return "registerManagerList";
	}

	// ���� �Ϸ�� ���� ����Դϴ�.
	@RequestMapping(value = "/registerDoneList") // session�� ���ڰ����� �޽��ϴ�.
	public ModelAndView registerDoneList(HttpSession session) {
		int p_num = (int) session.getAttribute("p_num"); // p_num�� session������
															// �޽��ϴ�.
		List<RegisterDoneVO> list = new ArrayList<RegisterDoneVO>();
		List<Integer> ct_list = registerDao.getct_list_done(p_num);
		// ������ ����Ʈ�� �Ϸ�� ���� dao�� �ְ� ���ڰ����� p_num�� �޽��ϴ�.
		for (Integer ct_num : ct_list) { // for������ �������� �� ����Ʈ�� �޽��ϴ�.
			RegisterDoneVO vo = new RegisterDoneVO();
			vo.setP_num(p_num); // setter�� p_num�� �ֽ��ϴ�.
			vo.setCt_num(ct_num); // setter�� ct_num�� �ֽ��ϴ�.
			System.out.println("ct_num : " + ct_num);
			for (RegisterDoneVO v : registerDao.registerDoneList(vo)) { // �Ϸ��
																		// �����
																		// vo��
																		// �ְ�
																		// ��������
				list.add(v); // list�� �߰��մϴ�.
			}
		}
		for (RegisterDoneVO vo : list) { // ����Ʈ�� vo�� �ֽ��ϴ�.
			vo.setCnt_ch_num(registerDao.get_cntchnum_done(vo)); // é�� ���� �޽��ϴ�.
			vo.setCnt_cl_done(registerDao.get_cntcldone_done(vo)); // ���� �Ϸ��� ����
																	// �޽��ϴ�.
			float percent = ((float) vo.getCnt_cl_done() / (float) vo.getCnt_ch_num()) * 100; // �ۼ�Ʈ��
																								// ���մϴ�.
			vo.setPercent((int) percent); // vo�� ���� �ۼ�Ʈ�� �ֽ��ϴ�.
		}
		ModelAndView mav = new ModelAndView("ajax/registerDoneList");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/dostar")
	public ModelAndView dostar(DostarVO vo) {
		ModelAndView mav = new ModelAndView("redirect:/registerDoneList");
		try {
			dostar.starUpdate(vo); // transaction ó���� update���� �����ŵ�ϴ�.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
