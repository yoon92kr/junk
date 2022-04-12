// 2022.01.24 윤상현

package com.myspring.baroip.myPage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.notice.vo.NoticeVO;
import com.myspring.baroip.user.vo.UserVO;

public interface MyPageConroller {

	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView myInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView checkPassword(@RequestParam("user_pw") String user_pw, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원정보 수정 컨트롤러
	public ModelAndView updateMyInfo(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 조회 기준에 따른 주문정보 조회 컨트롤러
	public ModelAndView myOrder(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 주문 상태변경 컨트롤러
	public String updateOrder(HttpServletRequest request, @RequestParam Map<String, String> info) throws Exception;
	
	// 주문 취소 페이지 이동 컨트롤러
	public ModelAndView refundForm(@RequestParam("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 반품/교환 신청 컨트롤러
	public ModelAndView askRefund(@ModelAttribute("noticeVO") NoticeVO noticeVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	// 주문 상세페이지 컨트롤러
	public ModelAndView orderDetail(@ModelAttribute("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원 탈퇴
	public ModelAndView dropOut(HttpServletRequest request, HttpServletResponse response) throws Exception;
//	문의 리스트
	public ModelAndView myQuestion(HttpServletRequest request, @RequestParam Map<String, String> info) throws Exception;
	
//	문의 상세 페이지
	public ModelAndView QuestionDetail(@RequestParam("notice_id") String notice_id, HttpServletRequest request) throws Exception;
	
//	문의 삭제
	public ModelAndView questionDelete(@RequestParam("notice_id") String notice_id, HttpServletRequest request) throws Exception;
	
//	문의 수정
	public ModelAndView questionUpdate(@ModelAttribute("NoticeVO") NoticeVO noticeVO, HttpServletRequest request) throws Exception;
	
//	상품 후기 리스트
	public ModelAndView myComment(HttpServletRequest request, @RequestParam Map<String, String> info) throws Exception;
	
//	상품후기 작성
	public ModelAndView commentAdd(@ModelAttribute("noticeVO") NoticeVO noticeVO, MultipartHttpServletRequest multipartRequest) throws Exception;
	
//	상품 후기 삭제
	public ModelAndView myCommentDelete(@ModelAttribute("notice_id") String notice_id, HttpServletRequest request) throws Exception;
	
//	상품후기 수정 페이지
	public ModelAndView myCommentUpdate(@ModelAttribute("notice_id") String notice_id, HttpServletRequest request) throws Exception;

//	상품후기 수정
	public ModelAndView commentUpdate(@ModelAttribute("noticeVO") NoticeVO noticeVO, MultipartHttpServletRequest multipartRequest) throws Exception;
}


