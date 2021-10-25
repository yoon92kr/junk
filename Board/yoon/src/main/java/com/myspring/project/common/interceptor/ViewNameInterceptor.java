package com.myspring.project.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {

		try {
			String viewName = getViewName(request);
			request.setAttribute("viewName", viewName);
			System.out.println("view 이름 : ["+viewName+"]");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		// include 된 페이지의 uri을 가져와 대입

		if (uri == null || uri.trim().equals("")) {
			// uri 가 null이라는 의미는, include된 페이지가 아닌, dispatch된 페이지라는 의미이다.
			// 만약 include가 된 페이지라면, 해당 uri가 대입된다
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

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/"), viewName.length());
		}

		viewName = viewName.replace("/", "");
		

		return viewName;
	}
}
