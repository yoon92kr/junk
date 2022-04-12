// 2022.01.14 윤상현


package com.myspring.baroip.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	// 카트 product_id 에 해당하는 count select DAO
	@Override
	public int selectCount(CartVO cartVO) throws DataAccessException {
		int count = sqlSession.selectOne("mapper.order.cartCount", cartVO);
				
		return count;
	}
	
	// 주문 추가 DAO
	@Override
	public void addOrder(OrderVO orderVO) throws DataAccessException {
		
		sqlSession.insert("mapper.order.addOrder", orderVO);
		

	}
	
	// 주문시 기존 포인트 차감 DAO
	@Override
	public void updatePointToOrder(OrderVO orderVO) throws DataAccessException {
		
		sqlSession.update("mapper.order.updatePointToOrder", orderVO);
	}
	
	// 비회원 주문 정보 호출 DAO
	@Override
	public List<Map<String, Object>> guestOrderDetail(Map<String, String> guestInfo) throws DataAccessException {
		
		List<Map<String, Object>> guestOrder = sqlSession.selectList("mapper.order.guestOrderDetail", guestInfo);

		return guestOrder;
	}
	
	// 비회원 주문 취소 DAO
	@Override
	public int cancelOrder(String orderID) throws DataAccessException {
		
		int result = sqlSession.update("mapper.order.cancelOrder", orderID);
		
		return result;
	}

}
