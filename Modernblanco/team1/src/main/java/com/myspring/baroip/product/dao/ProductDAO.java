// 2022.01.08 윤상현

package com.myspring.baroip.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.product.vo.ProductVO;

public interface ProductDAO {
	
	public List<ProductVO> selectBestProduct() throws DataAccessException;
	
	public ProductVO selectProduct(String product_id) throws DataAccessException;
	
	// 옵션에 따른 상품조회 DAO
	public List<ProductVO> productListToOption(Map<String, String> option) throws DataAccessException;
}
