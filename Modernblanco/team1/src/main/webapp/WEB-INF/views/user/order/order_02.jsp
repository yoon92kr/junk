<!-- 2021.11.29 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${order_return}" />

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
        	${itemList.test_order_ID}
        </div>
        <c:if test="${not empty itemList.test_order_payment}">
	        <div class="col-lg-3 text-center order_01-content-item">
	        	${itemList.test_order_payment} ( ${itemList.test_order_bank} )
	        </div>
        </c:if>
        <c:if test="${empty itemList.test_order_payment}">
	        <div class="col-lg-3 text-center order_01-content-item">
	        	포인트 결제
	        </div>
        </c:if>        
        <div class="col-lg-3 text-center order_01-content-item">
        	<fmt:formatNumber value="${itemList.test_order_amount}" /> 원
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        <c:if test="${not empty userInfo}">
	        
	         	<c:if test="${userInfo.user_membership == 1 and itemList.test_order_amount > 0}">
	         		<fmt:formatNumber value="${itemList.test_order_amount*0.01}" /> 원
	         	</c:if>
	         	<c:if test="${userInfo.user_membership == 2 and itemList.test_order_amount > 0}">
	         		<fmt:formatNumber value="${itemList.test_order_amount*0.03}" /> 원
	         	</c:if>	   
	         	<c:if test="${userInfo.user_membership == 3 and itemList.test_order_amount > 0}">
	         		<fmt:formatNumber value="${itemList.test_order_amount*0.05}" /> 원
	         	</c:if>	   
	         	<c:if test="${userInfo.user_membership == 4 and itemList.test_order_amount > 0}">
	         		<fmt:formatNumber value="${itemList.test_order_amount*0.1}" /> 원
	         	</c:if>	       
	         	<c:if test="${itemList.test_order_amount == 0}">
	         		0 원
	         	</c:if>	         	  	      	     	
	       
        </c:if>
        <c:if test="${empty userInfo}">
	        
	        	비회원 결제
	        
        </c:if>        
        </div>
    </div>
    <c:if test="${empty userInfo}">   
         <div class="row">
            <div class="col-lg-12 text-center">
            <br><br>
               <span class="cart_notUser">비회원 주문 시 배송조회 및 주문상태 변경을 위해 반드시 주문 번호를 메모해주세요.</span>
            </div>
         </div>
    </c:if>
    <br><br>
    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center">
        <!-- 메인 페이지 하단 버튼 -->
        	<div class="login_03-bottom-btn">
				<a href="${contextPath}/main.do">
					<input type="button" class="user_btn_Bgreen" value="메인페이지로 이동">	
				</a>
        	</div>
        </div>
    </div>
    
</div>
