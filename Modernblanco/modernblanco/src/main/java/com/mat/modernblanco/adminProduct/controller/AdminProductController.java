// 2021.12.09 ������

package com.mat.modernblanco.adminProduct.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.product.vo.ProductVO;

public interface AdminProductController {

	// ������ ������ ��ǰ ��� ��ü ����
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//  ������ ������ ��ǰ ���
	public ModelAndView addProduct(@ModelAttribute("productVO") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	// rank 2 �������� �ӽû�ǰ���� �޴� ��Ʈ�ѷ�
	public ModelAndView extraList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// rank 3 �̻��� �������� ���θ� ��ü��ǰ���� �޴� ��Ʈ�ѷ�
	public ModelAndView generalList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//  ������ ������ ��ǰ ���� ����
	public String update_amount(@RequestParam Map<String, String> info) throws Exception;
	
	// ������ ������ ��ǰ ����
	public ModelAndView delete_product(@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//  ������ ������ ��ǰ ���� ��
	public ModelAndView update_product_form (@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ������ ������ ��ǰ ����
	public ModelAndView update_product(@ModelAttribute("productVO") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	// ��ǰ ���� ���� ��Ʈ�ѷ�
	public ModelAndView update_state(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;
}
