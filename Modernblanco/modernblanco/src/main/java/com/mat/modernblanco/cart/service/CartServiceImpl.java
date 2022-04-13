package com.mat.modernblanco.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mat.modernblanco.cart.dao.CartDAO;
import com.mat.modernblanco.cart.vo.CartVO;
import com.mat.modernblanco.product.service.ProductService;

@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private ProductService productService;
	
//	��ٱ��� ������
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
	
//	��ٱ��� ���
	@Override
	public void addProductInCart(CartVO cartVO) throws Exception {
		cartDAO.insertProductInCart(cartVO);
	}
	
//	�ش� ȸ���� ��ٱ��Ͽ� ��ǰ�� �ִ��� Ȯ��
	@Override
	public boolean selectProductInCart(CartVO cartVO) throws Exception {
		return cartDAO.selectProductInCart(cartVO);
	}
	
//	�������� ���� ��ǰ �߰�
	@Override
	public void ProductOverLap(CartVO cartVO) throws Exception {
		cartDAO.overLapCartList(cartVO);
	}
	
//	��ٱ��� ��ǰ ���� �׽�Ʈ
	@Override
	public void deleteCartItem(Map<String, Object> deleteList) throws Exception {
		cartDAO.deleteCartList(deleteList);
	}

}
