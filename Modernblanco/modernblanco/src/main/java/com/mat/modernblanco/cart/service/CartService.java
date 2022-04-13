package com.mat.modernblanco.cart.service;

import java.util.Map;

import com.mat.modernblanco.cart.vo.CartVO;

public interface CartService {
	
//	��ٱ��� ������
	public Map<String, Map<String, Map<String, Object>>> myCartList(CartVO cartVO) throws Exception;
	
//	��ٱ��� ���
	public void addProductInCart(CartVO cartVO) throws Exception;
	
//	�ش� ȸ���� ��ٱ��Ͽ� ��ǰ�� �ִ��� Ȯ��
	public boolean selectProductInCart(CartVO cartVO) throws Exception;
	
	
//	�������� ���� ��ǰ �߰�
	public void ProductOverLap(CartVO cartVO) throws Exception;
	
//	��ٱ��� ��ǰ ���� �׽�Ʈ
	public void deleteCartItem(Map<String, Object> deleteList) throws Exception;
	
}
