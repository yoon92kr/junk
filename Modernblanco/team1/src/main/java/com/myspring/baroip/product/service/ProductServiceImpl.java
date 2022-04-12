// 2022.01.08 윤상현

package com.myspring.baroip.product.service;


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

import com.myspring.baroip.image.service.ImageService;
import com.myspring.baroip.image.vo.ImageVO;
import com.myspring.baroip.product.dao.ProductDAO;
import com.myspring.baroip.product.vo.ProductVO;

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

		// 베스트 상품 리스트 대입
		List<ProductVO> bestProducts = productDAO.selectBestProduct();
		
		List<Integer> product_id_list = new ArrayList<Integer>();
		Map<String, String> imageArray = new HashMap<String, String>();
		
		for(ProductVO item : bestProducts) {
			product_id_list.add(Integer.parseInt(item.getProduct_id().split("_")[1]));
		}

		imageArray.put("start", "product_"+Collections.min(product_id_list));
		imageArray.put("end", "product_"+Collections.max(product_id_list));
		
		List<ImageVO> imageList = imageService.selectAllImage(imageArray);
		
		
		// 메인화면에 호출할 세개의 상품정보 + 이미지를 담을 객체 생성 (mainProduct 1~3)
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
				
				// 상품 내용과 이미지를 담을 객체 생성
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
	
	// product detail 조회 service
	@Override
	public Map<String, Map<String, Object>> productDetail(String product_id) throws Exception {
		
		// 이미지정보 / 상품정보를 담을 객체 생성
		Map<String, Map<String, Object>> productInfo= new HashMap<String, Map<String, Object>>();

		// jsp에서 sub이미지의 갯수만큼 반복문 사용을 위한 카운트 변수

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
		// 상품 정보 대입
		productInfo.put("product", item);
		
		return productInfo;
			
	}
	
	
	@Override
	public Map<String, Map<String, Object>> productListToOption(Map<String, String> option) throws Exception {

		// 옵션에 따른 상품리스트 선택
		List<ProductVO> productList = productDAO.productListToOption(option);
						
		// 페이지에 호출할 상품정보 + 이미지를 담을 객체 생성
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

				// 상품 내용과 이미지를 담을 객체 생성
				Map<String, Object> productInfo = new HashMap<String, Object>();
				
				// byte[] 자료를 img 태그에 사용가능하도록 encode
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
