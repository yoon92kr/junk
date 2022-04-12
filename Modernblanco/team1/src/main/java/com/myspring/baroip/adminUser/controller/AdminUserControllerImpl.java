// 2021.12.28 윤상현

package com.myspring.baroip.adminUser.controller;

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

import com.myspring.baroip.adminUser.service.AdminUserService;
import com.myspring.baroip.user.vo.UserVO;

@Controller("adminUserController")
@RequestMapping(value = "/admin/user")
public class AdminUserControllerImpl implements AdminUserController {

	@Autowired
	private AdminUserService adminUserService;

	// 전체 회원관리 메뉴 컨트롤러
	@Override
	@RequestMapping(value = "/user_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView userList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		// get 요청이 없을경우, 기존의 session을 제거
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

	// 회원 권한 수정 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/update_rank.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String updateRank(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {

		String message = adminUserService.updateRank(info);

		return message;

	}

	// 회원 삭제 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/delete_user.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String delete_user(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {

		String message = adminUserService.deleteUser(info);

		return message;

	}

	// 회원 정보 수정 form 이동 컨트롤러
	@Override
	@RequestMapping(value = "/update_user_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView update_user_form(@RequestParam("user_id") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		UserVO login_user = (UserVO) session.getAttribute("userInfo");
		// 조회할 회원의 rank 확인
		int user_rank = Integer.parseInt(login_user.getUser_rank());
		String id = login_user.getUser_id();
		if (user_rank > 1) {
			UserVO userInfo = adminUserService.selectOneUser(user_id);
			// 수정할 회원의 rank 확인
			int target_rank = Integer.parseInt(userInfo.getUser_rank());

			// 수정할 회원의 rank가 호출한 회원보다 높거나 로그인한 아이디와 다를경우 거부
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

	// 회원정보 수정 컨트롤러
	@Override
	@RequestMapping(value = "/update_user.do", method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		// 회원정보 수정 성공시 1, 아닐경우 0 을 반환
		int flag = adminUserService.updateUser(userVO);
		String message = "";
		if (flag == 1) {
			
			UserVO loginUser = (UserVO) session.getAttribute("userInfo");
			message = "관리자 " + loginUser.getUser_id() + " 님이 [" + userVO.getUser_id() + "]의 수정을 완료되었습니다.";
		}
		else if (flag == 0) {
			message = "회원정보 수정에 문제가 발생하였습니다.";
		}
		
		

		

		session.setAttribute("message", message);
		mav.setViewName("redirect:/admin/user/user_list.do");
		System.out.println("baroip : " + message);

		return mav;
	}

	// 회원 조회 필터 사용시, 세션에 있는 회원정보를 확인 후 서비스로 처리하는 메소드
	public List<UserVO> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request)
			throws Exception {

		HttpSession session = request.getSession();

		// Map options에는 조회하고자 하는 조건유형 option, 조건에 해당하는 value 가 반드시 포함되어야한다.
		// search_option(검색 조건) = value [userJoinDate / userId / all]
		// search_value(검색 값) = value [yyyy-mm-dd,yyyy-mm-dd / product_main_title / 0 or 1(product_states) ]
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

		// param과 session에 바인딩된 정보가 없을경우, viewName에 따른 전체 list를 보여준다.
		else {
			options.put("search_option", "rank");
			options.put("search_value", "4");
		}

		List<UserVO> fullList = adminUserService.userList(options);

		return fullList;
	}
}
