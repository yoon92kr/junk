// 2022.01.08 ������

package com.mat.modernblanco.product.service;

import java.util.Map;

public interface ProductService {
	public Map<String, Map<String, Object>> bestProductList() throws Exception;
	public Map<String, Map<String, Object>> productDetail(String product_id) throws Exception;
	public Map<String, Map<String, Object>> productListToOption(Map<String, String> option) throws Exception;
}
