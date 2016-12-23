package or.clearn.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import or.clearn.dao.LoginDao;
import or.vo.ParentVO;

@Controller
public class LoginController {

	@Autowired
	private LoginDao loginDao;
	@Autowired
	private JavaMailSender mailSender;

	/*
	 * @RequestMapping(value={"/","index"}) public String indexView(){ return
	 * "index"; }
	 */

	@RequestMapping(value = "/loginform")
	public ModelAndView loginView() {
		ModelAndView mav = new ModelAndView("loginform");
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(String id, String pw, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/index");
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		int admin_res = loginDao.adminloginProcess(id, pw);
		int parent_res = loginDao.userloginProcess(id, pw);
		ParentVO pvo = loginDao.getParent(id);
		String msg = "";
		if (admin_res > 0) {
			msg = "������ �α��� ����";
			session.setAttribute("uid", loginDao.getAdminNick(id));
			session.setAttribute("p_num", loginDao.getAdminNum(id));
			session.setAttribute("role", "admin");
		} else if (parent_res > 0) {
			msg = "����� �α��� ����";
			session.setAttribute("uid", pvo.getP_nickname());
			session.setAttribute("p_num", pvo.getP_num());
			session.setAttribute("p_token", pvo.getP_token());
			session.setAttribute("p_id", pvo.getP_id());
			session.setAttribute("role", "user");
			System.out.println("p_token:" + session.getAttribute("p_token"));
		} else {
			msg = "�α��� ����";
			mav.setViewName("accessfail");
		}
		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("uid");
		session.removeAttribute("p_num");
		session.removeAttribute("p_token");
		session.removeAttribute("p_id");
		System.out.println("remove:" + session.getAttribute("p_token"));
		return new ModelAndView("redirect:/index");
	}

	@RequestMapping(value = "/idsearch")
	public String idsearchView() {
		return "idsearch_view";
	}

	@RequestMapping(value = "/pwsearch")
	public String pwsearchView() {
		return "pwsearch_view";
	}

	@RequestMapping(value = "/get_id")
	public ModelAndView get_id(String p_mail) {
		System.out.println("p_mail : " + p_mail);
		ModelAndView mav = new ModelAndView("yourid");
		String found_id = loginDao.yourid(p_mail);
		mav.addObject("p_id", found_id);
		return mav;
	}

	@RequestMapping(value = "/new_pw") // ���ο� �ӽ� ��й�ȣ ���Ϸ� ������ DB �����ϴ� model
	public ModelAndView new_pw(String p_id, String p_mail) throws AddressException, MessagingException {
		ModelAndView mav = new ModelAndView("redirect:/index");
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < 10; i++) {
			if (rnd.nextBoolean()) {
				buf.append((char) ((int) (rnd.nextInt(26)) + 97));
			} else {
				buf.append((rnd.nextInt(10)));
			}
		}
		System.out.println("�������� : " + buf.toString());
		String new_pw = buf.toString();
		loginDao.newpwUpdate(p_id, new_pw); // �ӽ� ��й�ȣ�� db ����
		StringBuffer text = new StringBuffer();
		text.append("CLearn �ӽ� ��й�ȣ�� '").append(new_pw).append("' �Դϴ�.");
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		String from = "''";
		mimeMessage.setFrom(new InternetAddress(from));
		mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(p_mail));
		mimeMessage.setSubject("CLearn �ӽ� ��й�ȣ�Դϴ�.");
		mimeMessage.setText(text.toString(), "UTF-8", "html");
		mailSender.send(mimeMessage);
		return mav;
	}

	@RequestMapping(value = "/findid") // ���̵� ã�� �̸��Ϸ� ������ȣ ���� �����ִ� model
	public ModelAndView findID(String p_name, String p_mail)
			throws UnsupportedEncodingException, AddressException, MessagingException {
		p_name = URLDecoder.decode(p_name, "utf-8");
		p_mail = URLDecoder.decode(p_mail, "utf-8");
		ParentVO vo = new ParentVO();
		vo.setP_name(p_name);
		vo.setP_mail(p_mail);
		ModelAndView mav = new ModelAndView("ajax/idfindresult");
		int search_res = loginDao.checkID(vo);
		System.out.println("search_res : " + search_res);
		String msg = null;
		if (search_res > 0) {
			Random rnd = new Random();
			StringBuffer buf = new StringBuffer();
			for (int i = 0; i < 6; i++) {
				if (rnd.nextBoolean()) {
					buf.append((char) ((int) (rnd.nextInt(26)) + 97));
				} else {
					buf.append((rnd.nextInt(10)));
				}
			}
			System.out.println("�������� : " + buf.toString());
			msg = buf.toString();
			StringBuffer text = new StringBuffer();
			text.append("CLearn ������ȣ�� '").append(msg).append("' �Դϴ�.");
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			String from = "''";
			System.out.println("�α�");
			mimeMessage.setFrom(new InternetAddress(from));
			mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(p_mail));
			mimeMessage.setSubject("CLearn ���̵� ã�� �̸��� �����Դϴ�.");
			mimeMessage.setText(text.toString(), "UTF-8", "html");
			mailSender.send(mimeMessage);
			mav.addObject("msg", msg);
		} else {
			mav.addObject("msg", msg);
		}
		return mav;
	}

	@RequestMapping(value = "/findpw") // ��й�ȣ ã�� ������ȣ �̸��Ϸ� ������ model
	public ModelAndView findPWD(String p_name, String p_id, String p_mail)
			throws UnsupportedEncodingException, AddressException, MessagingException {
		p_name = URLDecoder.decode(p_name, "utf-8");
		p_mail = URLDecoder.decode(p_mail, "utf-8");
		p_id = URLDecoder.decode(p_id, "utf-8");
		ParentVO vo = new ParentVO();
		vo.setP_name(p_name);
		vo.setP_mail(p_mail);
		vo.setP_id(p_id);
		ModelAndView mav = new ModelAndView("ajax/pwfindresult");
		int search_res = loginDao.checkPWD(vo);
		String msg = null;
		if (search_res > 0) {
			Random rnd = new Random();
			StringBuffer buf = new StringBuffer();
			for (int i = 0; i < 6; i++) {
				if (rnd.nextBoolean()) {
					buf.append((char) ((int) (rnd.nextInt(26)) + 97));
				} else {
					buf.append((rnd.nextInt(10)));
				}
			}
			System.out.println("�������� : " + buf.toString());
			msg = buf.toString();
			StringBuffer text = new StringBuffer();
			text.append("CLearn ������ȣ�� '").append(msg).append("' �Դϴ�.");
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			String from = "''";
			mimeMessage.setFrom(new InternetAddress(from));
			mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(p_mail));
			mimeMessage.setSubject("CLearn ��й�ȣ ã�� �̸��� �����Դϴ�.");
			mimeMessage.setText(text.toString(), "UTF-8", "html");
			mailSender.send(mimeMessage);
			mav.addObject("msg", msg);
		} else {
			mav.addObject("msg", msg);
		}
		return mav;
	}

}
