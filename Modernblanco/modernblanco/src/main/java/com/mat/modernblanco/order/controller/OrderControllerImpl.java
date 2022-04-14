// 2022.01.14 ������

package com.mat.modernblanco.order.controller;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mat.modernblanco.cart.vo.CartVO;
import com.mat.modernblanco.order.service.OrderService;
import com.mat.modernblanco.order.vo.OrderVO;
import com.mat.modernblanco.product.service.ProductService;
import com.mat.modernblanco.user.service.UserService;
import com.mat.modernblanco.user.vo.UserVO;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("orderController")
@RequestMapping(value = "/order")
public class OrderControllerImpl implements OrderController {

	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;

	// Order ��ü mapping
	@Override
	@RequestMapping(value = "/*.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}

	// �ֹ� ������ �̵� ��Ʈ�ѷ�
	// post ������ �迭������ product_id�� �����ؾ� �Ѵ�.
	@Override
	@RequestMapping(value = "/order_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userInfo");
		String viewName = (String) request.getAttribute("viewName");
		String lastViewName = "";
		if(request.getParameter("lastViewName") != null) {
			lastViewName = (String) request.getParameter("lastViewName");
		}
	
		String[] arrayProductID = request.getParameterValues("product_id");
		Map<String, Map<String, Map<String, Object>>> productList = new HashMap<String, Map<String, Map<String, Object>>>();

		if (arrayProductID.length != 0) {

			for (int i = 0; i < arrayProductID.length; i++) {
				Map<String, Map<String, Object>> productInfo = productService.productDetail(arrayProductID[i]);

				// ��ٱ��ϸ� ���� �ֹ��������� �̵����� ���.
				if (lastViewName.contains("cart")) {

					// �α��� ������ ���, cart�� ������ ��ȸ�Ѵ�.
					if (userVO != null) {
						CartVO cartVO = new CartVO();
						cartVO.setUser_id(userVO.getUser_id());
						cartVO.setProduct_id(arrayProductID[i]);
						int count = orderService.selectCount(cartVO);

						Map<String, Object> order_amount = new HashMap<String, Object>();
						order_amount.put("order_amount", count);
						productInfo.put("count", order_amount);
					}
					// ��ȸ�� ������ ��� session�� ������ ��ȸ�Ѵ�.
					else {
						List<CartVO> sessionCart = new ArrayList<CartVO>();

						if (session.getAttribute("guestCartAdd") != null) {

							for (Object item : (ArrayList<?>) session.getAttribute("guestCartAdd")) {
								sessionCart.add((CartVO) item);
							}

							for (CartVO cartVO : sessionCart) {
								if (cartVO.getProduct_id().equals(arrayProductID[i])) {

									int count = cartVO.getCart_count();

									Map<String, Object> order_amount = new HashMap<String, Object>();
									order_amount.put("order_amount", count);
									productInfo.put("count", order_amount);

								}
							}
						}

					}

				}
				else {
					int direct_amount = Integer.parseInt(request.getParameter("order_count_direct"));
					Map<String, Object> order_amount = new HashMap<String, Object>();
					order_amount.put("order_amount", direct_amount);
					productInfo.put("count", order_amount);	
				}
				productList.put("product" + (i + 1), productInfo);
			}

			mav.addObject("productList", productList);
			mav.setViewName(viewName);
		}

		else {
			mav.setViewName("redirect:/main.do");
		}

		return mav;
	}
	
	// ���� �Ϸ� ��Ʈ�ѷ�
/* 	@Override
	@RequestMapping(value = "/order_complete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderComplete(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.removeAttribute("order_return");
		if(session.getAttribute("resultOrder") != null) {
			
			if(session.getAttribute("resultOrder").equals("false")) {
				mav.setViewName("redirect:/main.do");
			}
						
		}

		else {
		String viewName = (String) request.getAttribute("viewName");
		
		Map<String, Object> returnObject = new HashMap<String, Object>();
		
		if(info.get("paymentKey") != null) {
						
			HttpRequest payRequest = HttpRequest.newBuilder()
				    .uri(URI.create("https://api.tosspayments.com/v1/payments/"+info.get("paymentKey")))
				    .header("Authorization", "Basic dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg==")
				    .header("Content-Type", "application/json")
				    .method("POST", HttpRequest.BodyPublishers.ofString("{\"amount\":"+info.get("amount")+",\"orderId\":\""+info.get("orderId")+"\"}"))
				    .build();
				HttpResponse<String> payResponse = HttpClient.newHttpClient().send(payRequest, HttpResponse.BodyHandlers.ofString());
				
				String json = payResponse.body();
				JSONParser parser = new JSONParser();
				JSONObject object = (JSONObject) parser.parse(json);
				Long test_order_amountL = (Long) object.get("totalAmount");
				JSONObject objectVirtual = (JSONObject)object.get("virtualAccount");
				
				//�ֹ���ȣ
				returnObject.put("test_order_ID", (String) object.get("orderId"));
				//�������
				returnObject.put("test_order_payment", (String) object.get("method"));
				// �Ա� ����
				returnObject.put("test_order_bank", (String) objectVirtual.get("bank"));
				// �ֹ� �ݾ�
				returnObject.put("test_order_amount", test_order_amountL.intValue());

			
		}
		
		else {
			
			//�ֹ���ȣ
			returnObject.put("test_order_ID", info.get("order_id"));

			// �ֹ� �ݾ�
			returnObject.put("test_order_amount", info.get("order_amount"));
	
			
		}


		session.setAttribute("order_return", returnObject);
		mav.setViewName(viewName);
		}
		return mav;
		
	} */

	@Override
	@ResponseBody
	@RequestMapping(value = "/order_product.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public void orderProduct(HttpServletRequest request, @ModelAttribute("orderVO") OrderVO orderVO, @RequestParam("order_product_list") List<String> order_product_list) throws Exception{
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		String order_id = orderVO.getOrder_id();
		String user_id = orderVO.getUser_id();
		int usePoint = orderVO.getOrder_payment_point();
		if(user_id.equals("Not_log_in")) {
			user_id = userService.guestJoin();
		}
		if(userVO != null && userVO.getUser_point() < usePoint) {
			
			session.setAttribute("resultOrder", "false");
			
		}
		
		else {
			Map<String, String> userMap = new HashMap<String, String>();
			if(userVO != null) {
				userMap.put("user_id", userVO.getUser_id());
				userMap.put("user_pw", userVO.getUser_pw());
				
				userVO.setUser_point(userVO.getUser_point() - usePoint);
				session.setAttribute("userInfo", userVO);
				
				UserVO newUserInfo = userService.login(userMap);
				session.removeAttribute("userInfo");
				session.setAttribute("userInfo", newUserInfo);
			}
			orderService.updatePointToOrder(orderVO);
		
			for(int i = 0; order_product_list.size() > i; i++) {
				String productToAmount = order_product_list.get(i).replace("\"", "").replace("[", "").replace("]", "");
				String[] splitParam = productToAmount.split("=");
				int amount = Integer.parseInt(splitParam[1]);
				
				orderVO.setOrder_id(order_id+'_'+i);
				orderVO.setProduct_id(splitParam[0]);
				orderVO.setOrder_amount(amount);
				orderVO.setUser_id(user_id);
			
				orderService.addOrder(orderVO);
							
			}
							
		}
				
	}
	
}