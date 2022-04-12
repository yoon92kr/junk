// 2022.01.10 윤상현

package com.myspring.baroip.adminFAQ.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminFAQController {
	
	// FAQ 관리 페이지 전체 mapping	
	public ModelAndView adminFAQ(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//	관리자페이지 FAQ 관리 리스트 컨트롤러
	public ModelAndView adminFAQList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// FAQ 등록 컨트롤러
	public ModelAndView addFAQ(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// FAQ  삭제 컨트롤러
	public String deleteFAQ(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// FAQ  수정 양식 컨트롤러
	public ModelAndView updateFAQForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// FAQ  수정 컨트롤러
	public ModelAndView updateFAQ(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest Request, HttpServletResponse response) throws Exception;
	
	// FAQ 상세 컨트롤러
	public ModelAndView FAQDetail(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}