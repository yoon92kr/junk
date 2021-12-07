<!-- 2021.12.02 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">

    <div class="row">
        <div class="col-lg-8 offset-lg-2 text-center">
        	<h1 class="page_title">관리자 페이지</h1>
        </div>
	</div>
	
	<div class="row">
        <div class="col-lg-12 text-left myPage_03_01-content-body">
        	<h6 class="order_01-sub-title-page">
        		<span class="order_01-sub-title">상품 관리</span>
        	</h6>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	조회 유형
        	<select class="adminUser_01-select-box-lookup" onchange="Productchange(this.value)">
        			<option value="productUpDate">상품 등록일</option>
			        <option value="productName">상품 명</option>
			</select>
        </div>
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	조회 기준
			<input id="adminProduct_01-productUpDate-text" type="date">
			<input id="adminProduct_01-productName-text" type="text">
        </div>
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	<input class="adminProduct_01-header-button" type="button" value="조회하기">
        	<input class="adminProduct_01-header-button adminProduct_01-button-top" type="button" value="상품 임시 등록" onclick="location.href='${contextPath}/adminProduct_02.do'">
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">상품 등록일</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">상품 이미지</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">상품 명</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">상품 재고</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">상태 변경</h6>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 text-center order_01-content-item">
        	[상품 등록일]
        </div>
        <div class="col-lg-3 text-center order_01-content-item-img">
        	<a href="#">
        		<img class="cart_image_clip" 
        		src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 관리 페이지 상품 이미지">
        	</a>
        </div>
        <div class="col-lg-3 text-center order_01-content-item">
        	[상품 명]
        </div>
        <div class="col-lg-2 order_01-content-item">
				<form name="itemCountBox" id="adminProduct_01-itemCountBox-detail">
					<div class="adminProduct_01-value-button adminProduct_01-decrease" id="adminProduct_01_cart_decrease"	onclick="decreaseValue(this.id)" value="Decrease Value">-</div>
					<input type="number" class="adminProdut_01-cart_item_count" id="adminProdut_01_cart_item_count" value="0"	onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" />
					<div class="adminProduct_01-value-button adminProduct_01-increase" id="adminProduct_01_cart_increase"	onclick="increaseValue(this.id)" value="Increase Value">+</div>
<!-- 					<input class="admin_01-itemCountBox-btn" type="submit" value="변경"> -->
				</form>
				<input class="admin_01-itemCountBox-btn" type="submit" value="변경">
        </div>
        <div class="col-lg-2 text-center adminProduct_01-content-item">
        	<input class="adminProduct_01-product adminProduct_01-product-top" type="button" value="상품 수정" onclick="location.href='${contextPath}/adminProduct_03.do'">
        	<input class="adminProduct_01-product" type="button" value="상품 삭제">
        </div>
    </div>
    
  
</div>

<script type="text/javascript">
function Productchange(selectValue) {
	let adminProduct_01_Date = '#adminProduct_01-productUpDate-text';
	let adminUser_01_name = '#adminProduct_01-productName-text';

	let adminProduct_01 = '#adminProduct_01-'.concat(selectValue, '-text');


	if (adminProduct_01 == adminProduct_01_Date) {
	   document.querySelector(adminProduct_01_Date).style.display = 'inline';
	   document.querySelector(adminUser_01_name).style.display = 'none';
	}
	else if (adminProduct_01 == adminUser_01_name) {
	   document.querySelector(adminUser_01_name).style.display = 'inline';
	   document.querySelector(adminProduct_01_Date).style.display = 'none';
	}
 }
 
/*---------- 수량 증감 input 박스 설정 ----------*/

/* 수량 증감 */
function increaseValue(tagId) {
	let countValue = parseInt(
			document.getElementById('adminProdut_01_cart_item_count').value, 10);

	countValue = isNaN(countValue) ? 0 : countValue;
	countValue++;
	document.getElementById('adminProdut_01_cart_item_count').value = countValue;
};

function decreaseValue(tagId) {

	let countValue = parseInt(
			document.getElementById('adminProdut_01_cart_item_count').value, 10);
	if (countValue <= 0) {
		alert("수량은 0보다 작을 수 없습니다.");
	}
	
	countValue = isNaN(countValue) ? 0 : countValue;
	countValue < 2 ? countValue = 2 : '';
	countValue--;
	document.getElementById('adminProdut_01_cart_item_count').value = countValue;
};
/* 수량입력 후 엔터 입력시 이벤트 */

function searchEvt(targetValue, targetId) {

	if (targetValue == "" || targetValue < 0) {
		alert('수량은 0보다 작을 수 없습니다.');
		document.getElementById(targetId).value = 0;
	}

}

/* 수량입력 후 다른 영역 클릭 시 이벤트 */
window.onload = eventPlus();

function eventPlus() {

	document.itemCountBox.adminProdut_01_cart_item_count.onblur = eventGo;

}
function eventGo() {
	if (this.value == "" || this.value < 0) {
		alert('수량은 0보다 작을 수 없습니다.');
		document.getElementById(this.id).value = 0;
	}

}
</script>