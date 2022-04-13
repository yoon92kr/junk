// 2021.12.09 ������

package com.mat.modernblanco.adminOrder.dao;

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
	
	
	// ��ȸ ���ǿ� ���� �ֹ� ����Ʈ ��ȸ DAO
	@Override
	public List<Map<String, Object>> selectOrderToOption( Map<String, String> option) throws DataAccessException {
		
		List<Map<String, Object>> orderList = sqlSession.selectList("mapper.adminOrder.selectOrderToOption", option);

		return orderList;
	}
	
	// ��ȸ ���ǿ� ���� ��ǰ ����Ʈ ��ȸ DAO
	@Override
	public List<Map<String, Object>> selectRefundToOption( Map<String, String> option) throws DataAccessException {
		
		List<Map<String, Object>> orderList = sqlSession.selectList("mapper.adminOrder.selectRefundToOption", option);

		return orderList;
	}
	
	// �ֹ� ���� ���� DAO
	@Override
	public void updateState(Map<String, String> option) throws DataAccessException {
		sqlSession.update("mapper.adminOrder.updateState", option);
		
	}
	
	// ��ǰ ���� ȣ�� DAO
	@Override
	public Map<String, Object> returnDetail(String order_id) throws DataAccessException {
		
		Map<String, Object> orderList = sqlSession.selectOne("mapper.adminOrder.returnDetail", order_id);

		return orderList;
	}
	
	// ��ǰ��û ���� ���� DAO
	@Override
	public int updateReturnState(Map<String, String> option) throws DataAccessException {
		
		int result = sqlSession.update("mapper.adminOrder.updateReturnState", option);
		
		return result;
		
	}
}
