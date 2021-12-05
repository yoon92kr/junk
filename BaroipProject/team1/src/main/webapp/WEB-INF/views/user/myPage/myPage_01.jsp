<!-- 2021.11.25 임석희 mypage_01 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
    <div class="MyPage_title">
    	<div class="row">
        	<div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">마이 페이지</h1></div>
    	</div>
    	
    	<div class="row">
    		<div class="col-lg-2 text-center"><img src="${contextPath}/resources/img/common/basic_member_icon.png" alt="마이페이지 회원등급 이미지"></div>
    		<div class="col-lg-10 text-left MyPage_padding">환영합니다 [회원 이름] 님!</div>
    		
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
    			<a href="#" class="col-lg-3 text-center">[현재 회원등급]</a>
        		<a href="#" class="col-lg-3 text-center">[회원 주문내역 건수]</a>
        		<a href="#" class="col-lg-3 text-center">[회원 장바구니 건수]</a>
        		<a href="#" class="col-lg-3 text-center">[회원 잔여 포인트]</a>
    		</div>
    		
    		
    		<div class="row">
    		<div class="col-lg"><hr></div>
			</div>
    	</div>                                   
    </div>                                       
</div>
</div>                                              