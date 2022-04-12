// 2021.12.28 윤상현

package com.myspring.baroip.guest.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GuestController {

	// 비회원 주문조회 팝업 컨트롤러
	public ModelAndView searchOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 비회원 주문 상세조회 컨트롤러
	public ModelAndView guestOrderDetail(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;
	
	// 비회원 주문 취소 컨트롤러
	public String cancelOrder(HttpServletRequest request, @RequestParam("order_id") String orderID) throws Exception;

}
