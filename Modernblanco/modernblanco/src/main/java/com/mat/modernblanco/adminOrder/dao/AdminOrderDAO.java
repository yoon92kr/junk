// 2021.12.09 ������

package com.mat.modernblanco.adminOrder.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface AdminOrderDAO {
	
	// ��ȸ ���ǿ� ���� �ֹ� ����Ʈ ��ȸ DAO
	public List<Map<String, Object>> selectOrderToOption( Map<String, String> option) throws DataAccessException;
	
	// �ֹ� ���� ���� DAO
	public void updateState(Map<String, String> option) throws DataAccessException;
	
	// ��ȸ ���ǿ� ���� ��ǰ ����Ʈ ��ȸ DAO
	public List<Map<String, Object>> selectRefundToOption( Map<String, String> option) throws DataAccessException;
	
	// ��ǰ ���� ȣ�� DAO
	public Map<String, Object> returnDetail(String order_id) throws DataAccessException;
	
	// ��ǰ��û ���� ���� DAO
	public int updateReturnState(Map<String, String> option) throws DataAccessException;
}
