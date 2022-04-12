// 2021.12.09 윤상현

package com.myspring.baroip.adminProduct.service;

import java.util.Map;

import com.myspring.baroip.product.vo.ProductVO;

public interface AdminProductService {
	
	// 상품 등록 서비스
	public String addProduct(ProductVO productVO) throws Exception;
	
	// 상품 수량 변경 서비스
	public void updateAmount(Map<String, String> option) throws Exception;
	
	// 상품 상태 변경 서비스
	public void updateState(Map<String, String> option) throws Exception;
	
	// 상품 삭제 서비스
	public void deleteProduct(String product_id) throws Exception;
	
	// 상품 수정 서비스
	public void updateProduct(ProductVO productVO) throws Exception;
	
	// 조회 조건에 따른 상품 리스트 조회 서비스
	public Map<String, Map<String, Object>> productListToOption( Map<String, String> option) throws Exception;
}
