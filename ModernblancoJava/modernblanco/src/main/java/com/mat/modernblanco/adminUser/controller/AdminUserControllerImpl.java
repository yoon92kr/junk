// 2021.12.28 ������

package com.mat.modernblanco.adminUser.controller;

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

import com.mat.modernblanco.adminUser.service.AdminUserService;
import com.mat.modernblanco.user.vo.UserVO;

@Controller("adminUserController")
@RequestMapping(value = "/admin/user")
public class AdminUserControllerImpl implements AdminUserController {

	@Autowired
	private AdminUserService adminUserService;

	// ��ü ȸ������ �޴� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/user_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView userList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		// get ��û�� �������, ������ session�� ����
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		List<UserVO> userList = getFullList(info, request);

		String pageNo = info.get("pageNo");

		if (pageNo != null && pageNo != "") {
			int lastNo = (userList.size()+6)/7;
			
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
		
		mav.addObject("userList", userList);
		return mav;
	}

	// ȸ�� ���� ���� ��Ʈ�ѷ�
	@Override
	@ResponseBody
	@RequestMapping(value = "/update_rank.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String updateRank(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {

		String message = adminUserService.updateRank(info);

		return message;

	}

	// ȸ�� ���� ��Ʈ�ѷ�
	@Override
	@ResponseBody
	@RequestMapping(value = "/delete_user.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String delete_user(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {

		String message = adminUserService.deleteUser(info);

		return message;

	}

	// ȸ�� ���� ���� form �̵� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/update_user_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView update_user_form(@RequestParam("user_id") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		UserVO login_user = (UserVO) session.getAttribute("userInfo");
		// ��ȸ�� ȸ���� rank Ȯ��
		int user_rank = Integer.parseInt(login_user.getUser_rank());
		String id = login_user.getUser_id();
		if (user_rank > 1) {
			UserVO userInfo = adminUserService.selectOneUser(user_id);
			// ������ ȸ���� rank Ȯ��
			int target_rank = Integer.parseInt(userInfo.getUser_rank());

			// ������ ȸ���� rank�� ȣ���� ȸ������ ���ų� �α����� ���̵�� �ٸ���� �ź�
			if (target_rank > user_rank) {
				mav.setViewName("redirect:/main.do");
			} else if (target_rank == user_rank && !id.equals(user_id)) {
				mav.setViewName("redirect:/main.do");
			} else {
				mav.addObject("userVO_update", userInfo);
				mav.setViewName(viewName);
			}
		} else {
			mav.setViewName("redirect:/main.do");

		}

		return mav;

	}

	// ȸ������ ���� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/update_user.do", method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		// ȸ������ ���� ������ 1, �ƴҰ�� 0 �� ��ȯ
		int flag = adminUserService.updateUser(userVO);
		String message = "";
		if (flag == 1) {
			
			UserVO loginUser = (UserVO) session.getAttribute("userInfo");
			message = "������ " + loginUser.getUser_id() + " ���� [" + userVO.getUser_id() + "]�� ������ �Ϸ�Ǿ����ϴ�.";
		}
		else if (flag == 0) {
			message = "ȸ������ ������ ������ �߻��Ͽ����ϴ�.";
		}
		
		

		

		session.setAttribute("message", message);
		mav.setViewName("redirect:/admin/user/user_list.do");
		System.out.println("baroip : " + message);

		return mav;
	}

	// ȸ�� ��ȸ ���� ����, ���ǿ� �ִ� ȸ�������� Ȯ�� �� ���񽺷� ó���ϴ� �޼ҵ�
	public List<UserVO> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request)
			throws Exception {

		HttpSession session = request.getSession();

		// Map options���� ��ȸ�ϰ��� �ϴ� �������� option, ���ǿ� �ش��ϴ� value �� �ݵ�� ���ԵǾ���Ѵ�.
		// search_option(�˻� ����) = value [userJoinDate / userId / all]
		// search_value(�˻� ��) = value [yyyy-mm-dd,yyyy-mm-dd / product_main_title / 0 or 1(product_states) ]
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

		// param�� session�� ���ε��� ������ �������, viewName�� ���� ��ü list�� �����ش�.
		else {
			options.put("search_option", "rank");
			options.put("search_value", "4");
		}

		List<UserVO> fullList = adminUserService.userList(options);

		return fullList;
	}
}
