<!-- 2021.11.26 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="VO" value="${productInfo.product.productVO}" />
<c:set var="Img" value="${productInfo.product}" />
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-3 offset-lg-1 product_02_main_img">
			<img id="p_main_img" src="data:image/jpeg;base64,${Img.main}" alt="상품상세페이지 메인 이미지">
		</div>
		<div class="col-lg-1 product_02_sub_img">

			<img id="p_sub_img1" class="product_02_sub_img_top"	src="data:image/jpeg;base64,${Img.sub1}" alt="상품상세페이지 서브 이미지">
			<img id="p_sub_img2" src="data:image/jpeg;base64,${Img.sub2}" alt="상품상세페이지 서브 이미지"> 
			<img id="p_sub_img3" src="data:image/jpeg;base64,${Img.sub3}" alt="상품상세페이지 서브 이미지">
		</div>

		<div class="col-lg-4 offset-lg-2">

			<div class="product_02_title">${VO.product_main_title}</div>

			<div class="product_02_discript">${VO.product_sub_title}</div>
			<div class="product_02_price">기준가 : <fmt:formatNumber value="${VO.product_price}"/>원</div>
			<div class="product_02_sale">햘인가 : <fmt:formatNumber value="${VO.product_price-VO.product_discount}"/>원 <p>${Math.round((VO.product_discount/VO.product_price)*100)}% 할인</p></div>
			

			<!-- <div class="product_02_option_area">
				<span class="product_02_option">옵션</span> 
				<select class="product_02_option_box">
					<option value="선택옵션 1">선택옵션 1</option>
					<option value="선택옵션 2">선택옵션 2</option>
					<option value="선택옵션 3">선택옵션 3</option>
					<option value="선택옵션 4">선택옵션 4</option>

				</select>

			</div> -->


			<div class="product_02_form product_02_option_area">
				<span class="product_02_option">수량</span>

				<form name="itemCountBox" id="itemCountBox_form_detail" action="${contextPath}/cart/addProductInCart.do" method="get">
					<div class="value-button cart_decrease" id="cart_decrease"	onclick="decreaseValue(this.id)">-</div>
					<input type="number" class="cart_item_count" id="cart_item_count" name="cart_count" value="1"	onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" />
					<div class="value-button cart_increase" id="cart_increase"	onclick="increaseValue(this.id)">+</div>
					<input id="cart_productId" type="hidden" name="product_id" value="${VO.product_id}">
				</form>

			</div>

			<hr>
			
			<form name="buyForm" action="${contextPath}/cart/addProductInCart.do" method="get">
				<input class="product_02_cart_btn user_btn_Bgreen" id="product_02_buy" type="button" value="바로구매" onclick="submitOrder('${VO.product_id}')">
				<input class="product_02_cart_btn user_btn_gray" id="product_02_cartIn" type="button" value="장바구니 담기">
			</form>

		</div>

	</div>
	
	<form id="NextPageInfo">
	</form>

	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-left product_02_mini_category_text">
			<a>상품 상세정보</a> 
			<a id="productCommentPage" onclick="productReview(this.id);">고객 후기</a> 
			<a id="productInfoPage" onclick="productReview(this.id);">배송 / 교환 /반품 안내</a> 
			<a id="productPQAPage" onclick="productReview(this.id);">상품 문의</a>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-10 offset-lg-1 product_02_item_detail text-center">
		<c:if test="${not empty Img.body}">
			<c:forEach var="bodyImg" items="${Img.body}" >
			<img src="data:image/jpeg;base64,${bodyImg}" alt="상품상세페이지 상품상세정보 이미지"><br>
			</c:forEach>
			
		</c:if>
		
		<div>
		<pre>${VO.product_body}</pre>
		</div>
			
		</div>

	</div>



