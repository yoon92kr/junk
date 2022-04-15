// 2022.01.08 ������

package com.mat.modernblanco.product.controller;

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

import com.mat.modernblanco.product.service.ProductService;
import com.mat.modernblanco.product.vo.ProductVO;

@Controller("productController")
@RequestMapping(value = "/product")
public class ProductControllerImpl implements ProductController {
	
	@Autowired
	private ProductService productService;

	// ��ǰ���� ������ ��ü mapping
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
		
		
		// get ��û�� �������, ������ session�� ����
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
		// ���õ� ��ǰ�� ī�װ��� �ĺ��Ͽ� ��� style ������ ���� ����
		String pageInfo = "";
		if (product.getProduct_main_category().equals("��깰")) {
			pageInfo = "set_farm";
		}
		else if (product.getProduct_main_category().equals("���깰")) {
			pageInfo = "set_marine";
		} 
		else if (product.getProduct_main_category().equals("��깰")) {
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
			
			// ������ �ô� ��ǰ�� lastProduct�� ���ԵǾ����� ���� ��쿡�� ó��
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
		
		// ���� ���� ������� �Ҵ�.
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

	// ��ǰ ��ȸ ���� ����, ���ǿ� �ִ� ��ǰ������ Ȯ�� �� ���񽺷� ó���ϴ� �޼ҵ�
		public Map<String, Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			
			// Map options���� ��ȸ�ϰ��� �ϴ� ���Ǹ� main_option / sub_option / title_option / order_option �� ������, main_option�� �ݵ�� ���ԵǾ���Ѵ�.
			// * main_option(main_category ����) = value [farm / marine / meat]
			// sub_option(sub_category ����) = value [ä��/�/����, ������/������/������, �������/�Ұ��/��Ÿ]
			// title_option(main_category ����) = value [farm / marine / meat]
			// order_option(main_category ����) = value [farm / marine / meat]
			
			Map<String, String> options = new HashMap<String, String>();
			String paramSub = info.get("sub_option");
			String paramTitle = info.get("title_option");
			String paramOrder = info.get("order_option");
			
			String sessionSub = (String) session.getAttribute("sub_option");
			String sessionTitle = (String) session.getAttribute("title_option");
			String sessionOrder = (String) session.getAttribute("order_option");

			// paramSub �˻������� session Ȥ�� param�� ������ ��� ó��
			if (paramSub != null || sessionSub != null) {
				
				// param�� ������ �������
				if(paramSub != null && sessionSub == null) {
					options.put("sub_option", paramSub);
					session.setAttribute("sub_option", paramSub);
				}
				// session�� ������ �������
				else if(paramSub == null && sessionSub != null) {
					options.put("sub_option", sessionSub);
				}
				// param�� session ��ο� ������ �������
				else {
					// param�� session�� ������ ������ ���, ���� session�� ���� ����
					if(paramSub.equals(sessionSub)) {
						options.put("sub_option", sessionSub);
					}
					// param�� session�� ������ �ٸ� ���, session�� set��, param ���� ����
					else {
						options.put("sub_option", paramSub);
						session.setAttribute("sub_option", paramSub);
					}
				} 
			
			}
			// paramSub �˻������� session Ȥ�� param�� ������ ��� ó��			
			if (paramTitle != null || sessionTitle != null) {
				
				// param�� ������ �������	
				if(paramTitle != null && sessionTitle == null) {
					options.put("title_option", paramTitle);
					session.setAttribute("title_option", paramTitle);
				}
				// session�� ������ �������
				else if(paramTitle == null && sessionTitle != null) {
					options.put("title_option", sessionTitle);
				}
				// param�� session ��ο� ������ �������
				else {
					// param�� session�� ������ ������ ���, ���� session�� ���� ����
					if(paramTitle.equals(sessionTitle)) {
						options.put("title_option", sessionTitle);
					}
					// param�� session�� ������ �ٸ� ���, session�� set��, param ���� ����
					else {
						options.put("title_option", paramTitle);
						session.setAttribute("title_option", paramTitle);
					}
				} 
			
			} 
			// paramSub �˻������� session Ȥ�� param�� ������ ��� ó��			
			if (paramOrder != null || sessionOrder != null) {
				
				// param�� ������ �������
				if(paramOrder != null && sessionOrder == null) {
					options.put("order_option", paramOrder);
					session.setAttribute("order_option", paramOrder);
				}
				// session�� ������ �������
				else if(paramOrder == null && sessionOrder != null) {
					options.put("order_option", sessionOrder);
				}
				// param�� session ��ο� ������ �������
				else {
					// param�� session�� ������ ������ ���, ���� session�� ���� ����
					if(paramOrder.equals(sessionOrder)) {
						options.put("order_option", sessionOrder);
					}
					// param�� session�� ������ �ٸ� ���, session�� set��, param ���� ����
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
	
//	���,��ȯ,��ǰ �ȳ�
		@RequestMapping(value = "/productInfoPage.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView productInfoPage(@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");

			mav.addObject("product_id", product_id);
			mav.setViewName(viewName);
			
			return mav;
		}
		
}
