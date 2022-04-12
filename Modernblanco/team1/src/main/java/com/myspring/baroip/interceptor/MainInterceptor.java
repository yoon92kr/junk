// 2021.12.08 윤상현

package com.myspring.baroip.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myspring.baroip.user.vo.UserVO;

public class MainInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {

			HttpSession session = request.getSession();

			// 요청 view 설정
			String viewName = getViewName(request);
			// 이전 요청 view 설정
			// String lastViewName = getLastViewName(request);
			// 헤더 색상 변경
			setHeader(request, viewName);
			
			// admin 접근시 관리자 rank 유효성 검사
			if (viewName.contains("admin")) {

				if (session.getAttribute("userInfo") != null) {
					UserVO userVO = (UserVO) session.getAttribute("userInfo");

					if (Integer.parseInt(userVO.getUser_rank()) > 1) {
						request.setAttribute("viewName", viewName);
					}
					else {
						request.setAttribute("viewName", "redirect:/main.do");
					}
				} 
				
				else {
					request.setAttribute("viewName", "redirect:/main.do");
				}
			}
			
			else {
				request.setAttribute("viewName", viewName);
			}

			// request.setAttribute("lastViewName", lastViewName);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String fileName = uri.substring(begin, end);
		if (fileName.indexOf(".") != -1) {
			fileName = fileName.substring(0, fileName.lastIndexOf("."));
		}
		if (fileName.lastIndexOf("/") != -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());
		}
		System.out.printf("baroip : [%s]의 mapping으로 이동합니다.%n", fileName);

		return fileName;
	}

	private void setHeader(HttpServletRequest request, String viewName) {
		
		if (viewName.contains("admin")) {
			request.setAttribute("pageInfo", "set_admin");
		} else if (viewName.contains("notice")) {
			request.setAttribute("pageInfo", "set_notice");
		} else if (viewName.contains("cs")) {
			request.setAttribute("pageInfo", "set_cs");
		} else if (viewName.contains("myPage")) {
			request.setAttribute("pageInfo", "set_myPage");
		} else if (viewName.contains("login")) {
			request.setAttribute("pageInfo", "set_login");
		} else if (viewName.contains("join")) {
			request.setAttribute("pageInfo", "set_join");
		}
	}
	
//	private String getLastViewName(HttpServletRequest request) throws Exception {
//
//
//		String contextPath = request.getContextPath();
//		String uri = (String) request.getHeader("REFERER");
//		String lastUri = "";
//	
//		if (uri == null || uri.trim().equals("") || contextPath == null || contextPath.trim().equals("")) {
//			System.out.println("baroip : 이전 URI가 존재하지 않습니다.");
//		}
//		
//		else {
//			int begin = uri.indexOf(contextPath)+contextPath.length();
//			int end = 0;
//			if (uri.indexOf("?") != -1 && uri.indexOf(".do") != -1) {
//				
//				end = uri.indexOf("?")-3; 
//			}
//			else {
//				end = uri.indexOf(".do");
//			}
//			lastUri = uri.substring(begin, end);
//		}
//		
//
//		return lastUri;
//		
//	}
//	

}