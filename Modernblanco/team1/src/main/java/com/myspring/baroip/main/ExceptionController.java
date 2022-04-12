package com.myspring.baroip.main;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

// 스프링에 발생하는 예외 처리 클래스 선언
@ControllerAdvice
public class ExceptionController {

	private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);

	// 404 에러 핸들러
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handlError404(Exception e, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		logger.warn("404에러 발생 [" + request.getRequestURI() + "] 로 매핑된 URI가 존재하지 않습니다.");
		mav.setViewName("/error/404");

		return mav;
	}

	// 전체 에러 핸들러
	@ExceptionHandler(Exception.class)
	@RequestMapping(value = "/baroip/error/common.do")
	protected ModelAndView common(Exception e, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		System.out.println("--------------------------------------[ERROR]--------------------------------------");
		e.printStackTrace();
		System.out.println("--------------------------------------[ERROR]--------------------------------------");
		mav.setViewName("/error/common");

		return mav;
	}

}
