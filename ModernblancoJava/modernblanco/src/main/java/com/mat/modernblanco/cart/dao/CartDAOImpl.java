package com.mat.modernblanco.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mat.modernblanco.cart.vo.CartVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO{
	@Autowired
	private SqlSession sqlSession;
	
//	��ٱ��� ������
	@Override
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList = sqlSession.selectList("mapper.cart.selectCartList", cartVO);
		return cartList;
	}
	
//	��ǰ �� ������ > ��ٱ��� ��� ���
	@Override
	public void insertProductInCart(CartVO cartVO) throws DataAccessException {
		sqlSession.insert("mapper.cart.insertProductInCart", cartVO);
	}
	
//	�ش� ȸ���� ��ٱ��Ͽ� ��ǰ�� �ִ��� Ȯ��
	@Override
	public boolean selectProductInCart(CartVO cartVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.cart.findProductInCart", cartVO);
		return Boolean.parseBoolean(result);
	}
	
//	�������� ���� ��ǰ �߰�
	@Override
	public void overLapCartList(CartVO cartVO) throws DataAccessException {
		sqlSession.update("mapper.cart.overLapProductAdd", cartVO);
	}
	
//	��ٱ��� ��ǰ ���� �׽�Ʈ
	@Override
	public void deleteCartList(Map<String, Object> deleteList) throws DataAccessException{
		sqlSession.delete("mapper.cart.ListDelete", deleteList);
	}

}
