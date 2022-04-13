// 2022.01.08 ������

package com.mat.modernblanco.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mat.modernblanco.product.vo.ProductVO;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductVO> selectBestProduct() throws DataAccessException {
		
		List<ProductVO> bestProductList = sqlSession.selectList("mapper.product.selectBestItem");
				
		return bestProductList;
     
	}
	
	@Override
	public ProductVO selectProduct(String product_id) throws DataAccessException {
		ProductVO productInfo = sqlSession.selectOne("mapper.product.selectProduct", product_id);
				
		return productInfo;
	}
	
	// �ɼǿ� ���� ��ǰ��ȸ DAO
	@Override
	public List<ProductVO> productListToOption(Map<String, String> option) throws DataAccessException {
		
		List<ProductVO> productList = sqlSession.selectList("mapper.product.productListToOption", option);
				
		return productList;
     
	}

}
