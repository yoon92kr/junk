// 2022.01.10 윤상현

package com.myspring.baroip.adminFAQ.controller;

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

import com.myspring.baroip.adminNotice.controller.AdminNoticeController;
import com.myspring.baroip.adminNotice.service.AdminNoticeService;
import com.myspring.baroip.notice.service.NoticeService;
import com.myspring.baroip.notice.vo.NoticeVO;

@Controller("adminFAQController")
@RequestMapping(value="/admin/FAQ")
public class AdminFAQControllerImpl implements AdminFAQController {
	@Autowired
	AdminNoticeService adminNoticeService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	AdminNoticeController adminNoticeController;
	
	// FAQ관리 페이지 전체 mapping
	@Override
	@RequestMapping(value = "/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminFAQ(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
//	관리자페이지 FAQ관리 컨트롤러
	@RequestMapping(value= "/FAQ_list.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminFAQList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		// get 요청이 없을경우, 기존의 session을 제거
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		
		info.put("notice_category", "FAQ");
		Map<String, Map<String, Object>> noticeList = adminNoticeController.getFullList(info, request);
		
		String pageNo = info.get("pageNo");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (noticeList.size()+6)/7;
			
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
		mav.addObject("noticeList", noticeList);
		return mav;
	}
	
	// FAQ 등록 컨트롤러
	@Override
	@RequestMapping(value = "/add_FAQ.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addFAQ(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String message = adminNoticeService.addNotice(noticeVO);
		session.setAttribute("message", message);
		
		mav.setViewName("redirect:/admin/FAQ/FAQ_list.do");
		
		return mav;
	}
	
	// FAQ 삭제 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/delete_FAQ.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String deleteFAQ(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String message = adminNoticeService.deleteNotice(notice_id);
		System.out.println(message);
		return message;
	}

	
	// FAQ 수정 양식 컨트롤러
	@Override
	@RequestMapping(value = "/update_FAQ_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView updateFAQForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String) request.getAttribute("viewName");
		NoticeVO noticeVO = noticeService.noticeDetail(notice_id);
		
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName(viewName);
		return mav;

	}

	// FAQ 수정 컨트롤러
	@Override
	@RequestMapping(value = "/update_FAQ.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView updateFAQ(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String message = adminNoticeService.updateNotice(noticeVO);
		session.setAttribute("message", message);
		
		mav.setViewName("redirect:/admin/FAQ/FAQ_list.do");
		
		return mav;
	}
	
	// FAQ 상세 컨트롤러
	@Override
	@RequestMapping(value = "/FAQ_detail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView FAQDetail(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String) request.getAttribute("viewName");
		NoticeVO noticeVO = noticeService.noticeDetail(notice_id);
		
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName(viewName);
		return mav;
	}
	
}
