<!-- 2021.12.03 임석희 adminReview_01_01 -->

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
    		<div class="col-lg-2 text-center MyPage_padding">답변 작성</div>
    		
    <div class="container">
	    <div class="MyPage_top-underline"></div>
    </div>
    </div>
    </div>


	<div class="MyPage_02_01_top">
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	제 목
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="AdminReturn_02-text-box text-center" type="text" disabled placeholder="[후기 제목]">
        	</form>
        </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	상품 명
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="AdminReturn_02-text-box text-center" type="text" disabled placeholder="[주문 상품 명]">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	상품 평점
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="AdminReturn_02-text-box text-center" type="text" disabled placeholder="[상품 평점]">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left AdminReturn_02-height-04">
        	내 용
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right AdminReturn_02-height-04">
        	<form>
        		<textarea class="AdminReturn_02-height-06 AdminReturn_02-textarea text-center" disabled placeholder="[후기 내용]"></textarea>
        	</form>
        </div>
    </div>
    
    
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left AdminReturn_02-height-04">
        	답 변
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right AdminReturn_02-height-04">
        	<form>
        		<textarea class="AdminReturn_02-height-06 AdminReturn_02-textarea"></textarea>
        	</form>
        </div>
    </div>

	<div class="row">
    	<div class="col-lg"><hr>
    </div>
    
    <div class="container">
      <div class="row">
      	<a href="#" class="col-lg-2 text-center AdminReturn_02-bottom-button-2">답변 등록</a>
    	<a href="${contextPath}/adminReview_01.do" class="col-lg-2 text-center AdminReturn_02-bottom-button-3">목 록</a>
      </div>
    </div>
    </div>
</div>
