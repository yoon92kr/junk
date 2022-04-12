package com.myspring.baroip.cart.service;

import java.util.Map;

import com.myspring.baroip.cart.vo.CartVO;

public interface CartService {
	
//	장바구니 페이지
	public Map<String, Map<String, Map<String, Object>>> myCartList(CartVO cartVO) throws Exception;
	
//	장바구니 담기
	public void addProductInCart(CartVO cartVO) throws Exception;
	
//	해당 회원의 장바구니에 상품이 있는지 확인
	public boolean selectProductInCart(CartVO cartVO) throws Exception;
	
	
//	상세페이지 동일 상품 추가
	public void ProductOverLap(CartVO cartVO) throws Exception;
	
//	장바구니 상품 삭제 테스트
	public void deleteCartItem(Map<String, Object> deleteList) throws Exception;
	
}
