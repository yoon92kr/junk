<!-- 2021.11.29 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${productList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${productList}" />

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
		<div class="col-lg-3 offset-lg-1 text-center order_01-content-body">
			상품 정보</div>
		<div class="col-lg-1 text-center order_01-content-body">수량</div>
		<div class="col-lg-2 text-center order_01-content-body">판매 가격</div>
		<div class="col-lg-2  text-center order_01-content-body">할인 금액</div>
		<div class="col-lg-2 text-center order_01-content-body">결제 금액</div>
	</div>

	<c:set var="total_price" value="0" />

	<c:forEach var="i" begin="1" end="${itemSize}">
		<c:set var="key" value="product${i}" />


		<div class="row">
			<div class="col-lg-3 offset-lg-1 order_01-content-item-img">
				<img class="cart_image_clip" src="data:image/jpeg;base64,${itemList[key].product.main}" alt="상품 이미지"> 
				<span class="order_img_to_title">${itemList[key].product.productVO.product_main_title}</span>
			</div>
			<div class="col-lg-1 text-center order_01-content-item">
				<fmt:formatNumber value="${itemList[key].count.order_amount}" /> 개
			</div>
			<div class="col-lg-2 text-center order_01-content-item">
				<fmt:formatNumber value="${itemList[key].product.productVO.product_price * itemList[key].count.order_amount}" /> 원
			</div>
			<div class="col-lg-2  text-center order_01-content-item">
				<span class="order_red_font"> 
				<fmt:formatNumber value="${itemList[key].product.productVO.product_discount * itemList[key].count.order_amount}" /> 원
				</span>
			</div>
			<div class="col-lg-2 text-center order_01-content-item">
				<fmt:formatNumber value="${(itemList[key].product.productVO.product_price - itemList[key].product.productVO.product_discount) * itemList[key].count.order_amount}" /> 원
			</div>
			<c:set var="total_price" value="${total_price + (itemList[key].product.productVO.product_price - itemList[key].product.productVO.product_discount) * itemList[key].count.order_amount }" />
		</div>
		<input type="hidden" name="product_id" value="${itemList[key].product.productVO.product_id}=${itemList[key].count.order_amount}">

	</c:forEach>

	<div class="row">
		<div class="col-lg-4 offset-lg-7 text-right">
			<div class="order_01-content-item-price order_total_price_margin">
				
				<c:if test='${total_price >= 30000 }'>
					<span>최종 주문 금액 : </span> <span class="order_01-content-price"><fmt:formatNumber value="${total_price}" />원</span>
					<span class="order_01-content-price order_red_font_small">(배송비 무료)</span>
				</c:if>
				<c:if test='${total_price < 30000 }'>
					<span>최종 주문 금액 : </span> <span class="order_01-content-price"><fmt:formatNumber value="${total_price+5000}" />원</span>	
					<span class="order_01-content-price order_red_font_small">(배송비 5,000원 포함)</span>
				</c:if>

			</div>
		</div>
	</div>
	<c:if test="${total_price < 30000 }">
		<c:set var="total_price" value="${total_price + 5000 }" />
	</c:if>
	<div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header">
			<h4 class="order_01-content-hedaer-text">주문자 정보</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-3 offset-lg-1 text-center order_01-content-body ">
			아이디</div>
		<div class="col-lg-4 text-center order_01-content-body">이름</div>
		<div class="col-lg-3 text-center order_01-content-body">연락처</div>
	</div>

	<c:if test="${not empty userInfo}">
		<div class="row">
			<div class="col-lg-3 offset-lg-1 text-center order_01-content-item">${userInfo.user_id}</div>
			<div class="col-lg-4 text-center order_01-content-item">${userInfo.user_name}</div>
			<div class="col-lg-3 text-center order_01-content-item">${userInfo.user_mobile_1} - ${userInfo.user_mobile_2} - ${userInfo.user_mobile_3}</div>
		</div>
	</c:if>
	<c:if test="${empty userInfo}">
		<div class="row">
			<div class=" col-lg-10 offset-lg-1 text-center order_01-content-item">비회원 상태 입니다.</div>
		</div>
	</c:if>

	<form>
	<div class="row">
		<div
			class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-03">
			<h4 class="order_01-content-hedaer-text">배송 정보</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-body-top-line">
		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
			* 이 름</div>
		<div class="col-lg-9 join_02-main-right">
			<input class="join_02-text-box order_form_check" type="text" name="order_receiver_name" value="">
			<c:if test="${not empty userInfo}">
					 <span class="order_01-check-text">주문자 정보와 동일</span> <input class="order_01-check" type="checkbox" name="join_check_01" value="true" onclick="same_user_info()">
			</c:if>			

		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
			* 우편번호</div>
		<div class="col-lg-9 join_02-main-right">

			<input class="join_02-text-box order_form_check" type="text" name="order_receiver_post_code"> 
			<input class="join_02-submit-box" type="button" onclick="search_address()" value="우편번호 검색">

		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">* 도로명 주소</div>
		
		<div class="col-lg-9 join_02-main-right">

			<input class="join_02-text-box order_form_check" type="text" name="order_receiver_new_address">
			<span id="order_guide_new" class="order_guide"></span>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">* 지번 주소</div>
		
		<div class="col-lg-9 join_02-main-right">

			<input class="join_02-text-box order_form_check" type="text" name="order_receiver_old_address">
			<span id="order_guide_old" class="order_guide"></span>
		</div>
	</div>
		
	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">* 상세 주소</div>
		
		<div class="col-lg-9 join_02-main-right">

			<input class="join_02-text-box order_form_check" type="text" name="order_receiver_detail_address">
			<span id="order_guide_extra" class="order_guide"></span>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
			* 핸드폰 번호</div>
		<div class="col-lg-9 join_02-main-right">

			<select class="join_02-mobile admin_user_margin_left" id="receiver_mobile_1" name="order_receiver_mobile_1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
				<option value="070">070</option>
			</select> - <input class="join_02-mobile-02 order_form_check" type="number" oninput="join_02_mobile_number01(this, 4)" name="order_receiver_mobile_2"> - <input class="join_02-mobile-02 " type="number" oninput="join_02_mobile_number01(this, 4)" name="order_receiver_mobile_3">

		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
			주문 메세지</div>
		<div class="col-lg-9 join_02-main-right">

			<input class="join_02-text-box" type="text" name="order_message">

		</div>
	</div>

	<div class="row">
		<div
			class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-04">
			<h4 class="order_01-content-hedaer-text">결제 상세</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
			최종 주문 금액</div>
		<div class="col-lg-3 text-center order_01-content-body">보유 포인트</div>
		<div class="col-lg-3 text-center order_01-content-body">사용 포인트</div>
		<div class="col-lg-2  text-center order_01-content-body">결제 금액</div>
	</div>

	<div class="row">
		<div class="col-lg-2 offset-lg-1 text-center order_01-content-item">
			<span class="order_01-content-price"><fmt:formatNumber value="${total_price}" />원</span>
		</div>
		<c:if test="${empty userInfo}">
		<input type="hidden" value="0" id="user_point">
			<div class="col-lg-3 text-center order_01-content-item">-</div>
			<div class="col-lg-3 text-center order_01-content-item-point">
	
				-<input class="order_01-point-box text-center" type="hidden" name="order_payment_point" onchange="change_point()" readOnly value="0"> 
	
			</div>
			<div class="col-lg-2 text-center order_01-content-item">
				<span class="order_01-content-price" id="final_price"><fmt:formatNumber value="${total_price}" />원</span>
			</div>			
		</c:if>		

		<c:if test="${not empty userInfo}">
			<div class="col-lg-3 text-center order_01-content-item"><fmt:formatNumber value="${userInfo.user_point}" />원</div>
			<input type="hidden" value="${userInfo.user_point}" id="user_point">
			<div class="col-lg-3 text-center order_01-content-item-point">
	
				<input class="order_01-point-box text-center" type="number" name="order_payment_point" onchange="change_point()" onkeypress="if(event.keyCode=='13'){event.preventDefault(); change_point();}"> 
				<input class="order_01-point-box" type="button" value="전체 포인트 사용" onclick="use_all_point()">
	
			</div>
			<div class="col-lg-2 text-center order_01-content-item">
				<span class="order_01-content-price" id="final_price"><fmt:formatNumber value="${total_price}" />원</span>
			</div>
		</c:if>			


	</div>

	<div class="row">
		<div
			class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-04">
			<h4 class="order_01-content-hedaer-text">결제 방법 [가상계좌만 Test API로 구현되어 있습니다.]</h4>
		</div>
	</div>

	<div class="order_01-select-card-noBank-mobile">
		<div class="row">
			<div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
				결제 수단</div>
			<div class="col-lg-8 text-center order_01-content-body">

				<input id="order_01-selectPay-card" type="radio" name="order_payment" value="card" checked> 
				<label for="order_01-selectPay-card">신용 / 체크 카드</label> 
				<input id="order_01-selectPay-noBank" class="order_01-radio-btn" type="radio" name="order_payment" value="noBank"> 
				<label for="order_01-selectPay-noBank">가상 계좌</label> 
				<input id="order_01-selectPay-mobile" class="order_01-radio-btn" type="radio" name="order_payment" value="mobile"> 
				<label for="order_01-selectPay-mobile">휴대폰 결제</label>

			</div>
		</div>


	</div>
	
	</form>
	<!-- 하단 버튼 -->
	<div class="row">
		<div class="col-lg-4 offset-lg-2 text-center order_01-bottom-btn">

			<a class="join_01-back" href="${contextPath}/cart/cartList.do"> <input
				class="cart_btn_gray" type="button" id="cs_02_02_list_btn"
				value="돌아가기">
			</a>

		</div>
		<div class="col-lg-4 text-center order_01-bottom-btn">
			<input class="cart_btn_Bgreen" type="button" id="payment-button" value="결제하기">
		</div>
	</div>

</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://js.tosspayments.com/v1"></script>
<script type="text/javascript">


	function join_02_mobile_number01(el, maxlength) {
		if (el.value.length > maxlength) {
			el.value = el.value.substr(0, maxlength);
		}
	}
	
//  2022.01.17 윤상현
	function same_user_info() {
		
		   let checkList = document.getElementsByName("join_check_01")[0];

			if(checkList.checked == true) {
				document.getElementsByName("order_receiver_name")[0].value = "${userInfo.user_name}";
				selectedOption("receiver_mobile_1", "${userInfo.user_mobile_1}");
				document.getElementsByName("order_receiver_mobile_2")[0].value = "${userInfo.user_mobile_2}";
				document.getElementsByName("order_receiver_mobile_3")[0].value = "${userInfo.user_mobile_3}";
				document.getElementsByName("order_receiver_post_code")[0].value = "${userInfo.user_post_code}";
				document.getElementsByName("order_receiver_old_address")[0].value = "${userInfo.user_old_address}";
				document.getElementsByName("order_receiver_new_address")[0].value = "${userInfo.user_new_address}";
				document.getElementsByName("order_receiver_detail_address")[0].value = "${userInfo.user_detail_address}";
                document.getElementById("order_guide_extra").innerHTML = '';
                document.getElementById("order_guide_extra").style.display = 'none';
            	document.getElementById("order_guide_old").innerHTML = '';
            	document.getElementById("order_guide_old").style.display = 'none';
            	document.getElementById("order_guide_new").innerHTML = '';
            	document.getElementById("order_guide_new").style.display = 'none';
				
			}
			
			else if(checkList.checked == false) {
				document.getElementsByName("order_receiver_name")[0].value = "";
				selectedOption("receiver_mobile_1", "010");
				document.getElementsByName("order_receiver_mobile_2")[0].value = "";
				document.getElementsByName("order_receiver_mobile_3")[0].value = "";
				document.getElementsByName("order_receiver_post_code")[0].value = "";
				document.getElementsByName("order_receiver_old_address")[0].value = "";
				document.getElementsByName("order_receiver_new_address")[0].value = "";
				document.getElementsByName("order_receiver_detail_address")[0].value = "";
                document.getElementById("order_guide_extra").innerHTML = '';
                document.getElementById("order_guide_extra").style.display = 'none';
            	document.getElementById("order_guide_old").innerHTML = '';
            	document.getElementById("order_guide_old").style.display = 'none';
            	document.getElementById("order_guide_new").innerHTML = '';
            	document.getElementById("order_guide_new").style.display = 'none';
			}
		
		}

// id에는 select의 id값, value에는 선택하고자 하는 option의 value 값을 파라미터로 입력한다.
	
	function selectedOption(id, value) {
		var obj = document.getElementById(id);
	
		for (i=0 ; i<obj.length ; i++) {
		if(obj[i].value == value) {
		obj[i].selected = true;
		      }
		   }
		}
	
	
	// 포인트 전체 사용 스크립트
	function use_all_point(){
		// 결제 금액이 보유 포인트보다 작을 경우
		if(${total_price < userInfo.user_point}) {
			document.getElementsByName("order_payment_point")[0].value = "${total_price}";
		}
		else {
			document.getElementsByName("order_payment_point")[0].value = "${userInfo.user_point}";
		}
		
		change_point();
	}
	
	function change_point() {
		
		var using_point = parseInt(document.getElementsByName("order_payment_point")[0].value);
		var user_point = parseInt(document.getElementById('user_point').value);

			// 사용 포인트가 보유 포인트보다 클 경우
			if(using_point > user_point) {

				if(${total_price} < user_point) {
					
					document.getElementById('final_price').innerText = "${total_price - total_price}".toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+'원';
					document.getElementsByName("order_payment_point")[0].value = "${total_price}";

				}
				else {
					
					document.getElementById('final_price').innerText = ("${total_price}"-user_point).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+'원';
					document.getElementsByName("order_payment_point")[0].value = user_point;

				}

			}
			
			else {

				if(${total_price} < using_point) {
					
					document.getElementById('final_price').innerText = "${total_price - total_price}".toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+'원';
					document.getElementsByName("order_payment_point")[0].value = "${total_price}";

					
				}
					
				else {

					document.getElementById('final_price').innerText = ("${total_price}"- using_point).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+'원';
					document.getElementsByName("order_payment_point")[0].value = using_point;
				}

				
			}
		
	}
	
	 function search_address() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementsByName('order_receiver_post_code')[0].value = data.zonecode;
	                document.getElementsByName("order_receiver_new_address")[0].value = roadAddr;
	                document.getElementsByName("order_receiver_old_address")[0].value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("order_guide_extra").innerHTML = extraRoadAddr;
	                    document.getElementById("order_guide_extra").style.display = 'inline';
	                } else {
	                    document.getElementById("order_guide_extra").innerHTML = '';
	                    document.getElementById("order_guide_extra").style.display = 'none';
	                }

	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    document.getElementById("order_guide_new").innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    document.getElementById("order_guide_new").style.display = 'inline';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    document.getElementById("order_guide_old").innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    document.getElementById("order_guide_old").style.display = 'inline';
	                } else {
	                	document.getElementById("order_guide_old").innerHTML = '';
	                	document.getElementById("order_guide_old").style.display = 'none';
	                	document.getElementById("order_guide_new").innerHTML = '';
	                	document.getElementById("order_guide_new").style.display = 'none';
	                }
	            }
	        }).open();
	    }
	 
	 function orderByPay() {
		 
		 let checkList = document.getElementsByName("order_payment");
		 let payMent = "";
		 
		 if(checkList.length > 0) {
			 for(i=0 ; i<checkList.length ; i++) {
				 if(checkList[i].checked == true) {
					 payMent = checkList[i].value;   
					 }  
				 }
			 }
		 switch(payMent) {
		    case "card" :
		    	payMent = "카드";
		       break;
		    case "noBank" :
		    	payMent = "가상계좌";
		       break;
		    case "mobile" :
		    	payMent = "휴대폰";
		       break; 
		    }

		 return payMent;
		 }
	 
	 
	 var payButton = document.getElementById('payment-button');
	    
	 // 토스 결제 api 연동 스크립트
	 payButton.addEventListener('click', function () {
		 
		 var use_point = document.getElementsByName("order_payment_point")[0].value;
		 var order_product = "${itemList.product1.product.productVO.product_main_title}";
		 var customer = document.getElementsByName("order_receiver_name")[0].value;
		 var order_id_rand1 = Math.floor(Math.random() * (100000 - 100)) + 100;
		 var order_id_rand2 = Math.floor(Math.random() * (100000 - 100)) + 100;
		 var order_id = 'baroip_order_'+order_id_rand1+'_'+order_id_rand2;
		 var order_amount = "${total_price}"- use_point
		 let payMent = orderByPay();

		 if(${itemSize > 1}) {
			 order_product += " 외 ${itemSize-1}건";
		 }

		 var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq';
		 var tossPayments = TossPayments(clientKey);
		 var orderDetail = {
				 amount: order_amount,
		         orderId: order_id,
		         orderName: order_product,
		         customerName: customer,
		         successUrl: 'http://baroip.shop${contextPath}/order/order_complete.do',
	             failUrl: 'http://baroip.shop{contextPath}/cart/cartList.do'
		 };
		 
		 var elements = document.getElementsByClassName('order_form_check'); // body 이미치 파일 select
			var checkFlag = true;

			for(var i = 0; i < elements.length; i++){
				
				let uploadItem = elements[i].value;

				if(!uploadItem) {
					checkFlag = false;
				}
				
				
			}
			
			if(checkFlag) {
				if(payMent == '가상계좌') {
					
					if("${total_price}"- use_point == 0) {
						order_to_dbms(order_id, payMent);
						document.location='${contextPath}/order/order_complete.do?order_id='+order_id+'&order_amount='+order_amount;
					}
					else {
						order_to_dbms(order_id, payMent);
						tossPayments.requestPayment(payMent, orderDetail);  
					}
				}
				else {
					tossPayments.requestPayment(payMent, orderDetail);  
				}
				
				
			}
			else {
				alert("필수입력(*)란을 모두 작성해주세요.");
			}
		 		 

			

		
		  
	 })
	 
	 	
	/* 상품 주문 ajax */
	function order_to_dbms(order_id, payMent) {

		   let product_id = document.getElementsByName("product_id");
		   let user_id = "${userInfo.user_id}";
		   let productList = new Array();
		   let order_point = document.getElementsByName('order_payment_point')[0].value;
		   for(i=0 ; i<product_id.length ; i++) {
			   productList.push(product_id[i].value);  
		   }
		   
		   if(order_point == null || order_point == "") {
			   order_point = 0;
		   }
		   
		   if(${userInfo.user_id == null}) {
			   user_id = "Not_log_in";
		   }
		   
			$.ajax({
				type : "post",
				async : false,
				url : "${contextPath}/order/order_product.do",
				dataType : "text",
				data : {
					"order_payment" : payMent,
					"user_id" : user_id,
					"order_product_list" : JSON.stringify(productList),
					"order_id" : order_id,
					"order_receiver_name" : document.getElementsByName('order_receiver_name')[0].value,
					"order_receiver_post_code" : document.getElementsByName('order_receiver_post_code')[0].value,
					"order_receiver_new_address" : document.getElementsByName('order_receiver_new_address')[0].value,
					"order_receiver_old_address" : document.getElementsByName('order_receiver_old_address')[0].value,
					"order_receiver_detail_address" : document.getElementsByName('order_receiver_detail_address')[0].value,
					"order_receiver_mobile_1" : document.getElementsByName('order_receiver_mobile_1')[0].value,
					"order_receiver_mobile_2" : document.getElementsByName('order_receiver_mobile_2')[0].value,
					"order_receiver_mobile_3" : document.getElementsByName('order_receiver_mobile_3')[0].value,
					"order_message" : document.getElementsByName('order_message')[0].value,
					"order_payment_point" : order_point,
										
				},
				success : function() {

				},
				error : function() {
					alert("주문에 문제가 발생하였습니다.");
					document.location='${contextPath}/main.do';
				}

			});
	
			

	
	}

	
	      
 
</script>