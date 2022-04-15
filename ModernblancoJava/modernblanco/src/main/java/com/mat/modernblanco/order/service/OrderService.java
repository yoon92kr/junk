// 2022.01.14 ������

package com.mat.modernblanco.order.service;

import java.util.List;
import java.util.Map;

import com.mat.modernblanco.cart.vo.CartVO;
import com.mat.modernblanco.order.vo.OrderVO;

public interface OrderService {

	// ��ǰ�� ���� īƮ ���� ��ȸ Service
	public int selectCount(CartVO cartVO) throws Exception;

	public void addOrder(OrderVO orderVO) throws Exception;

	// �ֹ��� ���� ����Ʈ ���� Service
	public void updatePointToOrder(OrderVO orderVO) throws Exception;
	
	// ��ȸ�� �ֹ� ���� ȣ�� Service
	public List<Map<String, Object>> guestOrderDetail(Map<String, String> guestInfo) throws Exception;
	
	// ��ȸ�� �ֹ� ��� Service
	public String cancelOrder(String orderID) throws Exception;
}
