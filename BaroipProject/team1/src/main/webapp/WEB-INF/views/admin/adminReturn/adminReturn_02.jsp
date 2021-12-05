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
        	<form>
        		<input class="AdminReturn_02-text-box text-center" type="text" placeholder="[반품 / 교환 신청 제목]">
        	</form>
        </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	주문 번호
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="AdminReturn_02-text-box text-center" type="text" disabled placeholder="[상품 주문 번호]">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	문의 유형
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="AdminReturn_02-text-box text-center" type="text" placeholder="[문의 유형]">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left AdminReturn_02-height">
        	내 용
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right AdminReturn_02-height">
        	<form>
        		<textarea class="AdminReturn_02-height-01 AdminReturn_02-textarea"></textarea>
        	</form>
        </div>
    </div>
    
    
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left AdminReturn_02-height-02">
        	첨부 이미지
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right AdminReturn_02-height-02">
        	<form>
        		<img class="cart_image_clip" 
        		src="${contextPath}/resources/img/common/img-box.jpg" alt="주문페이지 상품 이미지">
        		<img class="cart_image_clip" 
        		src="${contextPath}/resources/img/common/img-box.jpg" alt="주문페이지 상품 이미지">
        	</form>
        </div>
    </div>

	<div class="row">
    	<div class="col-lg"><hr>
    </div>
    
    <div class="container">
    <div class="MyPage_02_01_button">
      <div class="row">
    	<a href="${contextPath}/adminReturn_01.do" class="col-lg-2 text-center AdminReturn_02-bottom-button">목 록</a>
      </div>
    </div>
    </div>
    </div>
</div>
