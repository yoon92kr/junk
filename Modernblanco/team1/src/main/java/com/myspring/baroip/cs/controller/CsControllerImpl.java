package com.myspring.baroip.cs.controller;

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

import com.myspring.baroip.adminCS.service.AdminCSService;
import com.myspring.baroip.adminNotice.controller.AdminNoticeController;
import com.myspring.baroip.adminNotice.service.AdminNoticeService;
import com.myspring.baroip.notice.service.NoticeService;
import com.myspring.baroip.notice.vo.NoticeVO;
import com.myspring.baroip.user.service.UserService;


@Controller("csController")
@RequestMapping(value = "/cs")
public class CsControllerImpl implements CsController {

	@Autowired
	AdminNoticeService adminNoticeService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	AdminCSService adminCSService;
	@Autowired
	NoticeVO noticeVO;
	@Autowired
	AdminNoticeController adminNoticeController;
	@Autowired
	private UserService userService;
	
	// cs 전체 매핑 컨트롤러
	@RequestMapping(value = "/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	//	FAQ 리스트 컨트롤러
	@Override
	@RequestMapping(value = "/FAQ_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView FAQList(@RequestParam Map<String, String> info, HttpServletRequest request,	HttpServletResponse response) throws Exception {
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

	//	UQA 리스트 컨트롤러
	@Override
	@RequestMapping(value = "/UQA_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView UQAList(@RequestParam Map<String, String> info, HttpServletRequest request,	HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		// get 요청이 없을경우, 기존의 session을 제거
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		
		info.put("notice_category", "UQA");
		List<Map<String, Object>> UQAList = noticeService.UQAList();
		
		String pageNo = info.get("pageNo");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (UQAList.size()+6)/7;
			
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
		mav.addObject("UQAList", UQAList);
		return mav;
	}

	//	UQA 등록 컨트롤러
	@Override
	@RequestMapping(value = "/add_UQA.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addUQA(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String user_id = noticeVO.getUser_id();
		
		if(user_id == null || user_id == "") {
			
			user_id = userService.guestJoin();
			noticeVO.setUser_id(user_id);
		}
		
		String message = adminNoticeService.addNotice(noticeVO);
		session.setAttribute("message", message);
		
		mav.setViewName("redirect:/cs/UQA_list.do");
		
		return mav;
		
	}

	// UQA 상세 컨트롤러
	@Override
	@RequestMapping(value = "/UQA_datail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView UQADetail(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, String> option = new HashMap<String, String>();
		
		option.put("option", "UQA");
		option.put("notice_id", notice_id);
		
		Map<String, Object> result = adminCSService.CSDetail(option);
		

		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("noticeVO", result);
		mav.setViewName(viewName);
		return mav;
	}

	//	UQA 수정 폼 컨트롤러
	@Override
	@RequestMapping(value = "/UQA_update_form.do", method = { RequestMethod.POST })
	public ModelAndView UQAUpdateForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		NoticeVO noticeVO = noticeService.noticeDetail(notice_id);

			mav.addObject("noticeVO", noticeVO);
			mav.setViewName(viewName);

		return mav;
	}

	// UQA 수정 컨트롤러
	@Override
	@RequestMapping(value = "/UQA_update.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView UQAUpdate(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String message = adminNoticeService.updateNotice(noticeVO);
		session.setAttribute("message", message);
		
		mav.setViewName("redirect:/cs/UQA_list.do");
		
		return mav;
	}

	//	UQA 삭제 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/delete_UQA.do", method = {RequestMethod.POST})
	public String deleteUQA(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String message = adminNoticeService.deleteNotice(notice_id);
		System.out.println(message);
		return message;
	}

}
