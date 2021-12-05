<!-- 2021.11.30 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">

    <div class="row">
        <div class="col-lg-8 offset-lg-2 text-center">
        	<h1 class="page_title">마이 페이지</h1>
        </div>
        <div class="col-lg-12 text-left myPage_03_01-content-body">
        	<h6 class="order_01-sub-title-page">
        		<span class="order_01-sub-title">[회원이름]님의 회원등급 안내</span>
        	</h6>
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">회원 등급</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">누적 주문 금액</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">[회원등급]까지 남은 금액</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">누적 적립 포인트</h6>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-3 text-center myPage_05-member-ranking-info">
        	[현재 회원등급]
        </div>
        <div class="col-lg-3 text-center myPage_05-member-ranking-info">
        	[회원 총 주문 금액]
        </div>
        <div class="col-lg-3 text-center myPage_05-member-ranking-info">
        	[다음 등급까지 미달 주문 금액]
        </div>
        <div class="col-lg-3 text-center myPage_05-member-ranking-info">
        	[회원 총 적립 포인트]
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-12 myPage_03_01-content-body">
        	<h6 class="myPage_05-memeber-info">
        		<span class="order_01-sub-title">바로입 회원 등급 산정 기준</span>
        	</h6>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-3">
        	<img class="myPage_05-member-image-basic" src="${contextPath}/resources/img/common/basic_member_icon.png" alt="일반 회원 등급이미지">
        </div>
        <div class="col-lg-3">
        	<img class="myPage_05-member-image myPage_05-member-image-under" src="${contextPath}/resources/img/common/under_member_icon.png" alt="우수 회원 등급이미지">
        </div>
        <div class="col-lg-3 text-center">
        	<img class="myPage_05-member-image" src="${contextPath}/resources/img/common/top_member_icon.png" alt="단골 회원 등급이미지">
        </div>
        <div class="col-lg-3 text-center">
        	<img class="myPage_05-member-image" src="${contextPath}/resources/img/common/flex_member_icon.png" alt="플렉스 회원 등급이미지">
        </div>
    </div>
    
    <div class="row">
    	<div class="col-lg-1 text-center border">
        	<p class="myPage_05-ranking-info-left myPage_05-ranking-info-all">등급 이름</p>
        </div>
        <div class="col-lg-2 text-center border">
        	<p class="myPage_05-ranking-info-all">일반 회원</p>
        </div>
        <div class="col-lg-3 text-center border">
        	<p class="myPage_05-ranking-info-all">우수 회원</p>
        </div>
        <div class="col-lg-3 text-center border">
        	<p class="myPage_05-ranking-info-all">단골 회원</p>
        </div>
        <div class="col-lg-3 text-center border">
        	<p class="myPage_05-ranking-info-all">FLEX 회원</p>
        </div>
    </div>
    
    <div class="row">
    	<div class="col-lg-1 text-center border">
        	<p class="myPage_05-ranking-info myPage_05-ranking-info-left">등급 조건</p>
        </div>
        <div class="col-lg-2 text-center border">
        	<p>누적 주문 금액</p>
        	0원~ 100,000원
        </div>
        <div class="col-lg-3 text-center border">
        	<p>누적 주문 금액</p>
        	100,000원~ 200,000원
        </div>
        <div class="col-lg-3 text-center border">
        	<p>누적 주문 금액</p>
        	200,000원~ 1,000,000원
        </div>
        <div class="col-lg-3 text-center border">
        	<p>누적 주문 금액</p>
        	1,000,000원 이상
        </div>
    </div>
    
    <div class="row">
    	<div class="col-lg-1 text-center border">
        	<p class="myPage_05-ranking-info-left myPage_05-ranking-info-all">혜택 내용</p>
        </div>
        <div class="col-lg-2 text-center border">
        	<p class="myPage_05-ranking-info-all">주문 금액의 2% 적립</p>
        </div>
        <div class="col-lg-3 text-center border">
        	<p class="myPage_05-ranking-info-all">주문 금액의 5% 적립</p>
        </div>
        <div class="col-lg-3 text-center border">
        	<p class="myPage_05-ranking-info-all">주문 금액의 10% 적립</p>
        </div>
        <div class="col-lg-3 text-center border">
        	<p class="myPage_05-ranking-info-all">주문 금액의 20% 적립</p>
        </div>
    </div>
    
</div>