// 2021.12.09 윤상현

package com.myspring.baroip.adminProduct.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.product.vo.ProductVO;

public interface AdminProductController {

	// 관리자 페이지 상품 등록 전체 매핑
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//  관리자 페이지 상품 등록
	public ModelAndView addProduct(@ModelAttribute("productVO") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	// rank 2 관리자의 임시상품관리 메뉴 컨트롤러
	public ModelAndView extraList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// rank 3 이상의 관리자의 쇼핑몰 전체상품관리 메뉴 컨트롤러
	public ModelAndView generalList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//  관리자 페이지 상품 수량 변경
	public String update_amount(@RequestParam Map<String, String> info) throws Exception;
	
	// 관리자 페이지 상품 삭제
	public ModelAndView delete_product(@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//  관리자 페이지 상품 수정 폼
	public ModelAndView update_product_form (@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 관리자 페이지 상품 수정
	public ModelAndView update_product(@ModelAttribute("productVO") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	// 상품 상태 수정 컨트롤러
	public ModelAndView update_state(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception;
}
