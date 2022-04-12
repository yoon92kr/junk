package com.myspring.baroip.cs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface CsController {
	
	// cs 전체 매핑 컨트롤러
	public ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//	FAQ 리스트 컨트롤러
	public ModelAndView FAQList(@RequestParam Map<String, String> info, HttpServletRequest request,	HttpServletResponse response) throws Exception;
	
	//	UQA 리스트 컨트롤러
	public ModelAndView UQAList(@RequestParam Map<String, String> info, HttpServletRequest request,	HttpServletResponse response) throws Exception;

	//	UQA 등록 컨트롤러
	public ModelAndView addUQA(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//	UQA 수정 폼 컨트롤러
	public ModelAndView UQAUpdateForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	// UQA 수정 컨트롤러
	public ModelAndView UQAUpdate(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// UQA 상세 컨트롤러
	public ModelAndView UQADetail(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	//	UQA 삭제 컨트롤러
	public String deleteUQA(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
