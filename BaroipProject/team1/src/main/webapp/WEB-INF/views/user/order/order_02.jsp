<!-- 2021.11.29 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container-fluid">
    
    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center">
        	<h1 class="page_title">주문 / 결제 페이지</h1>
        </div>
        <div class="col-lg-2 offset-lg-1 text-right">
        	<h6 class="order_01-sub-title-page">
        		01. 주문 / 결제 >
        		<span class="order_01-sub-title">02. 완료</span>
        	</h6>
        </div>
	</div>
    
    <div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header">
	        <h4 class="order_01-content-hedaer-text">주문자 정보</h4>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
        	주문 번호
        </div>
        <div class="col-lg-3 text-center order_01-content-body">
        	결제 방법
        </div>
        <div class="col-lg-3 text-center order_01-content-body">
        	결제 금액
        </div>
        <div class="col-lg-2 text-center order_01-content-body">
        	적립 예상 포인트
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-item">
        	[상품 주문 번호]
        </div>
        <div class="col-lg-3 text-center order_01-content-item">
        	[상품 결제 수단]
        </div>
        <div class="col-lg-3 text-center order_01-content-item">
        	[최종 결제 금액]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[적립 예상 포인트]
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-4 offset-lg-4">
        <!-- 메인 페이지 하단 버튼 -->
        	<div class="login_03-bottom-btn">
	        	<a class="order_02-main-page-btn login_05-btn" href="${contextPath}/main.do">
					<img class="bottom_btn_size" src="${contextPath}/resources/img/common/main_page_btn.png" alt="메인 페이지 이동 버튼 이미지">
			     </a>
        	</div>
        </div>
    </div>
    
</div>
