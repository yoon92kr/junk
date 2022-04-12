// 2021.12.08 À±»óÇö

package com.myspring.baroip.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Autowired
	private AdminDAO adminDAO;
	
	@RequestMapping(value = "/admin/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		
		Map<String, Object> mainInfo = adminDAO.mainState();
		
		mav.addObject("mainInfo", mainInfo);
		mav.setViewName(viewName);	
		
		return mav;
	}
	

}
