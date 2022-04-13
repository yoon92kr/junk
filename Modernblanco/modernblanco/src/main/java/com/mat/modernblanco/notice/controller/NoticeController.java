// 2021.12.24 �Ӽ���

package com.mat.modernblanco.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.notice.vo.NoticeVO;

public interface NoticeController {
	
	public ModelAndView notice(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	�������� ����Ʈ ������
	public ModelAndView notice_list(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;

//	�������� ��
	public ModelAndView notice_detail(@RequestParam("NoticeVO") String notice_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	��ǰ �ı�
	public ModelAndView productComment(@RequestParam("product_id") String product_id, @RequestParam Map<String, String> info,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	��ǰ ����
	public ModelAndView PQAListPage(@RequestParam("product_id") String product_id, @RequestParam Map<String, String> info,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	��ǰ ���� �ۼ� ������
	public ModelAndView add_PQA_form(@RequestParam("product_id") String product_id, @RequestParam("product_main_title") String product_main_title, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	��ǰ ���� �ۼ�
	public ModelAndView add_PQA(NoticeVO noticeVO) throws Exception;
	
}
