// 2022.02.10 ������

package com.mat.modernblanco.guest.controller;

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

import com.mat.modernblanco.order.service.OrderService;

@Controller("guestController")
@RequestMapping(value = "/guest")
public class GuestControllerImpl implements GuestController {

	@Autowired
	private OrderService orderService;

	// ��ȸ�� �ֹ���ȸ �˾� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/search_order.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView searchOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

			mav.setViewName(viewName);

		return mav;
	}

	// ��ȸ�� �ֹ� ����ȸ ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/guest_order_detail.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ModelAndView guestOrderDetail(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		
		List<Map<String, Object>> guestOrder = orderService.guestOrderDetail(info);
		
		if(guestOrder.isEmpty()) {
			session.setAttribute("message", "�ֹ� ������ �ٽ� Ȯ�����ּ���.");
			mav.setViewName("redirect:/user/loginpage.do");
		}
		else {
			mav.addObject("guestOrder", guestOrder);
			mav.setViewName(viewName);
		}
		return mav;
	}
	
	// ��ȸ�� �ֹ� ��� ��Ʈ�ѷ�
	@Override
	@ResponseBody
	@RequestMapping(value = "/cancelOrder.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String cancelOrder(HttpServletRequest request, @RequestParam("order_id") String orderID) throws Exception {

		String message = orderService.cancelOrder(orderID);

		return message;
	}

	

}
