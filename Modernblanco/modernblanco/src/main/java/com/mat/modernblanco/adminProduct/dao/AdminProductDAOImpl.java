// 2021.12.09 ������

package com.mat.modernblanco.adminProduct.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mat.modernblanco.product.vo.ProductVO;

@Repository("adminProductDAO")
public class AdminProductDAOImpl implements AdminProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// ��ǰ ��� DAO, ��ȯ�� == ��ϵ� product_id
	@Override
	public String insertProduct(ProductVO productVO) throws DataAccessException {
		
		sqlSession.insert("mapper.adminProduct.insertProduct",productVO);
				
		String product_id = "product_"+sqlSession.selectOne("mapper.adminProduct.selectMatchID");
		
		return product_id;
	}
	
	// ��ǰ ���� ���� DAO
	@Override
	public void updateAmount(Map<String, String> option) throws DataAccessException {
		sqlSession.update("mapper.adminProduct.updateAmount", option);
		
	}
	
	// ��ǰ ���� ���� DAO
	@Override
	public void updateState(Map<String, String> option) throws DataAccessException {
		sqlSession.update("mapper.adminProduct.updateState", option);
		
	}
	
	// ��ǰ ���� DAO
	@Override
	public void deleteProduct(String product_id) throws DataAccessException {
		sqlSession.delete("mapper.adminProduct.deleteProduct", product_id);
		sqlSession.delete("mapper.adminProduct.deleteImage", product_id);
		
	}
	
	// ��ǰ ���� DAO
	@Override
	public void updateProduct(ProductVO productVO) throws DataAccessException {
		sqlSession.update("mapper.adminProduct.updateProduct", productVO);
	}
	
	// ��ȸ ���ǿ� ���� ��ǰ ����Ʈ ��ȸ DAO
	@Override
	public List<ProductVO> productListToOption( Map<String, String> option) throws DataAccessException {
		List<ProductVO> productList = sqlSession.selectList("mapper.adminProduct.selectAllProduct", option);

		return productList;
	}
}
