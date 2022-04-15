// 2021.12.08 ������

package com.mat.modernblanco.adminOrder.controller;

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

import com.mat.modernblanco.adminOrder.service.AdminOrderService;
import com.mat.modernblanco.myPage.service.MyPageService;

@Controller("adminOrderController")
@RequestMapping(value = "/admin/order")
public class AdminOrderControllerImpl implements AdminOrderController {

	@Autowired
	private AdminOrderService adminOrderService;
	
	@Autowired
	private MyPageService myPageService;

	// �ֹ����� ������ ��ü mapping
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
		// get ��û�� �������, ������ session�� ����
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
	
	// �ֹ� ���� ���� ��Ʈ�ѷ�
	@Override
	@ResponseBody
	@RequestMapping(value = "/update_state.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public String update_amount(@RequestParam Map<String, String> info) throws Exception {

		String order_id = info.get("order_id");
		adminOrderService.updateState(info);
		
		String message = "�ֹ� ��ȣ ["+order_id+"] �� ���°� ��������� ���� �Ǿ����ϴ�.";

		System.out.printf("baorip : [%s]�� ��� ���°� [�����]���� ����Ǿ����ϴ�.%n", order_id);

		return message;
	}
	
	// �ֹ� ���� ���� ��Ʈ�ѷ�
	@Override
	@ResponseBody
	@RequestMapping(value = "/update_return_state.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String updateReturnState(@RequestParam Map<String, String> info) throws Exception {

		String message = adminOrderService.updateReturnState(info);
		
		System.out.println("baroip : "+message);
		return message;

	}


	// �ֹ� ��ȸ ���� ����, ���ǿ� �ִ� �ֹ����� Ȯ�� �� ���񽺷� ó���ϴ� �޼ҵ�
	public List<Map<String, Object>> getFullList(Map<String, String> info, HttpServletRequest request,String option) throws Exception {
		
		HttpSession session = request.getSession();
		
		// Map options���� ��ȸ�ϰ��� �ϴ� �������� option, ���ǿ� �ش��ϴ� value �� �ݵ�� ���ԵǾ���Ѵ�.
		// search_option(�˻� ����) = value [orderDate / productId / userId/ states ]
		// search_value(�˻� ��) = value [yyyy-mm-dd,yyyy-mm-dd / product_id / user_id / 0 or 1 or 2)]
		Map<String, String> options = new HashMap<String, String>();
		
		String paramOption = info.get("search_option");
		String paramValue = info.get("search_value");
		
		String sessionOption = (String) session.getAttribute("search_option");
		String sessionValue = (String) session.getAttribute("search_value");
			
		// param, session ��� option�� ���ε� �Ǿ��ִ� ���
		if (paramOption != null && sessionOption != null) {

				// �� �ɼ��� ��ġ�� ���, options�� ���� session�� ���� �����Ѵ�.
				if (paramOption.equals(sessionOption) && paramValue.equals(sessionValue)) {
					options.put("search_option", sessionOption);
					options.put("search_value", sessionValue);
				}

				// �� �ɼ��� ��ġ���� ���� ���, options�� paramOption�� �����ϰ�, ���� ������ Override �Ѵ�.
				else {
					options.put("search_option", paramOption);
					options.put("search_value", paramValue);

					session.setAttribute("search_option", paramOption);
					session.setAttribute("search_value", paramValue);
				}
			}

			// ���ǿ� ���ε��� option�� �������, options�� paramOption�� �����ϰ�, ���ǿ� set �Ѵ�.
			else if (paramOption != null && sessionOption == null) {
				options.put("search_option", paramOption);
				options.put("search_value", paramValue);

				session.setAttribute("search_option", paramOption);
				session.setAttribute("search_value", paramValue);
			}
		
			// param�� ���ε��� option�� �������, session�� option�� �����Ѵ�.
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
	
	// �ֹ� �������� ��Ʈ�ѷ�
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
		// get ��û�� �������, ������ session�� ����
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
	
	// ��ǰ ��û�� �������� ��Ʈ�ѷ�
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
