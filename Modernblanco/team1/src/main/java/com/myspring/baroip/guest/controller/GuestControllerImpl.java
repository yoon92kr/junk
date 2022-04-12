// 2022.02.10 윤상현

package com.myspring.baroip.guest.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.order.service.OrderService;

@Controller("guestController")
@RequestMapping(value = "/guest")
public class GuestControllerImpl implements GuestController {

	@Autowired
	private OrderService orderService;

	// 비회원 주문조회 팝업 컨트롤러
	@Override
	@RequestMapping(value = "/search_order.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView searchOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

			mav.setViewName(viewName);

		return mav;
	}

	// 비회원 주문 상세조회 컨트롤러
	@Override
	@RequestMapping(value = "/guest_order_detail.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ModelAndView guestOrderDetail(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		
		List<Map<String, Object>> guestOrder = orderService.guestOrderDetail(info);
		
		if(guestOrder.isEmpty()) {
			session.setAttribute("message", "주문 정보를 다시 확인해주세요.");
			mav.setViewName("redirect:/user/loginpage.do");
		}
		else {
			mav.addObject("guestOrder", guestOrder);
			mav.setViewName(viewName);
		}
		return mav;
	}
	
	// 비회원 주문 취소 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/cancelOrder.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String cancelOrder(HttpServletRequest request, @RequestParam("order_id") String orderID) throws Exception {

		String message = orderService.cancelOrder(orderID);

		return message;
	}

	

}
