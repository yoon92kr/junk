// 2021.12.28 윤상현

package com.myspring.baroip.adminUser.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.user.vo.UserVO;

public interface AdminUserController {

	// 전체 회원 목록 리스트
	public ModelAndView userList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 회원 권한 수정 컨트롤러
	public String updateRank(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;

	// 회원 삭제 컨트롤러
	public String delete_user(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;

	// 회원 수정페이지 이동 전, 정보 바인딩 컨트롤러
	public ModelAndView update_user_form(@RequestParam("user_id") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원정보 수정 컨트롤러
	public ModelAndView updateUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
