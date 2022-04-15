// 2021.12.09 ������

package com.mat.modernblanco.adminProduct.service;

import java.util.Map;

import com.mat.modernblanco.product.vo.ProductVO;

public interface AdminProductService {
	
	// ��ǰ ��� ����
	public String addProduct(ProductVO productVO) throws Exception;
	
	// ��ǰ ���� ���� ����
	public void updateAmount(Map<String, String> option) throws Exception;
	
	// ��ǰ ���� ���� ����
	public void updateState(Map<String, String> option) throws Exception;
	
	// ��ǰ ���� ����
	public void deleteProduct(String product_id) throws Exception;
	
	// ��ǰ ���� ����
	public void updateProduct(ProductVO productVO) throws Exception;
	
	// ��ȸ ���ǿ� ���� ��ǰ ����Ʈ ��ȸ ����
	public Map<String, Map<String, Object>> productListToOption( Map<String, String> option) throws Exception;
}
