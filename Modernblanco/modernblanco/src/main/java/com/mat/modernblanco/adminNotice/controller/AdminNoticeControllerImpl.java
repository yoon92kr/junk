// 2022.01.10 ������

package com.mat.modernblanco.adminNotice.controller;

import java.util.HashMap;
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

import com.mat.modernblanco.adminNotice.service.AdminNoticeService;
import com.mat.modernblanco.notice.service.NoticeService;
import com.mat.modernblanco.notice.vo.NoticeVO;

@Controller("adminNoticeController")
@RequestMapping(value="/admin/notice")
public class AdminNoticeControllerImpl implements AdminNoticeController {
	@Autowired
	AdminNoticeService adminNoticeService;
	@Autowired
	NoticeService noticeService;
	// �������� ������ ��ü mapping
	@Override
	@RequestMapping(value = "/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
//	������������ �������� ��Ʈ�ѷ�
	@RequestMapping(value= "/notice_list.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminNoticeList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		// get ��û�� �������, ������ session�� ����
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		
		info.put("notice_category", "notice");
		Map<String, Map<String, Object>> noticeList = getFullList(info, request);
		
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
	
	// ���� ��� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/add_notice.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String message = adminNoticeService.addNotice(noticeVO);
		session.setAttribute("message", message);
		
		mav.setViewName("redirect:/admin/notice/notice_list.do");
		
		return mav;
	}
	
	// ���� ���� ��Ʈ�ѷ�
	@Override
	@ResponseBody
	@RequestMapping(value = "/delete_notice.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String deleteNotice(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String message = adminNoticeService.deleteNotice(notice_id);
		System.out.println(message);
		return message;
	}

	
	// ���� ���� ��� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/update_notice_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView updateNoticeForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String) request.getAttribute("viewName");
		NoticeVO noticeVO = noticeService.noticeDetail(notice_id);
		
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName(viewName);
		return mav;

	}

	// ���� ���� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/update_notice.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView updateNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String message = adminNoticeService.updateNotice(noticeVO);
		session.setAttribute("message", message);
		
		mav.setViewName("redirect:/admin/notice/notice_list.do");
		
		return mav;
	}
	
	// ��ǰ ��ȸ ���� ����, ���ǿ� �ִ� ��ǰ������ Ȯ�� �� ���񽺷� ó���ϴ� �޼ҵ�
		public Map<String, Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			
			// Map options���� ��ȸ�ϰ��� �ϴ� ���Ǹ� notice_category / search_option / search_value / search_state �� ������, notice_category�� �ݵ�� ���ԵǾ���Ѵ�.
			// * notice_category(notice_category ����) = value [comment / refund / PQA / UQA / notice / FAQ]
			// search_option(�˻� ����) = value [notice_cre_date / notice_title /]
			// search_value(�˻� ��) = value [yyyy-mm-dd,yyyy-mm-dd / notice_title]
			// search_state(�亯 ����) = value [all / y / n]
			
			Map<String, String> options = new HashMap<String, String>();
			String paramOption = info.get("search_option");
			String paramValue = info.get("search_value");
			String paramState = info.get("search_state");
			
			String sessionOption = (String) session.getAttribute("search_option");
			String sessionValue = (String) session.getAttribute("search_value");
			String sessionState = (String) session.getAttribute("search_state");

			// search_option �˻������� session Ȥ�� param�� ������ ��� ó��
			if (paramOption != null || sessionOption != null) {
				
				// param�� ������ �������
				if(paramOption != null && sessionOption == null) {
					options.put("search_option", paramOption);
					session.setAttribute("search_option", paramOption);
				}
				// session�� ������ �������
				else if(paramOption == null && sessionOption != null) {
					options.put("search_option", sessionOption);
				}
				// param�� session ��ο� ������ �������
				else {
					// param�� session�� ������ ������ ���, ���� session�� ���� ����
					if(paramOption.equals(sessionOption)) {
						options.put("search_option", sessionOption);
					}
					// param�� session�� ������ �ٸ� ���, session�� set��, param ���� ����
					else {
						options.put("search_option", paramOption);
						session.setAttribute("search_option", paramOption);
					}
				} 
			
			}
			// search_value �˻������� session Ȥ�� param�� ������ ��� ó��			
			if (paramValue != null || sessionValue != null) {
				
				// param�� ������ �������	
				if(paramValue != null && sessionValue == null) {
					options.put("search_value", paramValue);
					session.setAttribute("search_value", paramValue);
				}
				// session�� ������ �������
				else if(paramValue == null && sessionValue != null) {
					options.put("search_value", sessionValue);
				}
				// param�� session ��ο� ������ �������
				else {
					// param�� session�� ������ ������ ���, ���� session�� ���� ����
					if(paramValue.equals(sessionValue)) {
						options.put("search_value", sessionValue);
					}
					// param�� session�� ������ �ٸ� ���, session�� set��, param ���� ����
					else {
						options.put("search_value", paramValue);
						session.setAttribute("search_value", paramValue);
					}
				} 
			
			} 
			// search_state �˻������� session Ȥ�� param�� ������ ��� ó��			
			if (paramState != null || sessionState != null) {
				
				// param�� ������ �������
				if(paramState != null && sessionState == null) {
					options.put("search_state", paramState);
					session.setAttribute("search_state", paramState);
				}
				// session�� ������ �������
				else if(paramState == null && sessionState != null) {
					options.put("search_state", sessionState);
				}
				// param�� session ��ο� ������ �������
				else {
					// param�� session�� ������ ������ ���, ���� session�� ���� ����
					if(paramState.equals(sessionState)) {
						options.put("search_state", sessionState);
					}
					// param�� session�� ������ �ٸ� ���, session�� set��, param ���� ����
					else {
						options.put("search_state", paramState);
						session.setAttribute("search_state", paramState);
					}
				} 
			
			} 
			options.put("notice_category", info.get("notice_category"));
			Map<String, Map<String, Object>> fullList = adminNoticeService.noticeListToOption(options);
			
			return fullList;
		}
}
