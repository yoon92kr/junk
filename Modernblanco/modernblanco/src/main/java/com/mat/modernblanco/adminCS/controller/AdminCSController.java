// 2022.02.10 ������

package com.mat.modernblanco.adminCS.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.notice.vo.NoticeVO;

public interface AdminCSController {

	//	���� ���� ��Ʈ�ѷ�
	public ModelAndView QAList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// �ı� ���� ��Ʈ�ѷ�
	public ModelAndView reviewList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// CS ���� ��Ʈ�ѷ�
	public String deleteCS(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// CS �亯 �߰� ��� ��Ʈ�ѷ�
	public ModelAndView addQAForm(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//review �亯 �߰� ��� ��Ʈ�ѷ�
	public ModelAndView addReviewForm(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// CS �亯 �߰� ��Ʈ�ѷ�
	public ModelAndView addCS(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest Request, HttpServletResponse response) throws Exception;
	
	// CS ��ȸ ���� ����, ���ǿ� �ִ� �˻� ���� ������ Ȯ�� �� ���񽺷� ó���ϴ� �޼ҵ�
	public List<Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;
	
	// QA �������� ��Ʈ�ѷ�
	public ModelAndView QADetail(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// review �������� ��Ʈ�ѷ�
	public ModelAndView reviewDetail(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
}