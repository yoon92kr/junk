// 2022.01.10 윤상현

package com.myspring.baroip.adminNotice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminNoticeController {
	
	// 공지관리 페이지 전체 mapping	
	public ModelAndView adminNotice(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//	관리자페이지 공지관리 리스트 컨트롤러
	public ModelAndView adminNoticeList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 공지 등록 컨트롤러
	public ModelAndView addNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 공지 삭제 컨트롤러
	public String deleteNotice(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 공지 수정 양식 컨트롤러
	public ModelAndView updateNoticeForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 공지 수정 컨트롤러
	public ModelAndView updateNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest Request, HttpServletResponse response) throws Exception;
	
	// 상품 조회 필터 사용시, 세션에 있는 상품정보를 확인 후 서비스로 처리하는 메소드
	public Map<String, Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;
	
}