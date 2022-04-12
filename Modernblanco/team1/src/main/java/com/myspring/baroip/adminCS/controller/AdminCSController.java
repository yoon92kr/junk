// 2022.02.10 윤상현

package com.myspring.baroip.adminCS.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminCSController {

	//	문의 관리 컨트롤러
	public ModelAndView QAList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 후기 관리 컨트롤러
	public ModelAndView reviewList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// CS 삭제 컨트롤러
	public String deleteCS(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// CS 답변 추가 양식 컨트롤러
	public ModelAndView addQAForm(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//review 답변 추가 양식 컨트롤러
	public ModelAndView addReviewForm(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// CS 답변 추가 컨트롤러
	public ModelAndView addCS(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest Request, HttpServletResponse response) throws Exception;
	
	// CS 조회 필터 사용시, 세션에 있는 검색 조건 정보를 확인 후 서비스로 처리하는 메소드
	public List<Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;
	
	// QA 상세페이지 컨트롤러
	public ModelAndView QADetail(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// review 상세페이지 컨트롤러
	public ModelAndView reviewDetail(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
}