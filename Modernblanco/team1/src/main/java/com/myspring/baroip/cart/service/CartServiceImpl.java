package com.myspring.baroip.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.cart.dao.CartDAO;
import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.product.service.ProductService;

@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private ProductService productService;
	
//	장바구니 페이지
	@Override
	public Map<String, Map<String, Map<String, Object>>> myCartList(CartVO cartVO) throws Exception{
		
		Map<String, Map<String, Map<String, Object>>> userCartListInfo = new HashMap<String, Map<String, Map<String, Object>>>();
		List<CartVO> cartList = cartDAO.selectCartList(cartVO);

		for(int i=0; i<cartList.size(); i++) {
			
			Map<String, Map<String, Object>> productList = new HashMap<String, Map<String, Object>>();
			Map<String, Object> cartItem = new HashMap<String, Object>();

			String productId=cartList.get(i).getProduct_id();

			productList = productService.productDetail(productId);
			cartItem.put("cartVO", cartList.get(i));
			productList.put("cart", cartItem);
			userCartListInfo.put("myCartList" + (i+1), productList);
		}
		
		return userCartListInfo;
	}
	
//	장바구니 담기
	@Override
	public void addProductInCart(CartVO cartVO) throws Exception {
		cartDAO.insertProductInCart(cartVO);
	}
	
//	해당 회원의 장바구니에 상품이 있는지 확인
	@Override
	public boolean selectProductInCart(CartVO cartVO) throws Exception {
		return cartDAO.selectProductInCart(cartVO);
	}
	
//	상세페이지 동일 상품 추가
	@Override
	public void ProductOverLap(CartVO cartVO) throws Exception {
		cartDAO.overLapCartList(cartVO);
	}
	
//	장바구니 상품 삭제 테스트
	@Override
	public void deleteCartItem(Map<String, Object> deleteList) throws Exception {
		cartDAO.deleteCartList(deleteList);
	}

}
