// 2022.01.14 ������


package com.mat.modernblanco.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mat.modernblanco.cart.vo.CartVO;
import com.mat.modernblanco.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	// īƮ product_id �� �ش��ϴ� count select DAO
	@Override
	public int selectCount(CartVO cartVO) throws DataAccessException {
		int count = sqlSession.selectOne("mapper.order.cartCount", cartVO);
				
		return count;
	}
	
	// �ֹ� �߰� DAO
	@Override
	public void addOrder(OrderVO orderVO) throws DataAccessException {
		
		sqlSession.insert("mapper.order.addOrder", orderVO);
		

	}
	
	// �ֹ��� ���� ����Ʈ ���� DAO
	@Override
	public void updatePointToOrder(OrderVO orderVO) throws DataAccessException {
		
		sqlSession.update("mapper.order.updatePointToOrder", orderVO);
	}
	
	// ��ȸ�� �ֹ� ���� ȣ�� DAO
	@Override
	public List<Map<String, Object>> guestOrderDetail(Map<String, String> guestInfo) throws DataAccessException {
		
		List<Map<String, Object>> guestOrder = sqlSession.selectList("mapper.order.guestOrderDetail", guestInfo);

		return guestOrder;
	}
	
	// ��ȸ�� �ֹ� ��� DAO
	@Override
	public int cancelOrder(String orderID) throws DataAccessException {
		
		int result = sqlSession.update("mapper.order.cancelOrder", orderID);
		
		return result;
	}

}
