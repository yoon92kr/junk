// 2021.12.28 ������

package com.mat.modernblanco.guest.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GuestController {

	// ��ȸ�� �ֹ���ȸ �˾� ��Ʈ�ѷ�
	public ModelAndView searchOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// ��ȸ�� �ֹ� ����ȸ ��Ʈ�ѷ�
	public ModelAndView guestOrderDetail(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;
	
	// ��ȸ�� �ֹ� ��� ��Ʈ�ѷ�
	public String cancelOrder(HttpServletRequest request, @RequestParam("order_id") String orderID) throws Exception;

}
