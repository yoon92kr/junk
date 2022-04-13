// 2022.01.08 ������

package com.mat.modernblanco.product.service;


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

import com.mat.modernblanco.image.service.ImageService;
import com.mat.modernblanco.image.vo.ImageVO;
import com.mat.modernblanco.product.dao.ProductDAO;
import com.mat.modernblanco.product.vo.ProductVO;

@Service("productService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ImageService imageService;

	// best product select
	@Override
	public Map<String, Map<String, Object>> bestProductList() throws Exception {

		// ����Ʈ ��ǰ ����Ʈ ����
		List<ProductVO> bestProducts = productDAO.selectBestProduct();
		
		List<Integer> product_id_list = new ArrayList<Integer>();
		Map<String, String> imageArray = new HashMap<String, String>();
		
		for(ProductVO item : bestProducts) {
			product_id_list.add(Integer.parseInt(item.getProduct_id().split("_")[1]));
		}

		imageArray.put("start", "product_"+Collections.min(product_id_list));
		imageArray.put("end", "product_"+Collections.max(product_id_list));
		
		List<ImageVO> imageList = imageService.selectAllImage(imageArray);
		
		
		// ����ȭ�鿡 ȣ���� ������ ��ǰ���� + �̹����� ���� ��ü ���� (mainProduct 1~3)
		Map<String, Map<String, Object>> bestProductInfo = new HashMap<String, Map<String, Object>>();

		if(bestProducts != null && !bestProducts.isEmpty() ) {
		for (int i = 0; i < bestProducts.size(); i++) {

			ProductVO product = bestProducts.get(i);
			
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
							
				productInfo.put("product_main_title", product.getProduct_main_title());
				productInfo.put("product_sub_title", product.getProduct_sub_title());
				productInfo.put("product_price", product.getProduct_price());
				productInfo.put("product_discount", product.getProduct_discount());
				productInfo.put("image_file", encodeImage);
				productInfo.put("product_id", product.getProduct_id());

				bestProductInfo.put("product" + (i+1), productInfo);
				
				}
			}
		}

		return bestProductInfo;

	}
	
	// product detail ��ȸ service
	@Override
	public Map<String, Map<String, Object>> productDetail(String product_id) throws Exception {
		
		// �̹������� / ��ǰ������ ���� ��ü ����
		Map<String, Map<String, Object>> productInfo= new HashMap<String, Map<String, Object>>();

		// jsp���� sub�̹����� ������ŭ �ݺ��� ����� ���� ī��Ʈ ����

		Map<String, Object> item = new HashMap<String, Object>();
		List<String> imageList = new ArrayList<String>();

		
		List<ImageVO> detailImage = imageService.selectImgOne(product_id);	
		
		for (int i = 0 ; i<detailImage.size() ; i++) {
			
			String encodeImage = Base64.getEncoder().encodeToString(detailImage.get(i).getImage_file());
			
			if (detailImage.get(i).getImage_category().contains("body")) {
				imageList.add(encodeImage);

			} else {
				item.put(detailImage.get(i).getImage_category(), encodeImage);
			}

		}
		
		item.put("body", imageList);
				
		ProductVO product = productDAO.selectProduct(product_id);
		String body = product.getProduct_body().replaceAll("(\r\n|\r|\n|\n\r)", "&#10;");
		product.setProduct_body(body);
		
		item.put("productVO", product);
		// ��ǰ ���� ����
		productInfo.put("product", item);
		
		return productInfo;
			
	}
	
	
	@Override
	public Map<String, Map<String, Object>> productListToOption(Map<String, String> option) throws Exception {

		// �ɼǿ� ���� ��ǰ����Ʈ ����
		List<ProductVO> productList = productDAO.productListToOption(option);
						
		// �������� ȣ���� ��ǰ���� + �̹����� ���� ��ü ����
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
			String encodeImage = "";
			if (product != null) {
				
				String match_id = product.getProduct_id();
				
				for(int j=0 ; j<imageList.size(); j++) {
					if(imageList.get(j).getImage_match_id().equals(match_id)) {
						
						encodeImage = Base64.getEncoder().encodeToString(imageList.get(j).getImage_file());
					}
				}

				// ��ǰ ����� �̹����� ���� ��ü ����
				Map<String, Object> productInfo = new HashMap<String, Object>();
				
				// byte[] �ڷḦ img �±׿� ��밡���ϵ��� encode
				productInfo.put("product_main_title", product.getProduct_main_title());
				productInfo.put("product_sub_title", product.getProduct_sub_title());
				productInfo.put("product_price", product.getProduct_price());
				productInfo.put("product_discount", product.getProduct_discount());
				productInfo.put("image_file", encodeImage);
				productInfo.put("product_id", product.getProduct_id());

				fullProductList.put("product" + (i+1), productInfo);
				
			}

		}
		}

		return fullProductList;

	}
	
}
