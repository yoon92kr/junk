package com.myspring.baroip.user.controller;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.user.vo.UserVO;



public interface UserController {
	
//	로그인
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

//	로그아웃
	public ModelAndView logout(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	회원가입
	public ModelAndView addUser(@ModelAttribute("user") UserVO user,
            HttpServletRequest request, HttpServletResponse response) throws Exception;

//	아이디 중복 검사
	public String userIdOverlap(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	핸드폰 본인 인증
	public String userMobileCheck(@RequestParam("mobile") String mobile)throws Exception;
	
//	이메일 인증
	public String emailCheck(@RequestParam("user_email") String user_email)throws Exception;
	
//	아이디 찾기
	public ModelAndView userIdFind(@RequestParam("user_name") String user_name, @RequestParam("user_mobile") String user_mobile, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	비밀번호 찾기
	public String userPwdFind(@RequestParam("user_id") String user_id, @RequestParam("pwdFindType") String pwdFindType, HttpServletRequest request) throws Exception;
	
//	비밀번호 찾기 후 비밀번호 변경
	public String changeUserPwd(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw, ServletRequest request) throws Exception;
	
}

	