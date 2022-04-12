<!-- 2021.11.25 임석희 mypage_01 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test='${not empty message }'>
<script>
	alert("${message}");
</script>
	<%
	session.removeAttribute("message");
	%>
</c:if>

<div class="container">
    <div class="MyPage_title">
    	<div class="row">
        	<div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">마이 페이지</h1></div>
    	</div>
    	
    	<div class="row">
    		<div class="col-lg-2 text-center">
    		<c:if test='${userInfo.user_membership == 1 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/basic_member_icon.png" alt="회원정보수정페이지 일반회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 2 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/under_member_icon.png" alt="회원정보수정페이지 우수회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 3 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/top_member_icon.png" alt="회원정보수정페이지 단골회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 4 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/flex_member_icon.png" alt="회원정보수정페이지 FLEX회원 이미지">
			</c:if>	
    		</div>
    		<div class="col-lg-10 text-left MyPage_padding">환영합니다 ${userInfo.user_name} 님!</div>
    		
    <div class="container">
	    <div class="MyPage_top-underline"></div>
    </div>
    </div>
</div>

<div class="container">
			<div class="MyPage_01_title">
				<div class="row">
        		<div class="col-lg-3 text-center">회원등급</div>
        		<div class="col-lg-3 text-center">주문내역</div>
        		<div class="col-lg-3 text-center">장바구니</div>
        		<div class="col-lg-3 text-center">포인트</div>
    		</div>
    		
    		<div class="MyPage_01_content MyPage_01_subtitle">
    		<div class="row">
    			<c:if test='${userInfo.user_membership == 1}'>
    				<a href="${contextPath}/myPage/membership.do" class="col-lg-3 text-center">일반 회원</a>
    			</c:if>
    			<c:if test='${userInfo.user_membership == 2}'>
    				<a href="${contextPath}/myPage/membership.do" class="col-lg-3 text-center">우수 회원</a>
    			</c:if>  
    			<c:if test='${userInfo.user_membership == 3}'>
    				<a href="${contextPath}/myPage/membership.do" class="col-lg-3 text-center">단골 회원</a>
    			</c:if>
    			<c:if test='${userInfo.user_membership == 4}'>
    				<a href="${contextPath}/myPage/membership.do" class="col-lg-3 text-center">FLEX 회원</a>
    			</c:if>     			  			
        		<a href="${contextPath}/myPage/myOrder.do" class="col-lg-3 text-center">${orderCount} 건</a>
        		<a href="${contextPath}/cart/cartList.do" class="col-lg-3 text-center">${cartCount} 건</a>
        		<a href="${contextPath}/myPage/membership.do" class="col-lg-3 text-center"><fmt:formatNumber value="${userInfo.user_point}" /> 원</a>
    		</div>
    		
    		
    		<div class="row">
    		<div class="col-lg"><hr></div>
			</div>
    	</div>                                   
    </div>                                       
</div>
</div>                                              