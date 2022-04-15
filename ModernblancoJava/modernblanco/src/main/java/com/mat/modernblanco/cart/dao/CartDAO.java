package com.mat.modernblanco.cart.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.cart.vo.CartVO;

public interface CartDAO {
	
//	��ٱ��� ������
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException;
	
//	��ٱ��� ���
	public void insertProductInCart(CartVO cartVO) throws DataAccessException;
	
//	�ش� ȸ���� ��ٱ��Ͽ� ��ǰ�� �ִ��� Ȯ��
	public boolean selectProductInCart(CartVO cartVO) throws DataAccessException;
	
//	�������� ���� ��ǰ �߰�
	public void overLapCartList(CartVO cartVO) throws DataAccessException;
	
//	��ٱ��� ��ǰ ���� �׽�Ʈ
	public void deleteCartList(Map<String, Object> deleteList) throws DataAccessException;
}
