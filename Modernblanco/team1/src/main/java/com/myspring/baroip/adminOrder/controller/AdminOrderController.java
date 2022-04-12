// 2021.12.09 윤상현

package com.myspring.baroip.adminOrder.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminOrderController {

	// 관리자 페이지 주문 관리 전체 매핑
	public ModelAndView adminOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//  관리자 페이지 주문 관리 리스트
	public ModelAndView orderList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 주문 상태 수정 컨트롤러
	public String update_amount(@RequestParam Map<String, String> info) throws Exception;
	
	// 주문 상세페이지 컨트롤러
	public ModelAndView orderDetail(@ModelAttribute("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//  반품 / 교환 요청 리스트 컨트롤러
	public ModelAndView returnList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 반품 신청서 상세페이지 컨트롤러
	public ModelAndView returnDetail(@ModelAttribute("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 주문 상태 수정 컨트롤러
	public String updateReturnState(@RequestParam Map<String, String> info) throws Exception;
	
}
