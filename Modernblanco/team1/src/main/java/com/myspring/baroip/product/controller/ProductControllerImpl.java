// 2022.01.08 윤상현

package com.myspring.baroip.product.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.product.service.ProductService;
import com.myspring.baroip.product.vo.ProductVO;

@Controller("productController")
@RequestMapping(value = "/product")
public class ProductControllerImpl implements ProductController {
	
	@Autowired
	private ProductService productService;

	// 상품관리 페이지 전체 mapping
	@Override
	@RequestMapping(value = "/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView product(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/product_list/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		
		// get 요청이 없을경우, 기존의 session을 제거
		if (info.isEmpty()) {
			session.removeAttribute("main_option");
			session.removeAttribute("sub_option");
			session.removeAttribute("title_option");
			session.removeAttribute("order_option");
		}
		
		
		if(viewName.contains("farm")) {
			info.put("main_option", "farm");
			mav.addObject("pageInfo", "set_farm");
		}
		else if(viewName.contains("marine")) {
			info.put("main_option", "marine");
			mav.addObject("pageInfo", "set_marine");
		}
		else if(viewName.contains("meat")) {
			info.put("main_option", "meat");
			mav.addObject("pageInfo", "set_meat");
		}
		Map<String, Map<String, Object>> productFullList = getFullList(info, request);
		
	
		String pageNo = info.get("pageNo");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (productFullList.size()+11)/12;
			
			if (Integer.parseInt(pageNo) > lastNo) {
				mav.addObject("pageNo", 1);
				mav.setViewName("redirect:"+viewName +".do");
			}
			else {
				mav.addObject("pageNo", pageNo);	
				mav.setViewName(viewName);
			}
			
		} else {
			mav.addObject("pageNo", 1);
			mav.setViewName(viewName);
		}
		mav.addObject("productFullList", productFullList);
		return mav;
	}
	

	
	@Override
	@RequestMapping(value = "/productDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productDetail(@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");		
		Map<String, Map<String, Object>> productInfo = productService.productDetail(product_id);
		
		ProductVO product = (ProductVO)productInfo.get("product").get("productVO");
		// 선택된 상품의 카테고리를 식별하여 헤더 style 설정을 위한 세팅
		String pageInfo = "";
		if (product.getProduct_main_category().equals("농산물")) {
			pageInfo = "set_farm";
		}
		else if (product.getProduct_main_category().equals("수산물")) {
			pageInfo = "set_marine";
		} 
		else if (product.getProduct_main_category().equals("축산물")) {
			pageInfo = "set_meat";
		}
		
		HttpSession session = request.getSession();
		String mainImg = (String) productInfo.get("product").get("main");
		List<String> lastImage = new ArrayList<String>();
		List<String> lastProduct = new ArrayList<String>();
		
		
		if(session.getAttribute("lastProduct") != null) {
			
			for(Object item : (ArrayList<?>)session.getAttribute("lastImage")) {
				lastImage.add((String) item);
			}
			
			for(Object item : (ArrayList<?>)session.getAttribute("lastProduct")) {
				lastProduct.add((String) item);
			}
			
			// 기존에 봤던 상품이 lastProduct에 포함되어있지 않은 경우에만 처리
			if(!lastProduct.contains(product_id)) {

				if(lastProduct.size() == 1) {
					lastProduct.add(product_id);
					lastImage.add(mainImg);
					
					session.setAttribute("lastProduct", lastProduct);
					session.setAttribute("lastImage", lastImage);
				}
				else if(lastProduct.size() == 2) {
					lastProduct.set(1, lastProduct.get(0));
					lastProduct.set(0, product_id);
					
					lastImage.set(1, lastImage.get(0));
					lastImage.set(0, mainImg);
					
					session.setAttribute("lastProduct", lastProduct);
					session.setAttribute("lastImage", lastImage);
					
				}
			}

			

		}
		
		// 기존 값이 없을경우 할당.
		else {
			lastProduct.add(product_id);
			lastImage.add(mainImg);
			
			session.setAttribute("lastProduct", lastProduct);
			session.setAttribute("lastImage", lastImage);
		}

		
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("productInfo", productInfo);
		mav.setViewName(viewName);

		return mav;
	}

	// 상품 조회 필터 사용시, 세션에 있는 상품정보를 확인 후 서비스로 처리하는 메소드
		public Map<String, Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			
			// Map options에는 조회하고자 하는 조건명 main_option / sub_option / title_option / order_option 이 있으며, main_option은 반드시 포함되어야한다.
			// * main_option(main_category 설정) = value [farm / marine / meat]
			// sub_option(sub_category 설정) = value [채소/곡물/과일, 생선류/갑각류/해조류, 돼지고기/소고기/기타]
			// title_option(main_category 설정) = value [farm / marine / meat]
			// order_option(main_category 설정) = value [farm / marine / meat]
			
			Map<String, String> options = new HashMap<String, String>();
			String paramSub = info.get("sub_option");
			String paramTitle = info.get("title_option");
			String paramOrder = info.get("order_option");
			
			String sessionSub = (String) session.getAttribute("sub_option");
			String sessionTitle = (String) session.getAttribute("title_option");
			String sessionOrder = (String) session.getAttribute("order_option");

			// paramSub 검색조건이 session 혹은 param에 존재할 경우 처리
			if (paramSub != null || sessionSub != null) {
				
				// param에 조건이 있을경우
				if(paramSub != null && sessionSub == null) {
					options.put("sub_option", paramSub);
					session.setAttribute("sub_option", paramSub);
				}
				// session에 조건이 있을경우
				else if(paramSub == null && sessionSub != null) {
					options.put("sub_option", sessionSub);
				}
				// param과 session 모두에 조건이 있을경우
				else {
					// param과 session의 조건이 동일할 경우, 기존 session의 조건 전달
					if(paramSub.equals(sessionSub)) {
						options.put("sub_option", sessionSub);
					}
					// param과 session의 조건이 다를 경우, session에 set후, param 조건 전달
					else {
						options.put("sub_option", paramSub);
						session.setAttribute("sub_option", paramSub);
					}
				} 
			
			}
			// paramSub 검색조건이 session 혹은 param에 존재할 경우 처리			
			if (paramTitle != null || sessionTitle != null) {
				
				// param에 조건이 있을경우	
				if(paramTitle != null && sessionTitle == null) {
					options.put("title_option", paramTitle);
					session.setAttribute("title_option", paramTitle);
				}
				// session에 조건이 있을경우
				else if(paramTitle == null && sessionTitle != null) {
					options.put("title_option", sessionTitle);
				}
				// param과 session 모두에 조건이 있을경우
				else {
					// param과 session의 조건이 동일할 경우, 기존 session의 조건 전달
					if(paramTitle.equals(sessionTitle)) {
						options.put("title_option", sessionTitle);
					}
					// param과 session의 조건이 다를 경우, session에 set후, param 조건 전달
					else {
						options.put("title_option", paramTitle);
						session.setAttribute("title_option", paramTitle);
					}
				} 
			
			} 
			// paramSub 검색조건이 session 혹은 param에 존재할 경우 처리			
			if (paramOrder != null || sessionOrder != null) {
				
				// param에 조건이 있을경우
				if(paramOrder != null && sessionOrder == null) {
					options.put("order_option", paramOrder);
					session.setAttribute("order_option", paramOrder);
				}
				// session에 조건이 있을경우
				else if(paramOrder == null && sessionOrder != null) {
					options.put("order_option", sessionOrder);
				}
				// param과 session 모두에 조건이 있을경우
				else {
					// param과 session의 조건이 동일할 경우, 기존 session의 조건 전달
					if(paramOrder.equals(sessionOrder)) {
						options.put("order_option", sessionOrder);
					}
					// param과 session의 조건이 다를 경우, session에 set후, param 조건 전달
					else {
						options.put("order_option", paramOrder);
						session.setAttribute("order_option", paramOrder);
					}
				} 
			
			} 		
			options.put("main_option", info.get("main_option"));
			Map<String, Map<String, Object>> fullList = productService.productListToOption(options);
			
			return fullList;
		}
	
//	배송,교환,반품 안내
		@RequestMapping(value = "/productInfoPage.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView productInfoPage(@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");

			mav.addObject("product_id", product_id);
			mav.setViewName(viewName);
			
			return mav;
		}
		
}
