package com.mat.modernblanco.user.controller;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.user.vo.UserVO;



public interface UserController {
	
//	�α���
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

//	�α׾ƿ�
	public ModelAndView logout(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	ȸ������
	public ModelAndView addUser(@ModelAttribute("user") UserVO user,
            HttpServletRequest request, HttpServletResponse response) throws Exception;

//	���̵� �ߺ� �˻�
	public String userIdOverlap(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	�ڵ��� ���� ����
	public String userMobileCheck(@RequestParam("mobile") String mobile)throws Exception;
	
//	�̸��� ����
	public String emailCheck(@RequestParam("user_email") String user_email)throws Exception;
	
//	���̵� ã��
	public ModelAndView userIdFind(@RequestParam("user_name") String user_name, @RequestParam("user_mobile") String user_mobile, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	��й�ȣ ã��
	public String userPwdFind(@RequestParam("user_id") String user_id, @RequestParam("pwdFindType") String pwdFindType, HttpServletRequest request) throws Exception;
	
//	��й�ȣ ã�� �� ��й�ȣ ����
	public String changeUserPwd(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw, ServletRequest request) throws Exception;
	
}

	