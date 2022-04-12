// 2021.12.09 윤상현

package com.myspring.baroip.adminProduct.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.product.vo.ProductVO;

public interface AdminProductDAO {
	
	// 상품 등록 DAO, 반환값 == 등록된 product_id
	public String insertProduct(ProductVO productVO) throws DataAccessException;
	
	// 상품 수량 변경 DAO
	public void updateAmount(Map<String, String> option) throws DataAccessException;
	
	// 상품 상태 변경 DAO
	public void updateState(Map<String, String> option) throws DataAccessException;
	
	// 상품 삭제 DAO
	public void deleteProduct(String product_id) throws DataAccessException;
	
	// 상품 수정 DAO
	public void updateProduct(ProductVO productVO) throws DataAccessException;
	
	// 조회 조건에 따른 상품 리스트 조회 DAO
	public List<ProductVO> productListToOption( Map<String, String> option) throws DataAccessException;
}
