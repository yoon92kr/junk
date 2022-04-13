// 2021.12.09 ������

package com.mat.modernblanco.adminOrder.service;

import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mat.modernblanco.adminOrder.dao.AdminOrderDAO;

@Service("adminOrderService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Autowired
	private AdminOrderDAO adminOrderDAO;
			
	// ��ȸ ���ǿ� ���� �ֹ� ����Ʈ ��ȸ ����
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
	
	// ��ȸ ���ǿ� ���� ��ǰ ����Ʈ ��ȸ ����
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
	
	// �ֹ� ���� ���漭��
	@Override
	public void updateState(Map<String, String> option) throws Exception {
		
		adminOrderDAO.updateState(option);
		
	}
	
	// ��ǰ ���� ȣ�� ����
	@Override
	public Map<String, Object> returnDetail(String order_id) throws Exception {
		
		Map<String, Object> returnInfo = adminOrderDAO.returnDetail(order_id);
			String encodeImage = Base64.getEncoder().encodeToString((byte[]) returnInfo.get("image_file"));
			returnInfo.remove("image_file");
			returnInfo.put("image_file", encodeImage);
		
		return returnInfo;
	}
	
	// ��ǰ��û ���� ���漭��
	@Override
	public String updateReturnState(Map<String, String> option) throws Exception {
		
		int result = adminOrderDAO.updateReturnState(option);
		System.out.println(result);
		String message = "";
		if(result > 0 && option.get("option").equals("accept")) {
			message = "�ش� �ֹ��� ��ǰ / ��ȯ ��û�� �����Ǿ����ϴ�.";
		}
		else if(result > 0 && option.get("option").equals("negative")) {
			message = "�ش� �ֹ��� ��ǰ / ��ȯ ��û�� �����Ǿ����ϴ�.";
		}
		
		return message;
		
	}

}
