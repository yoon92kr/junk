// 2021.12.08 윤상현

package com.myspring.baroip.adminOrder.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.adminOrder.service.AdminOrderService;
import com.myspring.baroip.myPage.service.MyPageService;

@Controller("adminOrderController")
@RequestMapping(value = "/admin/order")
public class AdminOrderControllerImpl implements AdminOrderController {

	@Autowired
	private AdminOrderService adminOrderService;
	
	@Autowired
	private MyPageService myPageService;

	// 주문관리 페이지 전체 mapping
	@Override
	@RequestMapping(value = "/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/order_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		// get 요청이 없을경우, 기존의 session을 제거
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		List<Map<String, Object>> orderList = getFullList(info, request, "order");
		
		String pageNo = info.get("pageNo");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (orderList.size()+8)/9;
			
			if (Integer.parseInt(pageNo) > lastNo) {
				mav.addObject("pageNo", 1);
				mav.setViewName("redirect:"+viewName +".do");
			}
			else {
				mav.addObject("pageNo", pageNo);	
				mav.setViewName(viewName);
			}
			
		} else {
			mav.addObject("pageNo", 1);
			mav.setViewName(viewName);
		}
		mav.addObject("orderList", orderList);
		return mav;

	}
	
	// 주문 상태 수정 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/update_state.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public String update_amount(@RequestParam Map<String, String> info) throws Exception {

		String order_id = info.get("order_id");
		adminOrderService.updateState(info);
		
		String message = "주문 번호 ["+order_id+"] 의 상태가 배송중으로 변경 되었습니다.";

		System.out.printf("baorip : [%s]의 배송 상태가 [배송중]으로 변경되었습니다.%n", order_id);

		return message;
	}
	
	// 주문 상태 수정 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/update_return_state.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String updateReturnState(@RequestParam Map<String, String> info) throws Exception {

		String message = adminOrderService.updateReturnState(info);
		
		System.out.println("baroip : "+message);
		return message;

	}


	// 주문 조회 필터 사용시, 세션에 있는 주문정보 확인 후 서비스로 처리하는 메소드
	public List<Map<String, Object>> getFullList(Map<String, String> info, HttpServletRequest request,String option) throws Exception {
		
		HttpSession session = request.getSession();
		
		// Map options에는 조회하고자 하는 조건유형 option, 조건에 해당하는 value 가 반드시 포함되어야한다.
		// search_option(검색 조건) = value [orderDate / productId / userId/ states ]
		// search_value(검색 값) = value [yyyy-mm-dd,yyyy-mm-dd / product_id / user_id / 0 or 1 or 2)]
		Map<String, String> options = new HashMap<String, String>();
		
		String paramOption = info.get("search_option");
		String paramValue = info.get("search_value");
		
		String sessionOption = (String) session.getAttribute("search_option");
		String sessionValue = (String) session.getAttribute("search_value");
			
		// param, session 모두 option이 바인딩 되어있는 경우
		if (paramOption != null && sessionOption != null) {

				// 두 옵션이 일치할 경우, options에 기존 session의 값을 대입한다.
				if (paramOption.equals(sessionOption) && paramValue.equals(sessionValue)) {
					options.put("search_option", sessionOption);
					options.put("search_value", sessionValue);
				}

				// 두 옵션이 일치하지 않을 경우, options에 paramOption을 대입하고, 기존 세션을 Override 한다.
				else {
					options.put("search_option", paramOption);
					options.put("search_value", paramValue);

					session.setAttribute("search_option", paramOption);
					session.setAttribute("search_value", paramValue);
				}
			}

			// 세션에 바인딩된 option이 없을경우, options에 paramOption을 대입하고, 세션에 set 한다.
			else if (paramOption != null && sessionOption == null) {
				options.put("search_option", paramOption);
				options.put("search_value", paramValue);

				session.setAttribute("search_option", paramOption);
				session.setAttribute("search_value", paramValue);
			}
		
			// param에 바인딩된 option이 없을경우, session의 option을 대입한다.
			else if (paramOption == null && sessionOption != null) {
				options.put("search_option", sessionOption);
				options.put("search_value", sessionValue);
			}
		List<Map<String, Object>> fullList = new ArrayList<Map<String, Object>>();
		
		if(option.equals("order")) {
			fullList = adminOrderService.orderListToOption(options);
		}
		else {
			fullList = adminOrderService.selectRefundToOption(options);
		}
		
		
		return fullList;
	}
	
	// 주문 상세페이지 컨트롤러
	@Override
	@RequestMapping(value = "/orderDetail.do", method =RequestMethod.POST)
	public ModelAndView orderDetail(@ModelAttribute("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		List<Map<String, Object>> orderList = myPageService.orderDetail(order_id);

		mav.addObject("orderList", orderList);
		mav.setViewName(viewName);

		return mav;

	}
	

	@Override
	@RequestMapping(value = "/return_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView returnList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		// get 요청이 없을경우, 기존의 session을 제거
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		List<Map<String, Object>> orderList = getFullList(info, request, "refund");
		
		String pageNo = info.get("pageNo");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (orderList.size()+5)/6;
			
			if (Integer.parseInt(pageNo) > lastNo) {
				mav.addObject("pageNo", 1);
				mav.setViewName("redirect:"+viewName +".do");
			}
			else {
				mav.addObject("pageNo", pageNo);	
				mav.setViewName(viewName);
			}
			
		} else {
			mav.addObject("pageNo", 1);
			mav.setViewName(viewName);
		}
		mav.addObject("orderList", orderList);
		return mav;

	}
	
	// 반품 신청서 상세페이지 컨트롤러
	@Override
	@RequestMapping(value = "/return_Detail.do", method =RequestMethod.POST)
	public ModelAndView returnDetail(@ModelAttribute("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		Map<String, Object> returnInfo = adminOrderService.returnDetail(order_id);

		mav.addObject("returnInfo", returnInfo);
		mav.setViewName(viewName);

		return mav;

	}
	

}
