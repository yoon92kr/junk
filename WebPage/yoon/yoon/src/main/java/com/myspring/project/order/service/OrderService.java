package com.myspring.project.order.service;

import java.util.List;
import java.util.Map;

import com.myspring.project.order.vo.OrderVO;

public interface OrderService {
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception;
	public OrderVO findMyOrder(String order_id) throws Exception;
	
	
}
