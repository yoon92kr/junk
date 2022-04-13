// 2021.12.08 ������

package com.mat.modernblanco.adminProduct.controller;

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

import com.mat.modernblanco.adminProduct.service.AdminProductService;
import com.mat.modernblanco.image.controller.ImageController;
import com.mat.modernblanco.product.service.ProductService;
import com.mat.modernblanco.product.vo.ProductVO;
import com.mat.modernblanco.user.vo.UserVO;

@Controller("adminProductController")
@RequestMapping(value = "/admin/product")
public class AdminProductControllerImpl implements AdminProductController {

	@Autowired
	private AdminProductService adminProductService;
	@Autowired
	private ImageController imageController;
	@Autowired
	private ProductService productService;

	// ��ǰ���� ������ ��ü mapping
	@Override
	@RequestMapping(value = "/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}

	// ��ǰ �ӽ� ���
	@Override
	@RequestMapping(value = "/addProduct.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addProduct(@ModelAttribute("productVO") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String lastViewName = "/admin/product/extra_list";
		// String lastViewName = (String)multipartRequest.getParameter("last_view_name");
		String product_id = adminProductService.addProduct(productVO);
		String message = "[" + product_id + "]�� �ӽõ���� �Ϸ�Ǿ����ϴ�.";
		HttpSession session = multipartRequest.getSession();
		session.setAttribute("message", message);

		mav.setViewName("redirect:"+lastViewName+".do");
		System.out.println("baroip : " + message);
		imageController.ImageSetImageVO(multipartRequest, product_id);

		// ��ϵ� ��ǰ �̹��� ���� ����
		return mav;
	}

	// rank 2 �������� �ӽû�ǰ���� �޴� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/extra_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView extraList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		// get ��û�� �������, ������ session�� ����
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
	
	// rank 3 �̻��� �������� ���θ� ��ü��ǰ���� �޴� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/general_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView generalList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		// get ��û�� �������, ������ session�� ����
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

	// ��ǰ ���� ���� ��Ʈ�ѷ�
	@Override
	@ResponseBody
	@RequestMapping(value = "/update_amount.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public String update_amount(@RequestParam Map<String, String> info) throws Exception {

		adminProductService.updateAmount(info);
		String title = info.get("product_title");
		String amount = info.get("product_amount");
		String message = "[" + title + "]�� ��� ������ [" + amount + "]���� ���������� ����Ǿ����ϴ�.";

		System.out.printf("baorip : [%s]�� ��� ������ [%s]�� ����Ǿ����ϴ�.%n", title, amount);

		return message;
	}

	@Override
	@RequestMapping(value = "/delete_product.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView delete_product(@RequestParam("product_id") String product_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		adminProductService.deleteProduct(product_id);

		System.out.printf("baroip : [%s]��ǰ�� ���������� �����Ǿ����ϴ�.%n", product_id);
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
		String message = "������ " + productVO.getUser_id() + " ���� [" + productVO.getProduct_main_title() + "]�� ������ �Ϸ�Ǿ����ϴ�.";

		HttpSession session = multipartRequest.getSession();
		session.setAttribute("message", message);
		imageController.updateImage(multipartRequest, productVO.getProduct_id());
		mav.setViewName("redirect:"+lastViewName+".do");
		System.out.println("baroip : " + message);

		return mav;
	}
	
	// ��ǰ ���� ���� ��Ʈ�ѷ�
	@Override
	@RequestMapping(value = "/update_state.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public ModelAndView update_state(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		String lastViewName = "/admin/product/extra_list";
		// String lastViewName = (String)request.getAttribute("lastViewName");
		adminProductService.updateState(info);
		mav.setViewName("redirect:"+lastViewName+".do");
		System.out.printf("baroip : [%s] ��ǰ�� ���°� ���������� ����Ǿ����ϴ�.%n", info.get("product_title"));
		return mav;
	}

	// ��ǰ ��ȸ ���� ����, ���ǿ� �ִ� ��ǰ������ Ȯ�� �� ���񽺷� ó���ϴ� �޼ҵ�
	public Map<String, Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		// Map options���� ��ȸ�ϰ��� �ϴ� �������� option, ���ǿ� �ش��ϴ� value �� �ݵ�� ���ԵǾ���Ѵ�.
		// search_option(�˻� ����) = value [productCreDate / productTitle / productStates / productAmount]
		// search_value(�˻� ��) = value [yyyy-mm-dd,yyyy-mm-dd / product_main_title / 0 or 1 or all) / int]
		Map<String, String> options = new HashMap<String, String>();
		
		String paramOption = info.get("search_option");
		String paramValue = info.get("search_value");
		
		String sessionOption = (String) session.getAttribute("search_option");
		String sessionValue = (String) session.getAttribute("search_value");
		
		String viewName = (String) request.getAttribute("viewName");
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		String[] viewSplit = viewName.split("/");
		
		// param, session ��� option�� ���ε� �Ǿ��ִ� ���
		if (paramOption != null && sessionOption != null) {

				// �� �ɼ��� ��ġ�� ���, options�� ���� session�� ���� �����Ѵ�.
				if (paramOption.equals(sessionOption) && paramValue.equals(sessionValue)) {
					options.put("search_option", sessionOption);
					options.put("search_value", sessionValue);
				}

				// �� �ɼ��� ��ġ���� ���� ���, options�� paramOption�� �����ϰ�, ���� ������ Override �Ѵ�.
				else {
					options.put("search_option", paramOption);
					options.put("search_value", paramValue);

					session.setAttribute("search_option", paramOption);
					session.setAttribute("search_value", paramValue);
				}
			}

			// ���ǿ� ���ε��� option�� �������, options�� paramOption�� �����ϰ�, ���ǿ� set �Ѵ�.
			else if (paramOption != null && sessionOption == null) {
				options.put("search_option", paramOption);
				options.put("search_value", paramValue);

				session.setAttribute("search_option", paramOption);
				session.setAttribute("search_value", paramValue);
			}
		
		// param�� ���ε��� option�� �������, session�� option�� �����Ѵ�.
		else if (paramOption == null && sessionOption != null) {
			options.put("search_option", sessionOption);
			options.put("search_value", sessionValue);
		}
		
		// param�� session�� ���ε��� ������ �������, viewName�� ���� ��ü list�� �����ش�.
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
