// 2022.01.14 윤상현

package com.myspring.baroip.order.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.order.vo.OrderVO;

public interface OrderService {

	// 상품에 따른 카트 수량 조회 Service
	public int selectCount(CartVO cartVO) throws Exception;

	public void addOrder(OrderVO orderVO) throws Exception;

	// 주문시 기존 포인트 차감 Service
	public void updatePointToOrder(OrderVO orderVO) throws Exception;
	
	// 비회원 주문 정보 호출 Service
	public List<Map<String, Object>> guestOrderDetail(Map<String, String> guestInfo) throws Exception;
	
	// 비회원 주문 취소 Service
	public String cancelOrder(String orderID) throws Exception;
}
