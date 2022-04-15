// 2021.12.28 ������

package com.mat.modernblanco.adminUser.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.user.vo.UserVO;

public interface AdminUserController {

	// ��ü ȸ�� ��� ����Ʈ
	public ModelAndView userList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// ȸ�� ���� ���� ��Ʈ�ѷ�
	public String updateRank(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;

	// ȸ�� ���� ��Ʈ�ѷ�
	public String delete_user(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;

	// ȸ�� ���������� �̵� ��, ���� ���ε� ��Ʈ�ѷ�
	public ModelAndView update_user_form(@RequestParam("user_id") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ȸ������ ���� ��Ʈ�ѷ�
	public ModelAndView updateUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
