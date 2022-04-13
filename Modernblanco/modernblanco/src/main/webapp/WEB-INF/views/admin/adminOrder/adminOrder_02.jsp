<!-- 2022.02.06 윤상현 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="5" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${orderList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${orderList}" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">

	<div class="row">
		<div class="col-lg-8 offset-lg-2 text-center">
			<h1 class="page_title">마이 페이지</h1>
		</div>
		<div class="col-lg-12 text-left myPage_03_01-content-body">
			<h6 class="order_01-sub-title-page">
				<span class="order_01-sub-title">주문 상세 정보</span>
			</h6>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 order_01-content-header">
			<h4 class="order_01-content-hedaer-text">주문 리스트</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-5 order_01-content-body">
			<div class="myPage_03_01-content-body-left">상품 정보</div>
		</div>
		<div class="col-lg-1 text-center order_01-content-body">수량</div>
		<div class="col-lg-2 text-center order_01-content-body">배송 상태</div>
		<div class="col-lg-2  text-center order_01-content-body">주문 번호</div>
		<div class="col-lg-2 text-center order_01-content-body">주문 금액</div>
	</div>

	<c:forEach var="i" begin="0" end="${itemSize -1}">

			<div class="row">
				<div class="col-lg-5 order_01-content-item-img">
					<a href="${contextPath}/product/productDetail.do?product_id=${itemList[i].product_id}"> <img
						class="cart_image_clip"
						src="data:image/jpeg;base64,${itemList[i].image_file}"
						alt="상품 이미지">
					</a> <a class="order_01-item-name" href="${contextPath}/product/productDetail.do?product_id=${itemList[key].product_id}">${itemList[i].product_main_title}</a>
				</div>
				<div class="col-lg-1 text-center order_01-content-item"><fmt:formatNumber value="${itemList[i].order_amount}" /> 개</div>
				<div class="col-lg-2 text-center order_01-content-item">
					<c:if test='${itemList[i].order_state == 1}'>
		        		상품 배송중
		        	</c:if>    
		        	<c:if test='${itemList[i].order_state == 2}'>
		        		배송 완료
		        	</c:if> 
		        	<c:if test='${itemList[i].order_state == -1}'>
		        		주문 취소
		        	</c:if>       
		        	<c:if test='${itemList[i].order_state == -2}'>
		        		반품 / 교환 요청
		        	</c:if>   	
		        	<c:if test='${itemList[i].order_state == -3}'>
		        		반품 / 교환 완료
		        	</c:if>
				</div>
				<div class="col-lg-2  text-center order_01-content-item">${itemList[i].order_id}</div>
				<div class="col-lg-2 text-center order_01-content-item"><fmt:formatNumber value="${(itemList[i].product_price - itemList[i].product_discount) * itemList[i].order_amount}" /> 원</div>
			</div>
			<c:set var="total_price" value="${total_price + (itemList[i].product_price - itemList[i].product_discount) * itemList[i].order_amount }" />
			<c:if test='${total_price >= 30000 }'>
				<c:set var="final_price" value="${total_price}" />
			</c:if>
			<c:if test='${total_price < 30000 }'>
				<c:set var="final_price" value="${total_price + 5000}" />
			</c:if>
	</c:forEach>

	<div class="row">
		<div class="col-lg-12 text-right">
			<div class="myPage_03_01-content-item-price">

				<c:if test='${total_price >= 30000 }'>
					<span>최종 주문 금액 : </span> <span class="myPage_03_01-content-price"><fmt:formatNumber value="${final_price}" />원</span>
					<span class="order_01-content-price order_red_font_small">(배송비 무료)</span>
				</c:if>
				<c:if test='${total_price < 30000 }'>
					<span>최종 주문 금액 : </span> <span class="myPage_03_01-content-price"><fmt:formatNumber value="${final_price}" />원</span>	
					<span class="order_01-content-price order_red_font_small">(배송비 5,000원 포함)</span>
				</c:if>
				
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 order_01-content-header order_01-content-04">
			<h4 class="order_01-content-hedaer-text">결제 상세</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-3 text-center order_01-content-body">최종 주문 금액</div>
		<div class="col-lg-3 text-center order_01-content-body">사용 포인트</div>
		<div class="col-lg-3 text-center order_01-content-body">최종 결제 금액</div>
		<div class="col-lg-3  text-center order_01-content-body">적립 예상 포인트</div>
	</div>

	<div class="row">
			<div class="col-lg-3 text-center order_01-content-item"><fmt:formatNumber value="${final_price}" />원</div>
			<div class="col-lg-3 text-center order_01-content-item"><fmt:formatNumber value="${itemList[0].order_payment_point}" />원</div>
			<div class="col-lg-3 text-center order_01-content-item"><fmt:formatNumber value="${final_price-itemList[0].order_payment_point}" />원</div>
			<div class="col-lg-3 text-center order_01-content-item">
				<c:if test="${itemList[0].user_membership == 1 and final_price > 0}">
	         		<fmt:formatNumber value="${final_price*0.01}" /> 원
	         	</c:if>
	         	<c:if test="${itemList[0].user_membership == 2 and final_price > 0}">
	         		<fmt:formatNumber value="${final_price*0.03}" /> 원
	         	</c:if>	   
	         	<c:if test="${itemList[0].user_membership == 3 and final_price > 0}">
	         		<fmt:formatNumber value="${final_price*0.05}" /> 원
	         	</c:if>	   
	         	<c:if test="${itemList[0].user_membership == 4 and final_price > 0}">
	         		<fmt:formatNumber value="${final_price*0.1}" /> 원
	         	</c:if>	       
	         	<c:if test="${final_price == 0}">
	         		0 원
	         	</c:if>	
			</div>
	</div>

 
	<div class="row">
		<div class="col-lg-12 order_01-content-header order_01-content-04">
			<h4 class="order_01-content-hedaer-text">결제 방법</h4>
		</div>
	</div>

	<div class="order_01-select-card-noBank-mobile">
		<div class="row">
			<div class="col-lg-3 text-center order_01-content-body">결제 수단</div>
			<div class="col-lg-9 text-center order_01-content-body">
				<form>
					<input id="order_01-selectPay-card" type="radio" name="payment"
						value="card"onClick="selectPay(this.id)"  disabled>
					<label for="order_01-selectPay-card">신용 / 체크 카드</label> <input
						id="order_01-selectPay-noBank" class="order_01-radio-btn"
						type="radio" name="payment" value="noBank"
						onClick="selectPay(this.id)" disabled checked> <label
						for="order_01-selectPay-noBank">가상 계좌</label> <input
						id="order_01-selectPay-mobile" class="order_01-radio-btn"
						type="radio" name="payment" value="mobile"
						onClick="selectPay(this.id)" disabled> <label
						for="order_01-selectPay-mobile">휴대폰 결제</label>
				</form>
			</div>
		</div>

		<!-- 결제 방식에 따른 결제 방법 상세 -->
		<div class="row">
			<div class="col-lg-3 text-center order_01-content-item">세부 내용</div>
			<div class="col-lg-9 text-center order_01-content-item">
				<div id="order_01-selectPay-card-text">

					<span class="order_01-select-card">카드 선택</span> <select
						class="order_01-select-choice-card order_01-select-card" disabled>
						<option value="선택해주세요">선택해주세요</option>
						<option value="신한카드">신한카드</option>
						<option value="하나카드">하나카드</option>
						<option value="삼성카드">삼성카드</option>
						<option value="농협카드">농협카드</option>
						<option value="국민카드">국민카드</option>
						<option value="현대카드">현대카드</option>
					</select> <span
						class="order_01-select-choice-card-text order_01-select-card">할부
						개월 수</span> <select
						class="order_01-select-choice-card order_01-select-card" disabled>
						<option value="일시불">일시불</option>
						<option value="2개월">2개월</option>
						<option value="3개월">3개월</option>
						<option value="4개월">4개월</option>
						<option value="5개월">5개월</option>
						<option value="6개월">6개월</option>
					</select>

				</div>

				<div id="order_01-selectPay-noBank-text">

					무통장 입금자 명 <input class="order_01-noBank-text-box" type="text" value="${itemList[0].user_name}"
						disabled>

				</div>

				<div id="order_01-selectPay-mobile-text">

					휴대폰 결제 <input class="join_02-mobile admin_user_margin_left"
						disabled> - <input class="join_02-mobile-02" type="number"
						disabled> - <input class="join_02-mobile-02" type="number"
						disabled>

				</div>

			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 order_01-content-header myPage_03_01-user-info">
			<h4 class="order_01-content-hedaer-text">주문자 정보</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-4 text-center order_01-content-body">아이디</div>
		<div class="col-lg-4 text-center order_01-content-body">이름</div>
		<div class="col-lg-4 text-center order_01-content-body">연락처</div>
	</div>

	<div class="row">
		<div class="col-lg-4 text-center order_01-content-item">${itemList[0].user_id}
		</div>
		<div class="col-lg-4 text-center order_01-content-item">${itemList[0].user_name}
		</div>
		<div class="col-lg-4 text-center order_01-content-item">${itemList[0].user_mobile_1} - ${itemList[0].user_mobile_2} - ${itemList[0].user_mobile_3}
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 order_01-content-header order_01-content-03">
			<h4 class="order_01-content-hedaer-text">배송 정보</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 order_01-content-body-top-line"></div>
	</div>

	<div class="row">
		<div class="col-lg-2 text-center join_02-main-left">이 름</div>
		<div class="col-lg-10 join_02-main-right">
			<form class="order_01-user-name">
				<input class="join_02-text-box" type="text" value="${itemList[0].order_receiver_name}" disabled>
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-2 text-center join_02-main-left">주 소</div>
		<div class="col-lg-10 join_02-main-right">
			<form>
				<input class="join_02-text-box" type="text" value="${itemList[0].order_receiver_new_address}" disabled>
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-2 text-center join_02-main-left">상세 주소</div>
		<div class="col-lg-10 join_02-main-right">
			<form>
				<input class="join_02-text-box" type="text" value="${itemList[0].order_receiver_detail_address}"  disabled>
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-2 text-center join_02-main-left">핸드폰 번호</div>
		<div class="col-lg-10 join_02-main-right">
			<form>
				<input class="join_02-mobile admin_user_margin_left" value="${itemList[0].order_receiver_mobile_1}"  disabled>
				- <input class="join_02-mobile-02" type="number" value="${itemList[0].order_receiver_mobile_2}" disabled> -
				<input class="join_02-mobile-02" type="number" value="${itemList[0].order_receiver_mobile_3}"  disabled>
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-2 text-center join_02-main-left">주문 메세지</div>
		<div class="col-lg-10 join_02-main-right">
			<form>
				<input class="join_02-text-box" type="text" value="${itemList[0].order_message}"  disabled>
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-6 offset-lg-3">
			<!-- 로그인 페이지 하단 버튼 -->
			<div class="myPage_03_01-bottom-btn">
				<a class="myPage_03_01-myPage-btn login_05-btn MyPage_02_button_02" href="${contextPath}/admin/order/order_list.do"> 돌아가기	</a>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	function selectPay(selectId) {
		let card = '#order_01-selectPay-card-text';
		let noBank = '#order_01-selectPay-noBank-text';
		let mobile = '#order_01-selectPay-mobile-text';

		let targetPay = '#'.concat(selectId, '-text');

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
	window.addEventListener('load', function() {
		selectPay('order_01-selectPay-noBank');	
	})
</script>