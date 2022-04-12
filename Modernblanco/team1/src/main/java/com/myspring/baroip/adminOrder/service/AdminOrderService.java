// 2021.12.09 윤상현

package com.myspring.baroip.adminOrder.service;

import java.util.List;
import java.util.Map;

public interface AdminOrderService {
	
	// 옵션에 따른 주문 리스트 조회 Service
	public List<Map<String, Object>> orderListToOption( Map<String, String> option) throws Exception;
	
	// 주문 상태 변경서비스
	public void updateState(Map<String, String> option) throws Exception;
	
	// 조회 조건에 따른 반품 리스트 조회 서비스
	public List<Map<String, Object>> selectRefundToOption( Map<String, String> option) throws Exception;
	
	// 반품 정보 호출 서비스
	public Map<String, Object> returnDetail(String order_id) throws Exception ;
	
	// 반품요청 상태 변경서비스
	public String updateReturnState(Map<String, String> option) throws Exception;
}
