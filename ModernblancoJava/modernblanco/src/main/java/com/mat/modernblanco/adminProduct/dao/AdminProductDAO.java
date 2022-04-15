// 2021.12.09 ������

package com.mat.modernblanco.adminProduct.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.product.vo.ProductVO;

public interface AdminProductDAO {
	
	// ��ǰ ��� DAO, ��ȯ�� == ��ϵ� product_id
	public String insertProduct(ProductVO productVO) throws DataAccessException;
	
	// ��ǰ ���� ���� DAO
	public void updateAmount(Map<String, String> option) throws DataAccessException;
	
	// ��ǰ ���� ���� DAO
	public void updateState(Map<String, String> option) throws DataAccessException;
	
	// ��ǰ ���� DAO
	public void deleteProduct(String product_id) throws DataAccessException;
	
	// ��ǰ ���� DAO
	public void updateProduct(ProductVO productVO) throws DataAccessException;
	
	// ��ȸ ���ǿ� ���� ��ǰ ����Ʈ ��ȸ DAO
	public List<ProductVO> productListToOption( Map<String, String> option) throws DataAccessException;
}
