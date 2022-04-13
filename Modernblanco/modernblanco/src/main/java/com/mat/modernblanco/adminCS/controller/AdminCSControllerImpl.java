// 2022.02.10 ������

package com.mat.modernblanco.adminCS.controller;

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

import com.mat.modernblanco.adminCS.service.AdminCSService;
import com.mat.modernblanco.notice.vo.NoticeVO;

@Controller("adminCSController")
@RequestMapping(value="/admin/CS")
public class AdminCSControllerImpl implements AdminCSController {
	@Autowired
	AdminCSService adminCSService;

	//	���� ���� ��Ʈ�ѷ�
	@RequestMapping(value= "/QA_list.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView QAList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String pageNo = info.get("pageNo");
		
		// get ��û�� �������, ������ session�� ����
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		
		info.put("option", "QA");
		List<Map<String, Object>> CSList = getFullList(info, request);
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (CSList.size()+6)/7;
			
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
		
		mav.addObject("CSList", CSList);
		mav.setViewName(viewName);

		return mav;
	}
	
	// �ı� ���� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/review_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView reviewList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String pageNo = info.get("pageNo");
		
		// get ��û�� �������, ������ session�� ����
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		
		info.put("option", "comment");
		List<Map<String, Object>> CSList = getFullList(info, request);
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (CSList.size()+6)/7;
			
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
		
		mav.addObject("CSList", CSList);
		mav.setViewName(viewName);

		return mav;
	}
	
	// CS ���� ��Ʈ�ѷ�
	@Override
	@ResponseBody
	@RequestMapping(value = "/delete_CS.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public String deleteCS(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String message = adminCSService.deleteCS(notice_id);
		System.out.println(message);
		return message;
	}

	
	// QA �亯 �߰� ��� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/add_QA_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addQAForm(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> QAInfo = adminCSService.CSDetail(info);
		
		String viewName = (String) request.getAttribute("viewName");
		
		mav.addObject("QAInfo", QAInfo);
		mav.setViewName(viewName);
		return mav;

	}
	
	// review �亯 �߰� ��� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/add_review_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addReviewForm(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> QAInfo = adminCSService.CSDetail(info);
		
		String viewName = (String) request.getAttribute("viewName");
		
		mav.addObject("QAInfo", QAInfo);
		mav.setViewName(viewName);
		return mav;

	}

	// QA �������� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/QA_detail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView QADetail(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> QAInfo = adminCSService.CSDetail(info);
				
		mav.addObject("QAInfo", QAInfo);
		mav.setViewName(viewName);
		
		return mav;

	}
	
	// review �������� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/review_detail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView reviewDetail(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> QAInfo = adminCSService.CSDetail(info);
		
		mav.addObject("QAInfo", QAInfo);
		mav.setViewName(viewName);
		
		return mav;

	}
	
	// CS �亯 �߰� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/add_CS.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addCS(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();	
		String notice_category = noticeVO.getNotice_category();
		String message = adminCSService.addCS(noticeVO);
		session.setAttribute("message", message);
		
		if(notice_category.equals("UQA") || notice_category.equals("PQA")) {
			mav.setViewName("redirect:/admin/CS/QA_list.do");
		}
		else {
			mav.setViewName("redirect:/admin/CS/review_list.do");
		}
		
		return mav;
	}
	
	// CS ��ȸ ���� ����, ���ǿ� �ִ� �˻� ���� ������ Ȯ�� �� ���񽺷� ó���ϴ� �޼ҵ�
		public List<Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
			
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
			options.put("option", info.get("option"));
			List<Map<String, Object>> fullList = adminCSService.CSListToOption(options);
			return fullList;
		}
}
