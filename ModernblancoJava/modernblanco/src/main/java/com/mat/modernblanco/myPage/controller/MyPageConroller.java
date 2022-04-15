// 2022.01.24 ������

package com.mat.modernblanco.myPage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.notice.vo.NoticeVO;
import com.mat.modernblanco.user.vo.UserVO;

public interface MyPageConroller {

	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView myInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView checkPassword(@RequestParam("user_pw") String user_pw, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ȸ������ ���� ��Ʈ�ѷ�
	public ModelAndView updateMyInfo(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// ��ȸ ���ؿ� ���� �ֹ����� ��ȸ ��Ʈ�ѷ�
	public ModelAndView myOrder(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// �ֹ� ���º��� ��Ʈ�ѷ�
	public String updateOrder(HttpServletRequest request, @RequestParam Map<String, String> info) throws Exception;
	
	// �ֹ� ��� ������ �̵� ��Ʈ�ѷ�
	public ModelAndView refundForm(@RequestParam("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ��ǰ/��ȯ ��û ��Ʈ�ѷ�
	public ModelAndView askRefund(@ModelAttribute("noticeVO") NoticeVO noticeVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	// �ֹ� �������� ��Ʈ�ѷ�
	public ModelAndView orderDetail(@ModelAttribute("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ȸ�� Ż��
	public ModelAndView dropOut(HttpServletRequest request, HttpServletResponse response) throws Exception;
//	���� ����Ʈ
	public ModelAndView myQuestion(HttpServletRequest request, @RequestParam Map<String, String> info) throws Exception;
	
//	���� �� ������
	public ModelAndView QuestionDetail(@RequestParam("notice_id") String notice_id, HttpServletRequest request) throws Exception;
	
//	���� ����
	public ModelAndView questionDelete(@RequestParam("notice_id") String notice_id, HttpServletRequest request) throws Exception;
	
//	���� ����
	public ModelAndView questionUpdate(@ModelAttribute("NoticeVO") NoticeVO noticeVO, HttpServletRequest request) throws Exception;
	
//	��ǰ �ı� ����Ʈ
	public ModelAndView myComment(HttpServletRequest request, @RequestParam Map<String, String> info) throws Exception;
	
//	��ǰ�ı� �ۼ�
	public ModelAndView commentAdd(@ModelAttribute("noticeVO") NoticeVO noticeVO, MultipartHttpServletRequest multipartRequest) throws Exception;
	
//	��ǰ �ı� ����
	public ModelAndView myCommentDelete(@ModelAttribute("notice_id") String notice_id, HttpServletRequest request) throws Exception;
	
//	��ǰ�ı� ���� ������
	public ModelAndView myCommentUpdate(@ModelAttribute("notice_id") String notice_id, HttpServletRequest request) throws Exception;

//	��ǰ�ı� ����
	public ModelAndView commentUpdate(@ModelAttribute("noticeVO") NoticeVO noticeVO, MultipartHttpServletRequest multipartRequest) throws Exception;
}


