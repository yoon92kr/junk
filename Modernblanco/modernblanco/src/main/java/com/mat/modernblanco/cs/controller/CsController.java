package com.mat.modernblanco.cs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.notice.vo.NoticeVO;

public interface CsController {
	
	// cs ��ü ���� ��Ʈ�ѷ�
	public ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//	FAQ ����Ʈ ��Ʈ�ѷ�
	public ModelAndView FAQList(@RequestParam Map<String, String> info, HttpServletRequest request,	HttpServletResponse response) throws Exception;
	
	//	UQA ����Ʈ ��Ʈ�ѷ�
	public ModelAndView UQAList(@RequestParam Map<String, String> info, HttpServletRequest request,	HttpServletResponse response) throws Exception;

	//	UQA ��� ��Ʈ�ѷ�
	public ModelAndView addUQA(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//	UQA ���� �� ��Ʈ�ѷ�
	public ModelAndView UQAUpdateForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	// UQA ���� ��Ʈ�ѷ�
	public ModelAndView UQAUpdate(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// UQA �� ��Ʈ�ѷ�
	public ModelAndView UQADetail(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	//	UQA ���� ��Ʈ�ѷ�
	public String deleteUQA(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
