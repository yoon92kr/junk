package com.mat.modernblanco.cart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mat.modernblanco.cart.service.CartService;
import com.mat.modernblanco.cart.vo.CartVO;
import com.mat.modernblanco.product.service.ProductService;
import com.mat.modernblanco.user.vo.UserVO;


@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl implements CartController{
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private UserVO userVO;
	@Autowired
	private ProductService productService;
	
	
	// ��ٱ��� ������
	@Override
	@RequestMapping(value= "/cartList.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView mycartList(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		Map<String, Map<String, Map<String, Object>>> userCartListInfo = new HashMap<String, Map<String, Map<String, Object>>>();
//		ȸ�� ��ٱ��� ����Ʈ
		if(userVO != null) {
			String user_id = userVO.getUser_id();
			cartVO.setUser_id(user_id);
			userCartListInfo = cartService.myCartList(cartVO);
			mav.addObject("userCartListInfo", userCartListInfo);
			
		}
//		��ȸ�� ��ٱ��� ����Ʈ
		else {
			@SuppressWarnings("unchecked")
			List<CartVO> notUserCart = (List<CartVO>) session.getAttribute("guestCartAdd");
			if(notUserCart != null) {
				for(int i = 0; i < notUserCart.size(); i++) {
					Map<String, Object> cartItem = new HashMap<String, Object>();
					Map<String, Map<String, Object>> guestCart = new HashMap<String, Map<String, Object>>();
					
					String ProductId=notUserCart.get(i).getProduct_id();
					
					guestCart=productService.productDetail(ProductId);
					cartItem.put("cartVO", notUserCart.get(i));
					guestCart.put("cart", cartItem);
					userCartListInfo.put("myCartList" + (i+1), guestCart);
				}
			}
			else {
				userCartListInfo = null;
			}
			session.setAttribute("userCartListInfo", userCartListInfo);
		}
		mav.setViewName(viewName);
		return mav;
		
	}
	
//	��ǰ �� ������ > ��ٱ��� ���
	@Override
	@ResponseBody
	@RequestMapping(value= "/addProductInCart.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String addProductInCart(@RequestParam("product_id") String product_id, @RequestParam("cart_count") int cart_count,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		String message = "";
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		
//		�α��� ���� ��ٱ��� ���
		if(userVO != null) {
			String user_id = userVO.getUser_id();
			cartVO.setUser_id(user_id);
			cartVO.setProduct_id(product_id);
			cartVO.setCart_count(cart_count);				
			boolean productInCart = cartService.selectProductInCart(cartVO);
//		��ٱ��Ͽ� �ش� ��ǰ�� �ִ��� Ȯ��
			if(productInCart == true) {
				message = "overLapProduct";
			}
			else {
				cartService.addProductInCart(cartVO);
				message = "addProduct";
			}
		}
//		��α��� ��ٱ��� ���
		else {
			List<CartVO> guestCartList = new ArrayList<CartVO>();
			@SuppressWarnings("unchecked")
			List<CartVO> sessionCart = (List<CartVO>)session.getAttribute("guestCartAdd");
			
//			���ǿ� ���� �־��ٸ� ���� ���� ����
			if(sessionCart != null) {
				guestCartList = sessionCart;
				boolean test = false;
//				���� �� �� ���� ���� ���� ���� �ִ��� Ȯ��
				for(int i = 0; guestCartList.size() > i; i++) {
					if(guestCartList.get(i).getProduct_id().contains(product_id)) {
						test = true;
						break;
					}
				}
//				���� ���� ���� �� ���
				if(test) {
					message = "overLapProduct";
				}
//				���� ���� ������ �ش� ���� ���� ���� �߰� �� ���ǿ� ����
				else {
					cartVO = new CartVO();
					cartVO.setProduct_id(product_id);
					cartVO.setCart_count(cart_count);
					guestCartList.add(cartVO);
					session.setAttribute("guestCartAdd", guestCartList);
					message = "addProduct";
				}
			}
//			���ǿ� ���� ���ٸ� ���� �߰��� ���ǿ� ����
			else {
				cartVO = new CartVO();
				cartVO.setProduct_id(product_id);
				cartVO.setCart_count(cart_count);
				guestCartList.add(cartVO);
				session.setAttribute("guestCartAdd", guestCartList);
				message = "addProduct";
			}
		}
		return message;
	}
	
//	�������� ���� ��ǰ �߰�
	@Override
	@ResponseBody
	@RequestMapping(value= "/cartInProductOverLap.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public void cartInProductOverLap(@RequestParam("product_id") String product_id, @RequestParam("cart_count") int cart_count,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		
//		�α��� ���� ��ǰ ���� �߰�
		if(userVO != null) {
			String user_id = userVO.getUser_id();
			cartVO.setUser_id(user_id);
			cartVO.setProduct_id(product_id);
			cartVO.setCart_count(cart_count);
			cartService.ProductOverLap(cartVO);
		}
//		��α��� ���� ��ǰ ���� �߰�
		else {
			List<CartVO> guestCartList = new ArrayList<CartVO>();
			@SuppressWarnings("unchecked")
			List<CartVO> sessionCart = (List<CartVO>)session.getAttribute("guestCartAdd");
			
			if(sessionCart != null) {
				guestCartList = sessionCart;
			}

			for(int i=0; guestCartList.size()>i; i++) {
				if(guestCartList.get(i).getProduct_id().equals(product_id)) {
					int newCount = guestCartList.get(i).getCart_count() + cart_count;
					guestCartList.get(i).setCart_count(newCount);
					guestCartList.get(i).setProduct_id(product_id);
				}
			}
			session.setAttribute("guestCartAdd", guestCartList);
		}
	}
	
//	��ٱ��� ��ǰ ����
	@Override
	@ResponseBody
	@RequestMapping(value= "/cartListDelete.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String cartListDelete(@RequestParam("deleteList") List<String> deleteList, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		List<String> productList = new ArrayList<String>();
		
//		�α��� ȸ�� ���� ��ǰ ����
		if(userVO != null) {
			Map<String, Object> item = new HashMap<String, Object>();
//			üũ�� product_id ����ֱ� ���� ����
			String user_id = userVO.getUser_id();
			item.put("user_id", user_id);
			for(int i = 0; deleteList.size() > i; i++) {
				productList.add(deleteList.get(i).replace("\"", "").replace("[", "").replace("]", ""));
			}
			item.put("product_id", productList);
			cartService.deleteCartItem(item);
		}
	//		��α��� ��ٱ��� ��ǰ ����
			else {
				@SuppressWarnings("unchecked")
				List<CartVO> guestCartList = (List<CartVO>)session.getAttribute("guestCartAdd");
				String deleteItem;
				for(int i = 0; deleteList.size() > i; i++) {
					deleteItem = deleteList.get((i)).replace("\"", "").replace("[", "").replace("]", "");
					for(int s = 0; guestCartList.size() > s; s++) {
						if(guestCartList.get(s).getProduct_id().contains(deleteItem)) {
							guestCartList.remove(s);
						}
					}
				}
				session.setAttribute("guestCartAdd", guestCartList);
			}
		return "success";
	}
	
}
