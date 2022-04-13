// 2021.12.09 ������

package com.mat.modernblanco.adminOrder.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminOrderController {

	// ������ ������ �ֹ� ���� ��ü ����
	public ModelAndView adminOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//  ������ ������ �ֹ� ���� ����Ʈ
	public ModelAndView orderList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// �ֹ� ���� ���� ��Ʈ�ѷ�
	public String update_amount(@RequestParam Map<String, String> info) throws Exception;
	
	// �ֹ� �������� ��Ʈ�ѷ�
	public ModelAndView orderDetail(@ModelAttribute("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//  ��ǰ / ��ȯ ��û ����Ʈ ��Ʈ�ѷ�
	public ModelAndView returnList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ��ǰ ��û�� �������� ��Ʈ�ѷ�
	public ModelAndView returnDetail(@ModelAttribute("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// �ֹ� ���� ���� ��Ʈ�ѷ�
	public String updateReturnState(@RequestParam Map<String, String> info) throws Exception;
	
}
