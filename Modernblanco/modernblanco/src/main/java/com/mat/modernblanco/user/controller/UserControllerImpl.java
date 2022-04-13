// 2021.12.04 �Ѱ���
package com.mat.modernblanco.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.user.naver.NaverLoginBO;
import com.mat.modernblanco.user.service.UserService;
import com.mat.modernblanco.user.vo.UserVO;


@Controller("userController")
@RequestMapping(value="/user")
public class UserControllerImpl implements UserController{
	@Autowired
	private UserService userService;
	@Autowired
	private UserVO userVO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
//	user ����
	@RequestMapping(value= "/*" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
//	�α���
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> userMap,
				HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			HttpSession session=request.getSession();
			userVO=userService.login(userMap);
		 // �޾ƿ� userVo�� ��ȿ�� ����
		 if(userVO!= null && userVO.getUser_id()!=null) {
			// ���� ����
			session=request.getSession();
			// ���ӿ��� ���� set
			session.setAttribute("loginOn", true);
			// ȸ������ ���� set
			session.setAttribute("userInfo",userVO);
			
			userService.updateLastDate(userVO.getUser_id());

			mav.setViewName("redirect:/main.do");
			System.out.printf("baroip : ����[%s]������ [%s]���� �α��� �ϼ̽��ϴ�.%n", userVO.getUser_rank(), userVO.getUser_id());
		}
		else {
			String message = "���̵�  ��й�ȣ�� Ʋ���ϴ�. �ٽ� �α������ּ���.";
			mav.addObject("message", message);
			mav.setViewName("/user/loginpage");
		}
		return mav;
	}
	
//	���̹� �α��ν� �ʿ� ��
	@RequestMapping(value = "loginpage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView naverLogin(HttpSession session, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
	//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		//���̹�
		mav.addObject("url", naverAuthUrl);
		mav.setViewName(viewName);
		return mav;
	}
	
//	�α׾ƿ�
	@Override
	@RequestMapping(value = "/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("loginOn");
		session.removeAttribute("userInfo");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
//	ȸ������
	@Override
	@RequestMapping(value="/addUser.do" ,method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("userVO") UserVO userVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String user_name = userService.addUser(userVO);
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("user_name", user_name);
//			System.out.println(user_name);
			mav.setViewName("/user/welcomeUser");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
//	�ڵ�����ȣ ����
	@Override
	@ResponseBody
	@RequestMapping(value= "/userMobileCheck.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String userMobileCheck(@RequestParam("mobile") String mobile)throws Exception {
		int randomNumber = (int)((Math.random() * (9999 - 1000 * 1)) + 1000);
		userService.userPhoneCheck(mobile, randomNumber);
		return Integer.toString(randomNumber);
	}
	
//	�̸��� ����
	@ResponseBody
	@RequestMapping(value="/emailCheck.do",method={RequestMethod.POST,RequestMethod.GET})
	public String emailCheck(@RequestParam("user_email") String user_email)throws Exception {
		String subject = "�ٷ��� �̸��� ����";
		String content = "";
		String from = "yoon92kr@baroip.shop";
		String to = user_email;
		int randomNumber = (int)((Math.random() * (9999 - 1000 * 1)) + 1000);
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");;
			content = "�̸��� ���� ��ȣ�� " + randomNumber + " �Դϴ�.";
            mailHelper.setFrom(from);
            // �� ���̵� ������ ���� �ܼ��� smtp ������ �ޱ� ���� ��� ���� ��������(setFrom())�ݵ�� �ʿ�
            // �������̿� �����ּҸ� �����ϴ��̰� ���� ��� ǥ�� �ǰ� ���ϽŴٸ� �Ʒ��� �ڵ带 ����Ͻø� �˴ϴ�.
            //mailHelper.setFrom("�������� �̸� <�������� ���̵�@�������ּ�>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true�� html�� ����ϰڴٴ� �ǹ��Դϴ�.
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
		
		return Integer.toString(randomNumber);
	}
	
//	���̵� �ߺ� �˻�
	@Override
	@ResponseBody
	@RequestMapping(value="/userIdOverlap.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String userIdOverlap(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String result = userService.userIdOverlap(id);
		return result;
	}
	
//	���̵� ã��
	@Override
	@RequestMapping(value="/userIdFind.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView userIdFind(@RequestParam("user_name") String user_name, @RequestParam("user_mobile") String user_mobile, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		
		String mobile[] = user_mobile.split("-");
		String mobile_1 = mobile[0];
		String mobile_2 = mobile[1];
		String mobile_3 = mobile[2];
		
		userVO.setUser_name(user_name);
		userVO.setUser_mobile_1(mobile_1);
		userVO.setUser_mobile_2(mobile_2);
		userVO.setUser_mobile_3(mobile_3);
		
		String user_id = userService.userIdFind(userVO);
		
		if(user_id != "" && user_id != null) {
			Map<String, String> findUser = new HashMap<String, String>();
			findUser.put("user_name", user_name);
			findUser.put("user_id", user_id);
			mav.addObject("findUser", findUser);
			mav.setViewName("/user/findUserId");
		} else {
			String message = "�Է��Ͻ� ������ ��ġ�ϴ� ���̵� �����ϴ�.";
			mav.addObject("message", message);
			mav.setViewName("/user/findUserInfoPage");
		}
		return mav;
	}
	
//	��й�ȣ ã��
	@Override
	@ResponseBody
	@RequestMapping(value= "/userPwdFind.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String userPwdFind(@RequestParam("user_id") String user_id, @RequestParam("pwdFindType") String pwdFindType, HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		
		userVO.setUser_id(user_id);
		UserVO userCheck;
		String number;
		userCheck = userService.inputUserCheck(userVO);
		
//		�̸��� ����
		if(pwdFindType.contains("@")) {
			userVO.setUser_email(pwdFindType);
			
			if(userCheck.getUser_name() != null && userCheck.getUser_name() != "") {
				number = emailCheck(pwdFindType);
			} else {
				number = "0";
			}
//		�ڵ��� ��ȣ ����
		} else if(pwdFindType.contains("-")) {
			String mobile[] = pwdFindType.split("-");
			String mobile_1 = mobile[0];
			String mobile_2 = mobile[1];
			String mobile_3 = mobile[2];
			
			userVO.setUser_mobile_1(mobile_1);
			userVO.setUser_mobile_2(mobile_2);
			userVO.setUser_mobile_3(mobile_3);
			
			if(userCheck.getUser_name() != null && userCheck.getUser_name() != "") {
				number = userMobileCheck(pwdFindType);
			} else {
				number = "0";
			}
		} else {
			number = "0";
		}
		if(number.equals("0") != true) {
			session.setAttribute("userPwdChange", userCheck);
		}
		
		return number;
	}
	
//	��й�ȣ ã�� �� ��й�ȣ ����
	@Override
	@RequestMapping(value= "/changeUserPwdInput.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String changeUserPwd(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw, ServletRequest request) throws Exception {
		userVO.setUser_id(user_id);
		userVO.setUser_pw(user_pw);
		userService.updateUserPwd(userVO);
		
		return "/user/PwdUpdate";
	}
	
}
