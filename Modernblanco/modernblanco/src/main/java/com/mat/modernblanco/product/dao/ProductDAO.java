// 2022.01.08 ������

package com.mat.modernblanco.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.product.vo.ProductVO;

public interface ProductDAO {
	
	public List<ProductVO> selectBestProduct() throws DataAccessException;
	
	public ProductVO selectProduct(String product_id) throws DataAccessException;
	
	// �ɼǿ� ���� ��ǰ��ȸ DAO
	public List<ProductVO> productListToOption(Map<String, String> option) throws DataAccessException;
}
