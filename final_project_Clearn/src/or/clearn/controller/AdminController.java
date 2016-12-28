package or.clearn.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import or.clearn.dao.AdminDao;
import or.vo.AdminVO;


@Controller
public class AdminController {
	@Autowired
	private AdminDao admindao; //��������

	@RequestMapping(value = { "/adminform" }) // /adminform �� �������� �̵� �� �� �ְ� ��
	public String adminform() { //�޼��� ����
		return "adminform"; // �� ������
	}

	@RequestMapping(value = "/adminmenu") //  "/adminmenu", "/" jsp�̵�
	public String adminmenu() { //�޼��� ����
		System.out.println("TEST"); // ���� ��� ������ �׽�Ʈ	
		return "adminmenu"; //���� ������
	}

	// ȸ���������� ó��0 00
	@RequestMapping(value = "/adminadd", method = RequestMethod.POST)
	public ModelAndView addMem(AdminVO vo, HttpServletRequest request) {
		// -----------------------------------
		ModelAndView mav = new ModelAndView(); //mav ��� �̸��� �ο���
		admindao.addAdmin(vo);//admindao �� �ִ� addAdmin �� vo ���� �ְ�
		mav.setViewName("redirect:/adminmenu"); // ���� ���� ���� �޴��� �����Ѵ�
		return mav;
	}

	// ���̵� �ߺ� Ȯ��
	@RequestMapping(value = "/adminIdChk")
	public ModelAndView checkId(String a_id) { //�޼��� ����
		int res = admindao.checkId(a_id); // admindao.checkId(a_id) �� ������ res�� �־���
		String m = ""; // �׿� ���� ���
		char chrInput = ' '; // �ѱ� �� Ư������ ������
		System.out.println("����Ʈ �� : " + res);
		for (int i = 0; i < a_id.length(); i++) {
			chrInput = a_id.charAt(i); // �Է¹��� �ؽ�Ʈ���� ���� �ϳ��ϳ� �����ͼ� üũ
			if (((chrInput >= 0x30 && chrInput <= 0x39) || (chrInput >= 0x61 && chrInput <= 0x7A)
					|| (chrInput >= 0x41 && chrInput <= 0x5A)) && res <= 0) {
				m = "<p style='color:blue'> ��밡���� ���̵� �Դϴ�. </p>";
			} else if (res > 0) {
				m = "<p style='color:red'> �̹� �����ϴ� ���̵� �Դϴ�. </p>"; //���ǿ� �ݴ�Ǹ� �� ������ ���
			} else {
				m = "<p style='color:red'> ���̵�� ������ ���ڸ� �Է��� �����մϴ�. </p>"; 
			}
		}
		ModelAndView mav = new ModelAndView("ajax/idChk");//"ajax/idChk" mav�� �־���
		mav.addObject("res", m);//
		return mav;// ���� ������
	}

	// �г����ߺ�Ȯ��
	@RequestMapping(value = "/adminNicknamechk")
	public ModelAndView checknickname(String a_nickname) {
		int res = admindao.checknickname(a_nickname);// admindao.checknickname(a_nickname) �� res�� �־��� 
		System.out.println(res);//res���� ���´��� Ȯ��
		System.out.println(a_nickname);
		String m = "";
		if (res > 0) {
			m = "<p style='color:red'> �̹� �����ϴ� �г��� �Դϴ�. </p>"; 
		} else {
			m = "<p style='color:blue'> ��� ������ �г��� �Դϴ�. </p>"; //���ǿ� �������� ������ �� ������ ����
		}
		ModelAndView mav = new ModelAndView("ajax/nicknamechk");//new ModelAndView("ajax/nicknamechk") mav�� �־���
		mav.addObject("res", m);// ���� m���� ������
		return mav;// ���� ������
	}
}
