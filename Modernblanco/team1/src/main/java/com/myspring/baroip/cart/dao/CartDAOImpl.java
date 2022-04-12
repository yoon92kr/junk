package com.myspring.baroip.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.cart.vo.CartVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO{
	@Autowired
	private SqlSession sqlSession;
	
//	장바구니 페이지
	@Override
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList = sqlSession.selectList("mapper.cart.selectCartList", cartVO);
		return cartList;
	}
	
//	상품 상세 페이지 > 장바구니 담기 기능
	@Override
	public void insertProductInCart(CartVO cartVO) throws DataAccessException {
		sqlSession.insert("mapper.cart.insertProductInCart", cartVO);
	}
	
//	해당 회원의 장바구니에 상품이 있는지 확인
	@Override
	public boolean selectProductInCart(CartVO cartVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.cart.findProductInCart", cartVO);
		return Boolean.parseBoolean(result);
	}
	
//	상세페이지 동일 상품 추가
	@Override
	public void overLapCartList(CartVO cartVO) throws DataAccessException {
		sqlSession.update("mapper.cart.overLapProductAdd", cartVO);
	}
	
//	장바구니 상품 삭제 테스트
	@Override
	public void deleteCartList(Map<String, Object> deleteList) throws DataAccessException{
		sqlSession.delete("mapper.cart.ListDelete", deleteList);
	}

}
