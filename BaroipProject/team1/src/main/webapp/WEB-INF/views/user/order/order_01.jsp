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
        		<span class="order_01-sub-title">01. 주문 / 결제</span> > 02. 완료
        	</h6>
        </div>
    </div>

	<div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header">
	        <h4 class="order_01-content-hedaer-text">주문 리스트</h4>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
        	상품 정보
        </div>
        <div class="col-lg-2 text-center order_01-content-body">
        	수량
        </div>
        <div class="col-lg-2 text-center order_01-content-body">
        	가격
        </div>
        <div class="col-lg-2  text-center order_01-content-body">
        	할인
        </div>
        <div class="col-lg-2 text-center order_01-content-body">
        	주문 금액
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 offset-lg-1 order_01-content-item-img">
        	<a href="${contextPath}/product_02.do">
        		<img class="cart_image_clip" 
        		src="${contextPath}/resources/img/common/img-box.jpg" alt="주문페이지 상품 이미지">
        	</a>
        	<a class="order_01-item-name" href="${contextPath}/product_02.do">[상품 이름]</a>
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[상품 수량]개
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[상품 금액]원
        </div>
        <div class="col-lg-2  text-center order_01-content-item">
        	[할인 금액]원
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[최종 금액]원
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 offset-lg-1 order_01-content-item-img">
        	<a href="${contextPath}/product_02.do">
        		<img class="cart_image_clip" 
        		src="${contextPath}/resources/img/common/img-box.jpg" alt="주문페이지 상품 이미지">
        	</a>
        	<a class="order_01-item-name" href="${contextPath}/product_02.do">[상품 이름]</a>
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[상품 수량]개
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[상품 금액]원
        </div>
        <div class="col-lg-2  text-center order_01-content-item">
        	[할인 금액]원
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[최종 금액]원
        </div>
    </div>
	
	<div class="row">
        <div class="col-lg-3 offset-lg-8 text-right">
        	<div class="order_01-content-item-price">
        		<span>최종 주문 금액</span>
        		<span class="order_01-content-price">배송비</span>
        		<span class="order_01-content-price">[최종 금액 합계]원</span>
        	</div>
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header">
	        <h4 class="order_01-content-hedaer-text">주문자 정보</h4>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-3 offset-lg-1 text-center order_01-content-body">
        	아이디
        </div>
        <div class="col-lg-4 text-center order_01-content-body">
        	이름
        </div>
        <div class="col-lg-3 text-center order_01-content-body">
        	연락처
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-3 offset-lg-1 text-center order_01-content-item">
        	[회원 아이디]
        </div>
        <div class="col-lg-4 text-center order_01-content-item">
        	[회원 이름]
        </div>
        <div class="col-lg-3 text-center order_01-content-item">
        	[회원 연락처]
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-03">
	        <h4 class="order_01-content-hedaer-text">배송 정보</h4>
	    </div>
	</div>
	
	<div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-body-top-line">
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
        	이 름
        </div>
        <div class="col-lg-9 join_02-main-right">
        	<form class="order_01-user-name">
        		<input class="join_02-text-box" type="text">
        		<span class="order_01-check-text">주문자 정보와 동일</span>
        		<input class="order_01-check" type="checkbox" name="join_check_01" value="true">
        		
        	</form>
        </div>
    </div>

	<div class="row">
        <div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
        	주 소
        </div>
        <div class="col-lg-9 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        		<input class="join_02-submit-box" type="submit" value="우편번호 검색">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
        	상세 주소
        </div>
        <div class="col-lg-9 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>

	<div class="row">
        <div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
        	핸드폰 번호
        </div>
        <div class="col-lg-9 join_02-main-right">
        	<form onsubmit="return false;">
        		<select class="join_02-mobile">
        			<option value="010">010</option>
        			<option value="011">011</option>
        			<option value="016">016</option>
        			<option value="017">017</option>
        			<option value="019">019</option>
        			<option value="070">070</option>
        		</select> - 
        		<input class="join_02-mobile-02" type="number" oninput="join_02_mobile_number01(this, 4)"> - 
        		<input class="join_02-mobile-02" type="number" oninput="join_02_mobile_number01(this, 4)">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
        	주문 메세지
        </div>
        <div class="col-lg-9 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-04">
	        <h4 class="order_01-content-hedaer-text">결제 상세</h4>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
        	최종 주문 금액
        </div>
        <div class="col-lg-3 text-center order_01-content-body">
        	보유 포인트
        </div>
        <div class="col-lg-3 text-center order_01-content-body">
        	사용 포인트
        </div>
        <div class="col-lg-2  text-center order_01-content-body">
        	결제 금액
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-item">
        	[최종 금액 합계]
        </div>
        <div class="col-lg-3 text-center order_01-content-item">
        	[보유 포인트 : readOnly]
        </div>
        <div class="col-lg-3 text-center order_01-content-item-point">
        	<form>
        		<input class="order_01-point-box" type="text">
        		<input class="order_01-point-box" type="submit" value="전체 포인트 사용">
        	</form>
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[최종 결제 금액]
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-04">
	        <h4 class="order_01-content-hedaer-text">결제 방법</h4>
	    </div>
	</div>
	
	<div class="order_01-select-card-noBank-mobile">
	<div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
        	결제 수단
        </div>
        <div class="col-lg-8 text-center order_01-content-body">
        	<form>
        		<input id="order_01-selectPay-card" type="radio" name="payment" value="card" onClick="selectPay(this.id)" checked>
        		<label for="order_01-selectPay-card">신용 / 체크 카드</label>
				<input id="order_01-selectPay-noBank" class="order_01-radio-btn" type="radio" name="payment" value="noBank" onClick="selectPay(this.id)">
				<label for="order_01-selectPay-noBank">무통장 입금</label>
				<input id="order_01-selectPay-mobile" class="order_01-radio-btn" type="radio" name="payment" value="mobile" onClick="selectPay(this.id)">
				<label for="order_01-selectPay-mobile">휴대폰 결제</label>
        	</form>
        </div>
    </div>
    
    <!-- 결제 방식에 따른 결제 방법 상세 -->
    <div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-item">
        	세부 내용
        </div>
        <div class="col-lg-8 text-center order_01-content-item">
        	<div id="order_01-selectPay-card-text">

        		<span class="order_01-select-card">카드 선택</span>
        		<select class="order_01-select-choice-card order_01-select-card">
        			<option value="선택해주세요">선택해주세요</option>
        			<option value="신한카드">신한카드</option>
        			<option value="하나카드">하나카드</option>
        			<option value="삼성카드">삼성카드</option>
        			<option value="농협카드">농협카드</option>
        			<option value="국민카드">국민카드</option>
        			<option value="현대카드">현대카드</option>
        		</select>
        		
        		<span class="order_01-select-choice-card-text order_01-select-card">할부 개월 수</span>
        		<select class="order_01-select-choice-card order_01-select-card">
        			<option value="일시불">일시불</option>
        			<option value="2개월">2개월</option>
        			<option value="3개월">3개월</option>
        			<option value="4개월">4개월</option>
        			<option value="5개월">5개월</option>
        			<option value="6개월">6개월</option>
        		</select>

        	</div>
        	
        	<div id="order_01-selectPay-noBank-text">

        			무통장 입금자 명 <input class="order_01-noBank-text-box" type="text">

        	</div>
        	
        	<div id="order_01-selectPay-mobile-text">

        		휴대폰 결제 
        		<select class="join_02-mobile">
        			<option value="010">010</option>
        			<option value="011">011</option>
        			<option value="016">016</option>
        			<option value="017">017</option>
        			<option value="019">019</option>
        			<option value="070">070</option>
        		</select> - 
        		<input class="join_02-mobile-02" type="number" oninput="join_02_mobile_number01(this, 4)"> - 
        		<input class="join_02-mobile-02" type="number" oninput="join_02_mobile_number01(this, 4)">

        	</div>
        	
        </div>
    </div>
	</div>
    
    <!-- 하단 버튼 -->
    <div class="row">
        <div class="col-lg-4 offset-lg-2 text-center order_01-bottom-btn">
        	<div class="join_01-btn">
	        	<a class="join_01-back" href="${contextPath}/cart/cartList.do">
					<img class="join_01-btn-img bottom_btn_size" src="${contextPath}/resources/img/common/return_page_btn.png" alt="이전 페이지 돌아가기 버튼 이미지">
			    </a>
		    </div>
        </div>
		<div class="col-lg-4 text-center order_01-bottom-btn">
        	<div class="join_01-btn">
	        	<a class="order_01-select-btn" href="order_02.do">
					<img class="join_01-btn-img bottom_btn_size" src="${contextPath}/resources/img/common/price_btn.png" alt="결제 하기 버튼 이미지">
			    </a>
		    </div>
        </div>
    </div>
    
</div>

<script type="text/javascript">
function selectPay(selectId) {
	   let card = '#order_01-selectPay-card-text';
	   let noBank = '#order_01-selectPay-noBank-text';
	   let mobile = '#order_01-selectPay-mobile-text';

	   let targetPay =  '#'.concat(selectId, '-text');

	   if (targetPay == card) {
	      document.querySelector(card).style.display = 'inline';
	      document.querySelector(noBank).style.display = 'none';
	      document.querySelector(mobile).style.display = 'none';
	   }

	   else if (targetPay == noBank) {
	      document.querySelector(card).style.display = 'none';
	      document.querySelector(noBank).style.display = 'inline';
	      document.querySelector(mobile).style.display = 'none';
	   }

	   else if (targetPay == mobile) {
	      document.querySelector(card).style.display = 'none';
	      document.querySelector(noBank).style.display = 'none';
	      document.querySelector(mobile).style.display = 'inline';
	   }
	   
	}
	
function join_02_mobile_number01(el, maxlength) {
	if(el.value.length > maxlength) {
		el.value = el.value.substr(0, maxlength);
	}
}
</script>