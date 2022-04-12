package com.myspring.baroip.cart.controller;

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

import com.myspring.baroip.cart.service.CartService;
import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.product.service.ProductService;
import com.myspring.baroip.user.vo.UserVO;


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
	
	
	// 장바구니 페이지
	@Override
	@RequestMapping(value= "/cartList.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView mycartList(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		Map<String, Map<String, Map<String, Object>>> userCartListInfo = new HashMap<String, Map<String, Map<String, Object>>>();
//		회원 장바구니 리스트
		if(userVO != null) {
			String user_id = userVO.getUser_id();
			cartVO.setUser_id(user_id);
			userCartListInfo = cartService.myCartList(cartVO);
			mav.addObject("userCartListInfo", userCartListInfo);
			
		}
//		비회원 장바구니 리스트
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
	
//	상품 상세 페이지 > 장바구니 담기
	@Override
	@ResponseBody
	@RequestMapping(value= "/addProductInCart.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String addProductInCart(@RequestParam("product_id") String product_id, @RequestParam("cart_count") int cart_count,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		String message = "";
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		
//		로그인 상태 장바구니 담기
		if(userVO != null) {
			String user_id = userVO.getUser_id();
			cartVO.setUser_id(user_id);
			cartVO.setProduct_id(product_id);
			cartVO.setCart_count(cart_count);				
			boolean productInCart = cartService.selectProductInCart(cartVO);
//		장바구니에 해당 상품이 있는지 확인
			if(productInCart == true) {
				message = "overLapProduct";
			}
			else {
				cartService.addProductInCart(cartVO);
				message = "addProduct";
			}
		}
//		비로그인 장바구니 담기
		else {
			List<CartVO> guestCartList = new ArrayList<CartVO>();
			@SuppressWarnings("unchecked")
			List<CartVO> sessionCart = (List<CartVO>)session.getAttribute("guestCartAdd");
			
//			세션에 값이 있었다면 기존 값을 저장
			if(sessionCart != null) {
				guestCartList = sessionCart;
				boolean test = false;
//				기존 값 중 현재 값과 같은 값이 있는지 확인
				for(int i = 0; guestCartList.size() > i; i++) {
					if(guestCartList.get(i).getProduct_id().contains(product_id)) {
						test = true;
						break;
					}
				}
//				같은 값이 존재 할 경우
				if(test) {
					message = "overLapProduct";
				}
//				같은 값이 없으면 해당 값을 기존 값에 추가 후 세션에 저장
				else {
					cartVO = new CartVO();
					cartVO.setProduct_id(product_id);
					cartVO.setCart_count(cart_count);
					guestCartList.add(cartVO);
					session.setAttribute("guestCartAdd", guestCartList);
					message = "addProduct";
				}
			}
//			세션에 값이 없다면 값을 추가해 세션에 저장
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
	
//	상세페이지 동일 상품 추가
	@Override
	@ResponseBody
	@RequestMapping(value= "/cartInProductOverLap.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public void cartInProductOverLap(@RequestParam("product_id") String product_id, @RequestParam("cart_count") int cart_count,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		
//		로그인 동일 상품 수량 추가
		if(userVO != null) {
			String user_id = userVO.getUser_id();
			cartVO.setUser_id(user_id);
			cartVO.setProduct_id(product_id);
			cartVO.setCart_count(cart_count);
			cartService.ProductOverLap(cartVO);
		}
//		비로그인 동일 상품 수량 추가
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
	
//	장바구니 상품 삭제
	@Override
	@ResponseBody
	@RequestMapping(value= "/cartListDelete.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String cartListDelete(@RequestParam("deleteList") List<String> deleteList, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		List<String> productList = new ArrayList<String>();
		
//		로그인 회원 선택 상품 삭제
		if(userVO != null) {
			Map<String, Object> item = new HashMap<String, Object>();
//			체크된 product_id 담아주기 위해 생성
			String user_id = userVO.getUser_id();
			item.put("user_id", user_id);
			for(int i = 0; deleteList.size() > i; i++) {
				productList.add(deleteList.get(i).replace("\"", "").replace("[", "").replace("]", ""));
			}
			item.put("product_id", productList);
			cartService.deleteCartItem(item);
		}
	//		비로그인 장바구니 상품 삭제
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
