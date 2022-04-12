// 2021.12.08 윤상현

package com.myspring.baroip.adminProduct.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.adminProduct.service.AdminProductService;
import com.myspring.baroip.image.controller.ImageController;
import com.myspring.baroip.product.service.ProductService;
import com.myspring.baroip.product.vo.ProductVO;
import com.myspring.baroip.user.vo.UserVO;

@Controller("adminProductController")
@RequestMapping(value = "/admin/product")
public class AdminProductControllerImpl implements AdminProductController {

	@Autowired
	private AdminProductService adminProductService;
	@Autowired
	private ImageController imageController;
	@Autowired
	private ProductService productService;

	// 상품관리 페이지 전체 mapping
	@Override
	@RequestMapping(value = "/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}

	// 상품 임시 등록
	@Override
	@RequestMapping(value = "/addProduct.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addProduct(@ModelAttribute("productVO") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String lastViewName = "/admin/product/extra_list";
		// String lastViewName = (String)multipartRequest.getParameter("last_view_name");
		String product_id = adminProductService.addProduct(productVO);
		String message = "[" + product_id + "]의 임시등록이 완료되었습니다.";
		HttpSession session = multipartRequest.getSession();
		session.setAttribute("message", message);

		mav.setViewName("redirect:"+lastViewName+".do");
		System.out.println("baroip : " + message);
		imageController.ImageSetImageVO(multipartRequest, product_id);

		// 등록된 상품 이미지 파일 저장
		return mav;
	}

	// rank 2 관리자의 임시상품관리 메뉴 컨트롤러
	@Override
	@RequestMapping(value = "/extra_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView extraList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		// get 요청이 없을경우, 기존의 session을 제거
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		Map<String, Map<String, Object>> extraFullList = getFullList(info, request);

		

		
		String pageNo = info.get("pageNo");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (extraFullList.size()+4)/5;
			
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
		mav.addObject("extraList", extraFullList);
		return mav;
	}
	
	// rank 3 이상의 관리자의 쇼핑몰 전체상품관리 메뉴 컨트롤러
	@Override
	@RequestMapping(value = "/general_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView generalList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		// get 요청이 없을경우, 기존의 session을 제거
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		Map<String, Map<String, Object>> generalFullList = getFullList(info, request);
		
		String pageNo = info.get("pageNo");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (generalFullList.size()+4)/5;
			
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
		mav.addObject("generalList", generalFullList);

		return mav;
	}

	// 상품 수량 변경 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/update_amount.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public String update_amount(@RequestParam Map<String, String> info) throws Exception {

		adminProductService.updateAmount(info);
		String title = info.get("product_title");
		String amount = info.get("product_amount");
		String message = "[" + title + "]의 재고 수량이 [" + amount + "]개로 정상적으로 변경되었습니다.";

		System.out.printf("baorip : [%s]의 재고 수량이 [%s]로 변경되었습니다.%n", title, amount);

		return message;
	}

	@Override
	@RequestMapping(value = "/delete_product.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView delete_product(@RequestParam("product_id") String product_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		adminProductService.deleteProduct(product_id);

		System.out.printf("baroip : [%s]상품이 정삭적으로 삭제되었습니다.%n", product_id);
		mav.setViewName("redirect:/admin/product/extra_list.do");

		return mav;
	}

	@Override
	@RequestMapping(value = "/update_product_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView update_product_form(@RequestParam("product_id") String product_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		Map<String, Map<String, Object>> productInfo = productService.productDetail(product_id);

		mav.addObject("productInfo", productInfo);
		mav.setViewName(viewName);
		return mav;

	}

	@Override
	@RequestMapping(value = "/update_product.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView update_product(@ModelAttribute("productVO") ProductVO productVO,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String lastViewName = "/admin/product/extra_list";
		// String lastViewName = (String)multipartRequest.getParameter("last_view_name");
		adminProductService.updateProduct(productVO);
		String message = "관리자 " + productVO.getUser_id() + " 님이 [" + productVO.getProduct_main_title() + "]의 수정을 완료되었습니다.";

		HttpSession session = multipartRequest.getSession();
		session.setAttribute("message", message);
		imageController.updateImage(multipartRequest, productVO.getProduct_id());
		mav.setViewName("redirect:"+lastViewName+".do");
		System.out.println("baroip : " + message);

		return mav;
	}
	
	// 상품 상태 수정 컨트롤러
	@Override
	@RequestMapping(value = "/update_state.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public ModelAndView update_state(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		String lastViewName = "/admin/product/extra_list";
		// String lastViewName = (String)request.getAttribute("lastViewName");
		adminProductService.updateState(info);
		mav.setViewName("redirect:"+lastViewName+".do");
		System.out.printf("baroip : [%s] 상품의 상태가 정삭적으로 변경되었습니다.%n", info.get("product_title"));
		return mav;
	}

	// 상품 조회 필터 사용시, 세션에 있는 상품정보를 확인 후 서비스로 처리하는 메소드
	public Map<String, Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		// Map options에는 조회하고자 하는 조건유형 option, 조건에 해당하는 value 가 반드시 포함되어야한다.
		// search_option(검색 조건) = value [productCreDate / productTitle / productStates / productAmount]
		// search_value(검색 값) = value [yyyy-mm-dd,yyyy-mm-dd / product_main_title / 0 or 1 or all) / int]
		Map<String, String> options = new HashMap<String, String>();
		
		String paramOption = info.get("search_option");
		String paramValue = info.get("search_value");
		
		String sessionOption = (String) session.getAttribute("search_option");
		String sessionValue = (String) session.getAttribute("search_value");
		
		String viewName = (String) request.getAttribute("viewName");
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		String[] viewSplit = viewName.split("/");
		
		// param, session 모두 option이 바인딩 되어있는 경우
		if (paramOption != null && sessionOption != null) {

				// 두 옵션이 일치할 경우, options에 기존 session의 값을 대입한다.
				if (paramOption.equals(sessionOption) && paramValue.equals(sessionValue)) {
					options.put("search_option", sessionOption);
					options.put("search_value", sessionValue);
				}

				// 두 옵션이 일치하지 않을 경우, options에 paramOption을 대입하고, 기존 세션을 Override 한다.
				else {
					options.put("search_option", paramOption);
					options.put("search_value", paramValue);

					session.setAttribute("search_option", paramOption);
					session.setAttribute("search_value", paramValue);
				}
			}

			// 세션에 바인딩된 option이 없을경우, options에 paramOption을 대입하고, 세션에 set 한다.
			else if (paramOption != null && sessionOption == null) {
				options.put("search_option", paramOption);
				options.put("search_value", paramValue);

				session.setAttribute("search_option", paramOption);
				session.setAttribute("search_value", paramValue);
			}
		
		// param에 바인딩된 option이 없을경우, session의 option을 대입한다.
		else if (paramOption == null && sessionOption != null) {
			options.put("search_option", sessionOption);
			options.put("search_value", sessionValue);
		}
		
		// param과 session에 바인딩된 정보가 없을경우, viewName에 따른 전체 list를 보여준다.
		else {
			if (viewName.contains("extra")) {
				options.put("search_option", "productStates");
				options.put("search_value", "0");
			}
			
			else if (viewName.contains("general")) {
				options.put("search_option", "productStates");
				options.put("search_value", "all");
			}
		}
		
		options.put("user_rank", userInfo.getUser_rank());
		options.put("view_name", viewSplit[3]);
		Map<String, Map<String, Object>> fullList = adminProductService.productListToOption(options);
		
		return fullList;
	}

}
