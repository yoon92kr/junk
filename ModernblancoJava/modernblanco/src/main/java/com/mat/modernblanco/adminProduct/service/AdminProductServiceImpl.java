// 2021.12.09 ������

package com.mat.modernblanco.adminProduct.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mat.modernblanco.adminProduct.dao.AdminProductDAO;
import com.mat.modernblanco.image.service.ImageService;
import com.mat.modernblanco.image.vo.ImageVO;
import com.mat.modernblanco.product.vo.ProductVO;

@Service("adminProductService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminProductServiceImpl implements AdminProductService {
	
	@Autowired
	private AdminProductDAO adminProductDAO;
	@Autowired
	private ImageService imageService;
	
	// ��ǰ ��� ����
	@Override
	public String addProduct(ProductVO productVO) throws Exception {
		
		String product_id = adminProductDAO.insertProduct(productVO);
		
		return product_id;
	}
	
	// ��ǰ ���� ���� ����
	@Override
	public void updateAmount(Map<String, String> option) throws Exception {
		
		adminProductDAO.updateAmount(option);
		
	}
	
	// ��ǰ ���� ���� ����
	@Override
	public void updateState(Map<String, String> option) throws Exception {
		
		adminProductDAO.updateState(option);
		
	}
	
	// ��ǰ ���� ����
	@Override
	public void deleteProduct(String product_id) throws Exception {
		
		adminProductDAO.deleteProduct(product_id);
		
	}
	
	// ��ǰ ���� ����
	@Override
	public void updateProduct(ProductVO productVO) throws Exception {
		
		adminProductDAO.updateProduct(productVO);
		
	}
	
	// ��ȸ ���ǿ� ���� ��ǰ ����Ʈ ��ȸ ����
	@Override
	public Map<String, Map<String, Object>> productListToOption( Map<String, String> option) throws Exception {

		// option�� productCreDate�� ���, value�� ���޵� yyyy-mm-dd,yyyy-mm-dd�� begin, end�� �����Ͽ� �ٽ� �����Ѵ�.
		if(option.get("search_option").equals("productCreDate")) {
			String[] date = option.get("search_value").split(",");
		
			option.remove("search_value");
			option.put("begin", date[0]);
			option.put("end", date[1]);

		}
		
		List<ProductVO> productList = adminProductDAO.productListToOption(option);
		
		Map<String, Map<String, Object>> fullProductList = new HashMap<String, Map<String, Object>>();
		
			
		if(productList != null && !productList.isEmpty() ) {
			
			List<Integer> product_id_list = new ArrayList<Integer>();
			Map<String, String> imageArray = new HashMap<String, String>();
			
			for(ProductVO item : productList) {
				product_id_list.add(Integer.parseInt(item.getProduct_id().split("_")[1]));
			}

			imageArray.put("start", "product_"+Collections.min(product_id_list));
			imageArray.put("end", "product_"+Collections.max(product_id_list));
			
			List<ImageVO> imageList = imageService.selectAllImage(imageArray);	
			
		for (int i = 0; i < productList.size(); i++) {

			ProductVO product = productList.get(i);
			
			if (product != null) {
				
				String match_id = product.getProduct_id();
				String encodeImage = "";
				
				for(int j=0 ; j<imageList.size(); j++) {
					if(imageList.get(j).getImage_match_id().equals(match_id)) {
						
						encodeImage = Base64.getEncoder().encodeToString(imageList.get(j).getImage_file());
					}
				}
				
				// ��ǰ ����� �̹����� ���� ��ü ����
				Map<String, Object> productInfo = new HashMap<String, Object>();

				
				productInfo.put("product_id", product.getProduct_id());
				productInfo.put("user_id", product.getUser_id());
				productInfo.put("product_cre_date", product.getProduct_cre_date());
				productInfo.put("product_main_title", product.getProduct_main_title());
				productInfo.put("product_price", product.getProduct_price());
				productInfo.put("product_discount", product.getProduct_discount());
				productInfo.put("product_amount", product.getProduct_amount());
				productInfo.put("product_main_category", product.getProduct_main_category());
				productInfo.put("product_sub_category", product.getProduct_sub_category());
				productInfo.put("product_states", product.getProduct_states());
				productInfo.put("image_file", encodeImage);
				productInfo.put("product_count", product.getProduct_count());
	
				fullProductList.put("product" + (i+1), productInfo);
				
			}

		}
		}
		else {
			System.out.println("baroip : �ӽõ�ϵ� ��ǰ�� �����ϴ�.");
		}

		return fullProductList;
	}
}
