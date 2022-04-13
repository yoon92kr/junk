// 2022.01.14 ������

package com.mat.modernblanco.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.cart.vo.CartVO;
import com.mat.modernblanco.order.vo.OrderVO;

public interface OrderDAO {

	// īƮ product_id �� �ش��ϴ� count select DAO
	public int selectCount(CartVO cartVO) throws DataAccessException;

	// �ֹ� �߰� DAO
	public void addOrder(OrderVO orderVO) throws DataAccessException;

	// �ֹ��� ���� ����Ʈ ���� DAO
	public void updatePointToOrder(OrderVO orderVO) throws DataAccessException;
	
	// ��ȸ�� �ֹ� ���� ȣ�� DAO
	public List<Map<String, Object>> guestOrderDetail(Map<String, String> guestInfo) throws DataAccessException;
	
	// ��ȸ�� �ֹ� ��� DAO
	public int cancelOrder(String orderID) throws DataAccessException;

}
