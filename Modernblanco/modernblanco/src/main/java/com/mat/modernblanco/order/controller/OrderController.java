// 2022.01.14 ������

package com.mat.modernblanco.order.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.order.vo.OrderVO;

public interface OrderController {

	// Order ��ü mapping
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView orderForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ���� ��Ʈ�ѷ�
	public void orderProduct(HttpServletRequest request, @ModelAttribute("orderVO") OrderVO orderVO, @RequestParam("order_product_list") List<String> order_product_list) throws Exception;
	
	public ModelAndView orderComplete(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
