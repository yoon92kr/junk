// 2022.01.14 윤상현

package com.myspring.baroip.order.service;

import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.order.dao.OrderDAO;
import com.myspring.baroip.order.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO orderDAO;
	
	// 상품에 따른 카트 수량 조회 Service
	@Override
	public int selectCount(CartVO cartVO) throws Exception {
		
		int count = orderDAO.selectCount(cartVO);

		return count;

	}
	
	@Override
	public void addOrder(OrderVO orderVO) throws Exception {
		
		orderDAO.addOrder(orderVO);
		System.out.printf("baroip : [%s] 주문이 완료되었습니다.%n", orderVO.getOrder_id());
		
	}
	
	// 주문시 기존 포인트 차감 Service
	@Override
	public void updatePointToOrder(OrderVO orderVO) throws Exception {
		
		orderDAO.updatePointToOrder(orderVO);
	}
	
	// 비회원 주문 정보 호출 Service
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
	
	// 비회원 주문 취소 Service
	@Override
	public String cancelOrder(String orderID) throws Exception {
		
		int result = orderDAO.cancelOrder(orderID);
		String message = "주문상태 변경에 문제가 발생하였습니다.";
		if(result > 0) {
			message = "해당 주문이 정상적으로 취소되었습니다.";
		}
		
		return message;
	}

}
