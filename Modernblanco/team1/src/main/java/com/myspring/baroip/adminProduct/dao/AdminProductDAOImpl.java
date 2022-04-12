// 2021.12.09 윤상현

package com.myspring.baroip.adminProduct.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.product.vo.ProductVO;

@Repository("adminProductDAO")
public class AdminProductDAOImpl implements AdminProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 상품 등록 DAO, 반환값 == 등록된 product_id
	@Override
	public String insertProduct(ProductVO productVO) throws DataAccessException {
		
		sqlSession.insert("mapper.adminProduct.insertProduct",productVO);
				
		String product_id = "product_"+sqlSession.selectOne("mapper.adminProduct.selectMatchID");
		
		return product_id;
	}
	
	// 상품 수량 변경 DAO
	@Override
	public void updateAmount(Map<String, String> option) throws DataAccessException {
		sqlSession.update("mapper.adminProduct.updateAmount", option);
		
	}
	
	// 상품 상태 변경 DAO
	@Override
	public void updateState(Map<String, String> option) throws DataAccessException {
		sqlSession.update("mapper.adminProduct.updateState", option);
		
	}
	
	// 상품 삭제 DAO
	@Override
	public void deleteProduct(String product_id) throws DataAccessException {
		sqlSession.delete("mapper.adminProduct.deleteProduct", product_id);
		sqlSession.delete("mapper.adminProduct.deleteImage", product_id);
		
	}
	
	// 상품 수정 DAO
	@Override
	public void updateProduct(ProductVO productVO) throws DataAccessException {
		sqlSession.update("mapper.adminProduct.updateProduct", productVO);
	}
	
	// 조회 조건에 따른 상품 리스트 조회 DAO
	@Override
	public List<ProductVO> productListToOption( Map<String, String> option) throws DataAccessException {
		List<ProductVO> productList = sqlSession.selectList("mapper.adminProduct.selectAllProduct", option);

		return productList;
	}
}