</div>
<script>

	function productReview(id) {
		
		let form = document.getElementById("NextPageInfo");
		let input = document.createElement("input");
		
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "product_id");
		input.setAttribute("value", "${VO.product_id}");
		
		if(id == "productCommentPage") {
			form.action="${contextPath}/notice/productComment.do";
			
		} else if(id == "productPQAPage") {
			form.action="${contextPath}/notice/PQAListPage.do";
		} else if(id == "productInfoPage") {
			form.action="${contextPath}/product/productInfoPage.do";
		}
		
		form.method="GET";
		form.appendChild(input);
		form.submit();
		
	}

	/*---------- 수량 증감 input 박스 설정 ----------*/

	/* 수량 증감 */
	function increaseValue(tagId) {
		let countValue = parseInt(
				document.getElementById('cart_item_count').value, 10);

		countValue = isNaN(countValue) ? 0 : countValue;
		countValue++;
		document.getElementById('cart_item_count').value = countValue;
	};

	function decreaseValue(tagId) {

		let countValue = parseInt(
				document.getElementById('cart_item_count').value, 10);
		if (countValue <= 1) {
			alert("수량은 1보다 작을 수 없습니다.")
		};
		countValue = isNaN(countValue) ? 0 : countValue;
		countValue < 2 ? countValue = 2 : '';
		countValue--;
		document.getElementById('cart_item_count').value = countValue;
	};
	/* 수량입력 후 엔터 입력시 이벤트 */

	function searchEvt(targetValue, targetId) {

		if (targetValue == "" || targetValue < 1) {
			alert('수량은 1보다 작을 수 없습니다.');
			document.getElementById(targetId).value = 1;
		}

	}

	/* 수량입력 후 다른 영역 클릭 시 이벤트 */
	window.onload = eventPlus();

	function eventPlus() {

		document.itemCountBox.cart_item_count.onblur = eventGo;

	}
	function eventGo() {
		if (this.value == "" || this.value < 1) {
			alert('수량은 1보다 작을 수 없습니다.');
			document.getElementById(this.id).value = 1;
		}

	}
	
	/* 장바구니 담기 버튼 클릭 이벤트 */
	/* 2021.12.28 한건희 */
	$("#product_02_cartIn").on("click", function(e) {
	let product_id = document.getElementById("cart_productId").value;
	let cart_count = document.getElementById("cart_item_count").value;
	let userFind = "${userInfo.user_id}";
	let product_amount = ${VO.product_amount};
	
	if(product_amount == 0) {
		alert("죄송합니다 상품이 품절되었습니다.");
	}else if(product_amount < cart_count) {
		alert("죄송합니다 현재 상품 재고는" + product_amount + "개 남았습니다.");
	}else {
		/* 비로그인 시 팝업창 */
		if(userFind == null || userFind == "") {
			let notUser = confirm("현재 비회원 상태 입니다. 비회원으로 주문 하시겠습니까?확인(예), 취소(로그인 or 회원가입)");
			if(notUser == false) {
				location='${contextPath}/user/loginpage.do';
			} else {
				$.ajax({
					url:'${contextPath}/cart/addProductInCart.do', 
					type:'GET',
					dataType: 'text', 
					data: {
						"product_id": product_id, 
						"cart_count": cart_count
					}, success: function(find) {
						let cartGo;
						let cartIn;
						/* 해당 상품이 장바구니에 있을 경우 수량 변경 여부 */
						if(find == "overLapProduct") {
							cartIn = confirm("장바구니에 해당 상품이 있습니다. 수량을 추가하시겠습니까?");
							if(cartIn == true) {
								$.ajax({
									url:'${contextPath}/cart/cartInProductOverLap.do', 
									type:'GET',
									dataType: 'text', 
									data: {
										"product_id": product_id, 
										"cart_count": cart_count
									}, success: function() {
										
									}
									}).error(function() {
										alert('수량 변경이 실패했습니다. 잠시 후 다시 시도해 주세요.');
									});
							}
						}
						else {
							cartGo = confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?");
							if(cartGo == true) {
								location='${contextPath}/cart/cartList.do';
							}
						}
					}
					}).error(function() {
						alert('장바구니에 담기 실패했습니다. 잠시 후 다시 시도해 주세요.');
					});
			}
		} else {
			$.ajax({
				url:'${contextPath}/cart/addProductInCart.do', 
				type:'GET',
				dataType: 'text', 
				data: {
					"product_id": product_id, 
					"cart_count": cart_count
				}, success: function(find) {
					let cartGo;
					let cartIn;
					/* 해당 상품이 장바구니에 있을 경우 수량 변경 여부 */
					if(find == "overLapProduct") {
						cartIn = confirm("장바구니에 해당 상품이 있습니다. 수량을 추가하시겠습니까?");
						if(cartIn == true) {
							$.ajax({
								url:'${contextPath}/cart/cartInProductOverLap.do', 
								type:'GET',
								dataType: 'text', 
								data: {
									"product_id": product_id, 
									"cart_count": cart_count
								}, success: function() {
									
								}
								}).error(function() {
									alert('수량 변경이 실패했습니다. 잠시 후 다시 시도해 주세요.');
								});
						}
					}
					else {
						cartGo = confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?");
						if(cartGo == true) {
							location='${contextPath}/cart/cartList.do';
						}
					}
				}
				}).error(function() {
					alert('장바구니에 담기 실패했습니다. 잠시 후 다시 시도해 주세요.');
				});
		}
		}
	});
	
	// 바로구매 스크립트
	function submitOrder(product_id) {
		var count = parseInt(document.getElementById('cart_item_count').value, 10);
		var form = document.createElement("form");
		
		form.setAttribute("charset", "UTF-8");
	    form.setAttribute("method", "Post");
	    form.setAttribute("action", "${contextPath}/order/order_form.do");
	    
	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "product_id");
	    hiddenField.setAttribute("value", product_id);
	    form.appendChild(hiddenField);
	    
	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "order_count_direct");
	    hiddenField.setAttribute("value", count);
	    form.appendChild(hiddenField);
 
	    document.body.appendChild(form);
	    form.submit();
	   }
</script>