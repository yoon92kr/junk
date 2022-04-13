package com.mat.modernblanco.main;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

// �������� �߻��ϴ� ���� ó�� Ŭ���� ����
@ControllerAdvice
public class ExceptionController {

	private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);

	// 404 ���� �ڵ鷯
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handlError404(Exception e, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		logger.warn("404���� �߻� [" + request.getRequestURI() + "] �� ���ε� URI�� �������� �ʽ��ϴ�.");
		mav.setViewName("/error/404");

		return mav;
	}

	// ��ü ���� �ڵ鷯
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
