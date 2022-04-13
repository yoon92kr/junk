// 2022.01.10 ������

package com.mat.modernblanco.adminFAQ.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.notice.vo.NoticeVO;

public interface AdminFAQController {
	
	// FAQ ���� ������ ��ü mapping	
	public ModelAndView adminFAQ(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//	������������ FAQ ���� ����Ʈ ��Ʈ�ѷ�
	public ModelAndView adminFAQList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// FAQ ��� ��Ʈ�ѷ�
	public ModelAndView addFAQ(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// FAQ  ���� ��Ʈ�ѷ�
	public String deleteFAQ(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// FAQ  ���� ��� ��Ʈ�ѷ�
	public ModelAndView updateFAQForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// FAQ  ���� ��Ʈ�ѷ�
	public ModelAndView updateFAQ(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest Request, HttpServletResponse response) throws Exception;
	
	// FAQ �� ��Ʈ�ѷ�
	public ModelAndView FAQDetail(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}