<!-- 2021.11.30 임석희 myPage_04 -->

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
    	<div class="col-lg-2 text-center"><img src="${contextPath}/resources/img/common/basic_member_icon.png" alt="회원정보수정페이지 회원등급 이미지"></div>
    		<div class="col-lg-10 text-left MyPage_padding">포인트 내역</div>
    		
    <div class="container">
	    <div class="MyPage_top-underline"></div>
    </div>
    </div>
    </div>
</div>

<div class="container">
	<div class="MyPage_03_top">
    <div class="row">
        <div class="col-lg-2 text-center">주문 기간</div>
    <from>
        <select name="yeer" class="MyPage_03_yeer">
        	<option value="none">[조회 년도]</option>
        	<option value="2021">2021</option>
        	<option value="2020">2020</option>
        	<option value="2019">2019</option>
        	<option value="2018">2018</option>
        	<option value="2017">2017</option>
        </select>
	</from>
        <div class="col-lg-1">년</div>
    <from>
        <select name="month" class="MyPage_03_month">
        	<option value="none">[조회 월]</option>
        	<option value="january">1</option>
        	<option value="february">2</option>
        	<option value="march">3</option>
        	<option value="april">4</option>
        	<option value="may">5</option>
        	<option value="june">6</option>
        	<option value="july">7</option>
        	<option value="august">8</option>
        	<option value="september">9</option>
        	<option value="october">10</option>
        	<option value="november">11</option>
        	<option value="december">12</option>
        </select>
	</from>
        <div class="col-lg-1">월 ~</div>
	<from>
        <select name="yeer" class="MyPage_03_yeer">
        	<option value="none">[조회 년도]</option>
        	<option value="2021">2021</option>
        	<option value="2020">2020</option>
        	<option value="2019">2019</option>
        	<option value="2018">2018</option>
        	<option value="2017">2017</option>
        </select>
	</from>
		<div class="col-lg-1">년</div>
	<from>
        <select name="month" class="MyPage_03_month">
        	<option value="none">[조회 월]</option>
        	<option value="january">1</option>
        	<option value="february">2</option>
        	<option value="march">3</option>
        	<option value="april">4</option>
        	<option value="may">5</option>
        	<option value="june">6</option>
        	<option value="july">7</option>
        	<option value="august">8</option>
        	<option value="september">9</option>
        	<option value="october">10</option>
        	<option value="november">11</option>
        	<option value="december">12</option>
        </select>
	</from>
        <div class="col-lg-1">월</div>
        <input class="col-lg-1 MyPage_03-submit-box" type="submit" value="조회하기">
    </div>
	</div>
	
	<div class="MyPage_03_center-box text-center">
    <div class="row">
        <div class="col-lg-2">주문 일자</div>
        <div class="col-lg-3">상품명</div>
        <div class="col-lg-2">사용 포인트</div>
        <div class="col-lg-3">적립 포인트</div>
        <div class="col-lg-2">현재 포인트</div>
    </div>
    </div>
	
	<div class="MyPage_03_center-box-01 text-center">
		<div class="row">
        	<div class="col-lg-2 text-center">[상품 주문 일자]</div>
        	<a href="product_02.do" class="col-lg-2 MyPage_03_text_position_02">[주문 상품 명]</a>
        	<div class="col-lg-2 MyPage_03_text_position_02">[주문시 사용 포인트]</div>
        	<div class="col-lg-2 MyPage_03_text_position_02">[주문후 적립 포인트]</div>
        	<div class="col-lg-2 MyPage_03_text_position_03">[회원 잔여 포인트]</div>
    	</div>
	</div>
        
    <div class="MyPage_03_center-box-01 text-center">
        <div class="row">
        	<div class="col-lg-2 text-center">[상품 주문 일자]</div>
        	<a href="product_02.do" class="col-lg-2 MyPage_03_text_position_02">[주문 상품 명]</a>
        	<div class="col-lg-2 MyPage_03_text_position_02">[주문시 사용 포인트]</div>
        	<div class="col-lg-2 MyPage_03_text_position_02">[주문후 적립 포인트]</div>
        	<div class="col-lg-2 MyPage_03_text_position_03">[회원 잔여 포인트]</div>
        </div>
    </div>
    <div class="MyPage_03_center-box-01 text-center">
    	<div class="row">
    		<div class="col-lg-2 text-center MyPage_04_info_center">[정보 표시 란]</div>
    	</div>
    </div>
    
    	<div class="MyPage_03_bottom_return_next">
			<div class="row">
		<div class="col-lg-2 text-center MyPage_03_left_text">◁이전</div>
		<div class="col-lg-2 text-center MyPage_03_right_text">다음▷</div>
    
    </div>
</div>