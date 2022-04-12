// 2021.12.09 윤상현

package com.myspring.baroip.adminOrder.service;

import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.baroip.adminOrder.dao.AdminOrderDAO;

@Service("adminOrderService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Autowired
	private AdminOrderDAO adminOrderDAO;
			
	// 조회 조건에 따른 주문 리스트 조회 서비스
	@Override
	public List<Map<String, Object>> orderListToOption( Map<String, String> option) throws Exception {
		
		
		
		if(option.get("search_option") != null && option.get("search_option").equals("orderDate")) {
			String[] date = option.get("search_value").split(",");
		
			option.remove("search_value");
			option.put("begin", date[0]);
			option.put("end", date[1]);
 
		}

		List<Map<String, Object>> orderList = adminOrderDAO.selectOrderToOption(option);
		
		return orderList;
	}
	
	// 조회 조건에 따른 반품 리스트 조회 서비스
	@Override
	public List<Map<String, Object>> selectRefundToOption( Map<String, String> option) throws Exception {
		
		
		
		if(option.get("search_option") != null && option.get("search_option").equals("orderDate")) {
			String[] date = option.get("search_value").split(",");
		
			option.remove("search_value");
			option.put("begin", date[0]);
			option.put("end", date[1]);
 
		}

		List<Map<String, Object>> orderList = adminOrderDAO.selectRefundToOption(option);
		
		return orderList;
	}
	
	// 주문 상태 변경서비스
	@Override
	public void updateState(Map<String, String> option) throws Exception {
		
		adminOrderDAO.updateState(option);
		
	}
	
	// 반품 정보 호출 서비스
	@Override
	public Map<String, Object> returnDetail(String order_id) throws Exception {
		
		Map<String, Object> returnInfo = adminOrderDAO.returnDetail(order_id);
			String encodeImage = Base64.getEncoder().encodeToString((byte[]) returnInfo.get("image_file"));
			returnInfo.remove("image_file");
			returnInfo.put("image_file", encodeImage);
		
		return returnInfo;
	}
	
	// 반품요청 상태 변경서비스
	@Override
	public String updateReturnState(Map<String, String> option) throws Exception {
		
		int result = adminOrderDAO.updateReturnState(option);
		System.out.println(result);
		String message = "";
		if(result > 0 && option.get("option").equals("accept")) {
			message = "해당 주문의 반품 / 교환 요청이 수락되었습니다.";
		}
		else if(result > 0 && option.get("option").equals("negative")) {
			message = "해당 주문의 반품 / 교환 요청이 거절되었습니다.";
		}
		
		return message;
		
	}

}
