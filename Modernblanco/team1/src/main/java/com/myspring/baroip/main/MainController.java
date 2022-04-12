// 2021.12.09 À±»óÇö

package com.myspring.baroip.main;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.product.service.ProductService;

@Controller
public class MainController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value= "/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{

		ModelAndView mav = new ModelAndView();
		Map<String, Map<String, Object>> bestProducts = productService.bestProductList();
		
		
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("bestProducts", bestProducts);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value= "/popUp.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView popUp(HttpServletRequest request, HttpServletResponse response) throws Exception{

		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");

		mav.setViewName(viewName);
		
		return mav;
	}
	
	//@RequestMapping("**/favicon.ico")
	//public String favicon() {
	//	return "forward:/resources/img/common/favicon.png";
	//}
	
		
}
