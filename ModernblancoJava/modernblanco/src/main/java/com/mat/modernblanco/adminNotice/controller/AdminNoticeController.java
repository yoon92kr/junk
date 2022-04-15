// 2022.01.10 ������

package com.mat.modernblanco.adminNotice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.notice.vo.NoticeVO;

public interface AdminNoticeController {
	
	// �������� ������ ��ü mapping	
	public ModelAndView adminNotice(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//	������������ �������� ����Ʈ ��Ʈ�ѷ�
	public ModelAndView adminNoticeList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ���� ��� ��Ʈ�ѷ�
	public ModelAndView addNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// ���� ���� ��Ʈ�ѷ�
	public String deleteNotice(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ���� ���� ��� ��Ʈ�ѷ�
	public ModelAndView updateNoticeForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ���� ���� ��Ʈ�ѷ�
	public ModelAndView updateNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest Request, HttpServletResponse response) throws Exception;
	
	// ��ǰ ��ȸ ���� ����, ���ǿ� �ִ� ��ǰ������ Ȯ�� �� ���񽺷� ó���ϴ� �޼ҵ�
	public Map<String, Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;
	
}