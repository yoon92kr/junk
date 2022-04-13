// 2022.01.14 ������

package com.mat.modernblanco.order.service;

import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mat.modernblanco.cart.vo.CartVO;
import com.mat.modernblanco.order.dao.OrderDAO;
import com.mat.modernblanco.order.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO orderDAO;
	
	// ��ǰ�� ���� īƮ ���� ��ȸ Service
	@Override
	public int selectCount(CartVO cartVO) throws Exception {
		
		int count = orderDAO.selectCount(cartVO);

		return count;

	}
	
	@Override
	public void addOrder(OrderVO orderVO) throws Exception {
		
		orderDAO.addOrder(orderVO);
		System.out.printf("baroip : [%s] �ֹ��� �Ϸ�Ǿ����ϴ�.%n", orderVO.getOrder_id());
		
	}
	
	// �ֹ��� ���� ����Ʈ ���� Service
	@Override
	public void updatePointToOrder(OrderVO orderVO) throws Exception {
		
		orderDAO.updatePointToOrder(orderVO);
	}
	
	// ��ȸ�� �ֹ� ���� ȣ�� Service
	@Override
	public List<Map<String, Object>> guestOrderDetail(Map<String, String> guestInfo) throws Exception {
		
		List<Map<String, Object>> guestOrder = orderDAO.guestOrderDetail(guestInfo);
		
		for(int i=0 ; i<guestOrder.size() ; i++) {
			String encodeImage = Base64.getEncoder().encodeToString((byte[]) guestOrder.get(i).get("image_file"));
			guestOrder.get(i).remove("image_file");
			guestOrder.get(i).put("image_file", encodeImage);
		}
		
		return guestOrder;
	}
	
	// ��ȸ�� �ֹ� ��� Service
	@Override
	public String cancelOrder(String orderID) throws Exception {
		
		int result = orderDAO.cancelOrder(orderID);
		String message = "�ֹ����� ���濡 ������ �߻��Ͽ����ϴ�.";
		if(result > 0) {
			message = "�ش� �ֹ��� ���������� ��ҵǾ����ϴ�.";
		}
		
		return message;
	}

}
