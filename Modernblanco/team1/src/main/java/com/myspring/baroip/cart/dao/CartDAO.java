package com.myspring.baroip.cart.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.cart.vo.CartVO;

public interface CartDAO {
	
//	장바구니 페이지
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException;
	
//	장바구니 담기
	public void insertProductInCart(CartVO cartVO) throws DataAccessException;
	
//	해당 회원의 장바구니에 상품이 있는지 확인
	public boolean selectProductInCart(CartVO cartVO) throws DataAccessException;
	
//	상세페이지 동일 상품 추가
	public void overLapCartList(CartVO cartVO) throws DataAccessException;
	
//	장바구니 상품 삭제 테스트
	public void deleteCartList(Map<String, Object> deleteList) throws DataAccessException;
}
