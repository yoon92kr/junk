// 2021.12.09 윤상현

package com.myspring.baroip.adminOrder.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface AdminOrderDAO {
	
	// 조회 조건에 따른 주문 리스트 조회 DAO
	public List<Map<String, Object>> selectOrderToOption( Map<String, String> option) throws DataAccessException;
	
	// 주문 상태 변경 DAO
	public void updateState(Map<String, String> option) throws DataAccessException;
	
	// 조회 조건에 따른 반품 리스트 조회 DAO
	public List<Map<String, Object>> selectRefundToOption( Map<String, String> option) throws DataAccessException;
	
	// 반품 정보 호출 DAO
	public Map<String, Object> returnDetail(String order_id) throws DataAccessException;
	
	// 반품요청 상태 변경 DAO
	public int updateReturnState(Map<String, String> option) throws DataAccessException;
}
