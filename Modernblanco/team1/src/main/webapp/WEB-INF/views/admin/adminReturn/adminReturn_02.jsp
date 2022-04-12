<!-- 2021.12.02 임석희 adminReturn_02 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
<div class="MyPage_title">
    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">관리자 페이지</h1></div>
    </div>
		
    	<div class="row">
    		<div class="col-lg-12 text-left MyPage_padding">반품 / 교환 신청서</div>
    		
    <div class="container">
	    <div class="MyPage_top-underline"></div>
    </div>
    </div>
    </div>
</div>
	

	
<div class="container">
	<div class="MyPage_02_01_top">
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	제 목
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<input class="AdminReturn_02-text-box text-center" type="text" disabled value="${returnInfo.notice_title }">
        </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	주문 번호
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<input class="AdminReturn_02-text-box text-center" type="text" disabled value="${returnInfo.order_id }">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	문의 유형
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<input class="AdminReturn_02-text-box text-center" type="text" disabled value="${returnInfo.notice_type }">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left AdminReturn_02-height">
        	내 용
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right AdminReturn_02-height">
        		<textarea class="AdminReturn_02-height-01 AdminReturn_02-textarea"disabled >${returnInfo.notice_body }</textarea>
        </div>
    </div>
    
    
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left_update return_detail_height">
        	첨부 이미지
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right_update return_detail_height text-center">
        		<img class="cart_image_clip_return" 
        		src="data:image/jpeg;base64,${returnInfo.image_file}" alt="주문페이지 상품 이미지">
        </div>
    </div>

	<div class="row">
    	<div class="col-lg"><hr>
    </div>
    
    <div class="container">
    <div class="MyPage_02_01_button">
      <div class="row">
    	<a href="${contextPath}/admin/order/return_list.do" class="col-lg-2 text-center AdminReturn_02-bottom-button">목 록</a>
      </div>
    </div>
    </div>
    </div>
</div>
