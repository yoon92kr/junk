// 2021.12.09 윤상현

package com.myspring.baroip.adminOrder.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("adminOrderDAO")
public class AdminOrderDAOImpl implements AdminOrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// 조회 조건에 따른 주문 리스트 조회 DAO
	@Override
	public List<Map<String, Object>> selectOrderToOption( Map<String, String> option) throws DataAccessException {
		
		List<Map<String, Object>> orderList = sqlSession.selectList("mapper.adminOrder.selectOrderToOption", option);

		return orderList;
	}
	
	// 조회 조건에 따른 반품 리스트 조회 DAO
	@Override
	public List<Map<String, Object>> selectRefundToOption( Map<String, String> option) throws DataAccessException {
		
		List<Map<String, Object>> orderList = sqlSession.selectList("mapper.adminOrder.selectRefundToOption", option);

		return orderList;
	}
	
	// 주문 상태 변경 DAO
	@Override
	public void updateState(Map<String, String> option) throws DataAccessException {
		sqlSession.update("mapper.adminOrder.updateState", option);
		
	}
	
	// 반품 정보 호출 DAO
	@Override
	public Map<String, Object> returnDetail(String order_id) throws DataAccessException {
		
		Map<String, Object> orderList = sqlSession.selectOne("mapper.adminOrder.returnDetail", order_id);

		return orderList;
	}
	
	// 반품요청 상태 변경 DAO
	@Override
	public int updateReturnState(Map<String, String> option) throws DataAccessException {
		
		int result = sqlSession.update("mapper.adminOrder.updateReturnState", option);
		
		return result;
		
	}
}
