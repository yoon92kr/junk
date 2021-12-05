<!-- 2021.12.03 임석희 adminOrder -->

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
    		<div class="col-lg-2 text-center MyPage_padding">주문 관리</div>
    		<div class="col-lg-10 text-left MyPage_padding MyPage_title_02">반품 / 교환</div>
    		
    <div class="container">
	    <div class="MyPage_top-underline"></div>
    </div>
    </div>
    </div>
    
    
    <div class="row">
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	조회 유형
        	<select class="adminUser_01-select-box-lookup" onchange="selectLookup(this.value)">
        			<option value="ranking">회원 등급</option>
			        <option value="joinDate">가입일</option>
			        <option value="lastAccess">최종 접속일</option>
			        <option value="id">아이디</option>
			        <option value="birthYear">생년월일</option>
        		</select>
        </div>
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	조회 기준
        	<select id="adminUser_01-member-ranking-text" class="adminUser_01-select-box-lookup">
        			<option value="일반">일반 회원</option>
        			<option value="우수">우수 회원</option>
        			<option value="단골">단골 회원</option>
        			<option value="FLEX">FLEX 회원</option>
        		</select>

        		<input id="adminUser_01-member-date-text" class="adminUser_01-select-box-lookup" type="date"> 
        		<input id="adminUser_01-member-id-text" class="adminUser_01-select-box-lookup" type="text">
        </div>
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	<input class="adminUser_01-button-top" type="button" value="조회하기">
        </div>
    </div>
    
   <div class="row">
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">회원아이디</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">주문 내역</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">수량</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">결제 금액</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">주문 일자</h6>
	    </div>
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">배송 상태 수정</h6>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 text-center adminProduct_01-content-item">
        	<div>[회원 아이디]</div>
        	<input class="MyPage_03-submit-box-01" type="button" value="주문 상세 정보">
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[주문 상품 명]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[주문 수량]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[결제 금액]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[주문 일자]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        		<select name="yeer" class="MyPage_03_yeer text-center">
        			<option value="none">[배송 상태]</option>
        			<option value="상품준비중">[상품 준비 중]</option>
	        		<option value="상품배송중">[상품 배송 중]</option>
        		</select>
        	<input class="AdminOrder_boxsize" type="button" value="변경">
        </div>
    </div>

	<div class="MyPage_03_bottom_return_next">
	<div class="row">
        <div class="col-lg-2 text-center MyPage_03_left_text">◁이전</div>
        <div class="col-lg-2 text-center MyPage_03_right_text">다음▷</div>
        
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
    
    
    
