package com.mat.modernblanco.cart.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



public interface CartController {

//	��ٱ��� ������
	public ModelAndView mycartList(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	��ٱ��� ���
	public String addProductInCart(@RequestParam("product_id") String product_id, @RequestParam("cart_count") int cart_count,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	�������� ���� ��ǰ �߰�
	public void cartInProductOverLap(@RequestParam("product_id") String product_id, @RequestParam("cart_count") int cart_count,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	��ٱ��� ��ǰ ����
	public String cartListDelete(@RequestParam("deleteList") List<String> deleteList, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}